-- Vimscripts
vim.cmd("source ~/.config/nvim/lua/user/copilot.vim")

-- Lua
require "user.options"
require "user.keymaps"
require "user.alpha"
require "user.cmp" 
require "user.indent-blankline"
require "user.plugins"
require "user.project"
require "user.colorscheme"
require "user.lsp"
require "user.telescope"
require "user.nvimtree"
require "user.vim-test"
