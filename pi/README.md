# Pi agent configuration

This directory contains a portable snapshot of this host's Pi agent architecture, not a full backup of `~/.pi/agent`.

## Active architecture

| Role | Model | Behavior |
| --- | --- | --- |
| Main agent | `openai-codex/gpt-5.6-sol` (`medium`) | Owns the conversation, plans work, uses tools, and performs final verification. |
| Advisor | `openai-codex/gpt-6-astra` (`high`) | Receives the main agent's effective system prompt and active conversation, then returns read-only strategic guidance without tools. |
| Minion | `openai-codex/gpt-5.6-terra` (`medium`) | Runs one focused implementation packet in a separate Pi process and context. It has normal coding tools and shares the main agent's working directory; it is not sandboxed. |

After initial read-only orientation, the main agent consults the advisor before delegating non-trivial work, then uses the minion by default for self-contained implementation and low-level work, including focused investigation, mechanical or repetitive edits, migrations, and test writing. The main agent retains task decomposition, decisions, integration, and final verification; it works directly only for tiny fixes, synthesis, final verification, explicitly user-requested direct work, or when the minion is unavailable. Each minion packet includes exact scope, relevant context, constraints, and verification commands; the main agent does not edit the same files while it runs and inspects its changes afterward.

`agent/settings.json` intentionally retains only the portable startup model selection. The two extension entrypoints contain the advisor and minion behavior. The previous Sol-orchestrator/subagent setup is retained as the checksum-protected rollback snapshot in `architectures/main-minion/`.

## Restore

Prerequisites:

- A compatible Pi installation providing the extension APIs used by these files.
- The `pi` executable on `PATH`, including for the minion subprocess.
- Model access and authentication configured separately for all three models.

Back up the destination first. Copy only the extension entrypoints:

```sh
mkdir -p ~/.pi/agent/extensions/advisor ~/.pi/agent/extensions/minion
cp pi/agent/extensions/advisor/index.ts ~/.pi/agent/extensions/advisor/index.ts
cp pi/agent/extensions/minion/index.ts ~/.pi/agent/extensions/minion/index.ts
```

Disable the legacy architecture if it is installed:

```sh
rm -rf ~/.pi/agent/extensions/subagent
rm -f ~/.pi/agent/agents/minion.md ~/.pi/agent/agents/adversarial-reviewer.md
```

Merge the three fields from `agent/settings.json` into the destination's existing `settings.json`; do **not** replace the whole destination file, because it may contain package and UI preferences. For example, with `jq`:

```sh
tmp="$(mktemp)"
jq -s '.[0] * .[1]' ~/.pi/agent/settings.json pi/agent/settings.json > "$tmp" && \
  mv "$tmp" ~/.pi/agent/settings.json
```

On a fresh installation with no destination settings, copy `pi/agent/settings.json` directly instead. Restart Pi into a new session to apply the startup defaults; `/reload` reloads extensions but does not switch the current session's model, and resumed sessions may retain their prior model.

When restoring `architectures/main-minion/`, also remove or disable the active `extensions/advisor` and `extensions/minion` directories in the destination. Its checksum-protected restoration notes predate these extensions, and leaving them installed would mix both architectures.

Do not copy credentials, OAuth state, sessions, caches, telemetry configuration, model catalogues, package installations, trust decisions, or other machine-local runtime state into this repository.
