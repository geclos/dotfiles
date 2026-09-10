# AI agent architecture snapshots

This repository tracks portable agent architecture files for these destinations:

| Snapshot | Destination | Contribution |
| --- | --- | --- |
| `opencode/` | `~/.config/opencode` | Primary orchestrator and focused minion prompts; selects the orchestrator by default. |
| `pi/agent/` | `~/.pi/agent` | Active Sol main agent with Astra advisor and Terra minion extensions. |
| `mcp/mcp.json` | `~/.config/mcp/mcp.json` | Sanitized global MCP definitions. |
| `pi/architectures/main-minion/` | Rollback snapshot | Previous Sol orchestrator, Terra minion, adversarial reviewer, and subagent extension. |
| `claude/` | `~/.claude` | Orchestrator instructions and the focused minion definition. |

The sanitized settings files retain only model/default-selection values. Sanitized MCP definitions are tracked, while credentials, OAuth/auth state, sessions, caches, plugins, generated files, `settings.local.json`, machine-specific hooks, permissions, and other local runtime state remain excluded.
