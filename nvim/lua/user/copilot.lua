vim.g.copilot_no_tab_map = 'v:true'
map('i', '<C-J>', 'copilot#Accept(<CR>)', { script = true, expr = true, silent = true })
