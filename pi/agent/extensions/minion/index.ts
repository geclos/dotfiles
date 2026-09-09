import { spawn } from "node:child_process";
import { StringDecoder } from "node:string_decoder";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import type { Usage } from "@earendil-works/pi-ai";
import { truncateTail } from "@earendil-works/pi-coding-agent";
import { Type } from "typebox";

const MINION_MODEL = "openai-codex/gpt-5.6-terra";
const MINION_THINKING_LEVEL = "medium";
const MINION_SYSTEM_PROMPT = `You are Minion, a focused implementation subagent. Complete one delegated work packet.

Rules:
- Stay inside the delegated scope.
- Read relevant code before you change it.
- Make the smallest correct change.
- Preserve unrelated worktree changes. Do not revert, overwrite, or clean up work you did not make.
- Do not delegate work or call advisor.
- Run focused verification when feasible.

End with:
- Result: what you accomplished.
- Files: paths you changed or inspected that matter.
- Verification: commands and outcomes, or why you did not run them.
- Risks: blockers, assumptions, or follow-up needed.`;

interface AssistantResult {
  text?: string;
  model?: string;
  provider?: string;
  stopReason?: string;
  errorMessage?: string;
  usage?: Usage;
}

function usageFromValue(value: unknown): Usage | undefined {
  if (!value || typeof value !== "object") return undefined;
  const usage = value as Record<string, unknown>;
  const cost = usage.cost;
  if (
    typeof usage.input !== "number" ||
    typeof usage.output !== "number" ||
    typeof usage.cacheRead !== "number" ||
    typeof usage.cacheWrite !== "number" ||
    typeof usage.totalTokens !== "number" ||
    !cost ||
    typeof cost !== "object"
  ) {
    return undefined;
  }
  const costValues = cost as Record<string, unknown>;
  if (
    typeof costValues.input !== "number" ||
    typeof costValues.output !== "number" ||
    typeof costValues.cacheRead !== "number" ||
    typeof costValues.cacheWrite !== "number" ||
    typeof costValues.total !== "number"
  ) {
    return undefined;
  }
  return {
    input: usage.input,
    output: usage.output,
    cacheRead: usage.cacheRead,
    cacheWrite: usage.cacheWrite,
    totalTokens: usage.totalTokens,
    cost: {
      input: costValues.input,
      output: costValues.output,
      cacheRead: costValues.cacheRead,
      cacheWrite: costValues.cacheWrite,
      total: costValues.total,
    },
  };
}

function assistantResultFromEvent(value: unknown): AssistantResult | undefined {
  if (!value || typeof value !== "object") return undefined;
  const event = value as Record<string, unknown>;
  if (event.type !== "message_end" || !event.message || typeof event.message !== "object") return undefined;

  const message = event.message as Record<string, unknown>;
  if (message.role !== "assistant" || !Array.isArray(message.content)) return undefined;

  const text = message.content
    .flatMap((block) => {
      if (!block || typeof block !== "object") return [];
      const content = block as Record<string, unknown>;
      return content.type === "text" && typeof content.text === "string" ? [content.text] : [];
    })
    .join("\n")
    .trim();

  return {
    text: text || undefined,
    model: typeof message.model === "string" ? message.model : undefined,
    provider: typeof message.provider === "string" ? message.provider : undefined,
    stopReason: typeof message.stopReason === "string" ? message.stopReason : undefined,
    errorMessage: typeof message.errorMessage === "string" ? message.errorMessage : undefined,
    usage: usageFromValue(message.usage),
  };
}

function stopProcess(child: ReturnType<typeof spawn>): void {
  if (process.platform === "win32" || !child.pid) {
    child.kill("SIGTERM");
    return;
  }

  try {
    process.kill(-child.pid, "SIGTERM");
  } catch {
    child.kill("SIGTERM");
  }
}

export default function (pi: ExtensionAPI) {
  pi.registerTool({
    name: "minion",
    label: "Minion",
    description:
      "Delegate one focused code implementation or low-level work packet to a Terra subagent with an isolated context.",
    promptSnippet: "Delegate one focused implementation work packet to the Terra minion",
    promptGuidelines: [
      "For non-trivial delegated work, consult advisor before delegating to minion.",
      "Use minion by default for self-contained implementation and low-level work, including focused investigation, mechanical or repetitive edits, migrations, and test writing.",
      "The main agent owns task decomposition, decisions, integration, and final verification; direct work is limited to tiny fixes, synthesis, final verification, explicitly user-requested direct work, or when minion is unavailable.",
      "Give minion exact scope, relevant context, constraints, and verification commands. Do not edit the same files while it runs; inspect its changes afterward.",
    ],
    parameters: Type.Object(
      {
        task: Type.String({ description: "A self-contained implementation task with scope, constraints, and checks." }),
      },
      { additionalProperties: false },
    ),
    executionMode: "sequential",

    async execute(_toolCallId, params, signal, onUpdate, ctx) {
      const task = params.task.trim();
      if (!task) throw new Error("Minion task must not be empty.");
      if (signal?.aborted) throw new Error("Minion was aborted before it started.");

      const args = [
        "--mode",
        "json",
        "--print",
        "--no-session",
        "--no-extensions",
        "--model",
        MINION_MODEL,
        "--thinking",
        MINION_THINKING_LEVEL,
        "--tools",
        "read,bash,edit,write,grep,find,ls",
        "--append-system-prompt",
        MINION_SYSTEM_PROMPT,
        "--",
        task,
      ];
      const child = spawn("pi", args, {
        cwd: ctx.cwd,
        detached: process.platform !== "win32",
        stdio: ["ignore", "pipe", "pipe"],
      });
      let stderr = "";
      let finalResult: AssistantResult | undefined;
      let buffer = "";
      const decoder = new StringDecoder("utf8");
      let malformedJsonLines = 0;
      let streamError: Error | undefined;
      let totalUsage: Usage | undefined;
      let aborted = false;
      let killTimer: ReturnType<typeof setTimeout> | undefined;

      const consumeLine = (line: string) => {
        if (!line.trim()) return;
        let event: unknown;
        try {
          event = JSON.parse(line);
        } catch {
          malformedJsonLines += 1;
          return;
        }

        const result = assistantResultFromEvent(event);
        if (!result) return;
        finalResult = result;
        if (result.usage) {
          totalUsage = totalUsage
            ? {
                input: totalUsage.input + result.usage.input,
                output: totalUsage.output + result.usage.output,
                cacheRead: totalUsage.cacheRead + result.usage.cacheRead,
                cacheWrite: totalUsage.cacheWrite + result.usage.cacheWrite,
                totalTokens: totalUsage.totalTokens + result.usage.totalTokens,
                cost: {
                  input: totalUsage.cost.input + result.usage.cost.input,
                  output: totalUsage.cost.output + result.usage.cost.output,
                  cacheRead: totalUsage.cost.cacheRead + result.usage.cost.cacheRead,
                  cacheWrite: totalUsage.cost.cacheWrite + result.usage.cost.cacheWrite,
                  total: totalUsage.cost.total + result.usage.cost.total,
                },
              }
            : result.usage;
        }
        if (result.text) {
          const preview = truncateTail(result.text, { maxBytes: 8 * 1024, maxLines: 200 }).content;
          onUpdate?.({ content: [{ type: "text", text: `Minion working:\n${preview}` }], details: {} });
        }
      };

      const onAbort = () => {
        aborted = true;
        stopProcess(child);
        killTimer = setTimeout(() => {
          if (child.exitCode === null && child.signalCode === null) {
            if (process.platform !== "win32" && child.pid) {
              try {
                process.kill(-child.pid, "SIGKILL");
                return;
              } catch {
                // Fall through to killing the direct child.
              }
            }
            child.kill("SIGKILL");
          }
        }, 5_000);
        killTimer.unref();
      };

      if (signal?.aborted) onAbort();
      else signal?.addEventListener("abort", onAbort, { once: true });

      try {
        const exitCode = await new Promise<number | null>((resolve, reject) => {
          child.stdout.on("data", (data: Buffer) => {
            try {
              buffer += decoder.write(data);
              if (Buffer.byteLength(buffer, "utf8") > 256 * 1024) {
                streamError = new Error("Minion emitted an event line larger than 256KB.");
                stopProcess(child);
                return;
              }
              const lines = buffer.split("\n");
              buffer = lines.pop() ?? "";
              for (const line of lines) consumeLine(line);
            } catch (error) {
              streamError = error instanceof Error ? error : new Error(String(error));
              stopProcess(child);
            }
          });
          child.stderr.on("data", (data: Buffer) => {
            stderr = `${stderr}${data.toString()}`.slice(-8 * 1024);
          });
          child.on("error", reject);
          child.on("close", (code) => {
            consumeLine(`${buffer}${decoder.end()}`);
            resolve(code);
          });
        });

        if (aborted) throw new Error("Minion was aborted.");
        if (exitCode !== 0) {
          throw new Error(`Minion failed with exit code ${exitCode ?? "signal"}: ${stderr.trim() || "no stderr"}`);
        }
        if (streamError) throw streamError;
        if (malformedJsonLines > 0) {
          throw new Error(`Minion emitted ${malformedJsonLines} malformed JSON event(s).`);
        }
        if (finalResult?.stopReason !== "stop") {
          throw new Error(finalResult?.errorMessage ?? `Minion did not complete: ${finalResult?.stopReason ?? "no final response"}.`);
        }
        if (finalResult.provider !== "openai-codex" || finalResult.model !== "gpt-5.6-terra") {
          throw new Error(`Minion used an unexpected provider or model: ${finalResult.provider ?? "none"}/${finalResult.model ?? "none"}.`);
        }
        if (!finalResult.text) {
          throw new Error(`Minion returned no final report: ${stderr.trim() || "no output"}`);
        }

        const truncated = truncateTail(finalResult.text);
        const truncationNotice = truncated.truncated
          ? "\n\n[Minion output was truncated to the configured tool limit.]"
          : "";
        return {
          content: [{ type: "text", text: `${truncated.content}${truncationNotice}` }],
          details: {
            model: `${MINION_MODEL} (verified from child response)`,
            thinkingLevel: MINION_THINKING_LEVEL,
            outputTruncated: truncated.truncated,
          },
          usage: totalUsage,
        };
      } finally {
        if (killTimer) clearTimeout(killTimer);
        signal?.removeEventListener("abort", onAbort);
      }
    },
  });
}
