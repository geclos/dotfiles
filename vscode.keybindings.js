// Place your key bindings in this file to override the defaults
[
    { "key": "cmd+escape", "command": "workbench.action.terminal.toggleTerminal" },
    { "key": "cmd+e",      "command": "workbench.files.action.showActiveFileInExplorer",
                           "when": "editorTextFocus" },
    { "key": "cmd+enter",  "command": "explorer.openToSide",
                           "when": "explorerViewletFocus && explorerViewletVisible && !inputFocus" },
    { "key": "cmd+c",      "command": "search.action.copyPath",
                           "when": "fileMatchOrFolderMatchFocus" },
    { "key": "enter",   "command": "list.select",
                           "when": "listFocus && !inputFocus" }
]
