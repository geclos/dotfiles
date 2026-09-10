# MCP configuration snapshot

`mcp/mcp.json` is a sanitized snapshot of `~/.config/mcp/mcp.json`, not a complete runtime backup.

Back up the destination first, then copy or merge the definitions as appropriate; do not blindly overwrite an existing configuration that may contain host-specific settings. Pi requires `pi-mcp-adapter` to load this file. `EXA_API_KEY` must be available in Pi's launching environment or an external, untracked secret store.

Project `.mcp.json` and Pi-specific override files can take precedence over this global configuration.
