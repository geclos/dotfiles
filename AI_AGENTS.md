# AI agent architecture snapshots

This repository tracks only the portable orchestrator↔minion architecture for these destinations:

| Snapshot | Destination | Contribution |
| --- | --- | --- |
| `opencode/` | `~/.config/opencode` | Primary orchestrator and focused minion prompts; selects the orchestrator by default. |
| `pi/agent/` | `~/.pi/agent` | Minion and adversarial-reviewer definitions plus the subagent extension that discovers and runs isolated agents. |
| `claude/` | `~/.claude` | Orchestrator instructions and the focused minion definition. |

The sanitized settings files retain only model/default-selection values. MCP configuration, secrets, OAuth/auth state, sessions, caches, plugins, generated files, `settings.local.json`, machine-specific hooks, permissions, and other local runtime state are intentionally excluded.
