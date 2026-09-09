# Pi main-minion architecture

This is the portable rollback snapshot for the Pi main-minion architecture.
It uses Sol as the main orchestrator and Terra as the implementation minion.

To restore it in this repository:

```sh
rm -rf pi/agent/extensions/advisor pi/agent/extensions/subagent pi/agent/agents
mkdir -p pi/agent/extensions
cp -R pi/architectures/main-minion/agents pi/agent/agents
cp -R pi/architectures/main-minion/extensions/subagent pi/agent/extensions/subagent
cp pi/architectures/main-minion/settings.json pi/agent/settings.json
```

Then copy the portable files to `~/.pi/agent` without replacing local credentials, sessions, caches, packages, or unrelated extensions.
Run `shasum -a 256 -c SHA256SUMS` in this directory to verify the snapshot.
