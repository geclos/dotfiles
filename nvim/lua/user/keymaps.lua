local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close current buffer
keymap("n", "<leader>c", ":q", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-j>", "<Esc>:m .+1<CR>==g", opts)
keymap("v", "<C-k>", "<Esc>:m .-2<CR>==g", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "<leader><leader>", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>g", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>b", ":Buffers<CR>", opts)

-- nvim-tree
keymap("n", "<leader>m", ":NvimTreeFindFileToggle<CR>", opts)
keymap("n", "<leader>m!", ":NvimTreeFindFileToggle!<CR>", opts)

-- Spectre
keymap("n", "<leader>R", "<cmd>lua require('spectre').open()<CR>", opts)

-- vim-test
keymap("n", "<leader>tf", ":TestFile -strategy=neovim<CR>", opts) 
keymap("n", "<leader>tl", ":TestNearest -strategy=neovim<CR>", opts) 
keymap("n", "<leader>tr", ":TestLast -strategy=neovim<CR>", opts) 
keymap("n", "<leader>to", ":Copen -strategy=neovim<CR>", opts) 

-- vim argwrap
keymap("n", "<leader>a", ":ArgWrap<CR>", opts)

-- vim maximizer
keymap("n", "<leader>f", ":MaximizerToggle!<CR>", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- LSP --
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

-- Clipboard goodies --
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y') -- yank motion
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y') -- yank line

-- ChatGPT --
-- vim.keymap.set('n', '<leader>ai', ':ChatGPT<CR>')
-- vim.keymap.set({'n', 'v'}, '<leader>aie', ':ChatGPTEditWithInstructions<CR>')

-- NeoAI --
-- vim.keymap.set('n', '<leader>ai', ':NeoAIToggle<CR>')
-- vim.keymap.set('n', '<leader>aic', ':NeoAIContext<CR>')
-- vim.keymap.set('v', '<leader>ai', ":NeoAIContext<CR>")

-- Another ChatGPT plugin --
vim.keymap.set("n", "<leader>ai", "<cmd>GpChatNew vsplit<cr>", opts)
vim.keymap.set("n", "<leader>aic", "<cmd>% GpChatNew vsplit<cr>", opts)
vim.keymap.set("n", "<leader>aif", "<cmd>GpChatFinder<cr>", opts)
vim.keymap.set("n", "<leader>ait", "<cmd>GpChatToggle vsplit<cr>", opts)
vim.keymap.set("v", "<leader>ai", ":<C-u>'<,'>GpChatNew vsplit<cr>", opts)
vim.keymap.set("v", "<leader>air", ":<C-u>'<,'>GpRewrite<cr>", opts)


-- Github --
vim.keymap.set('n', '<leader>gg', ':GBrowse<CR>')

-- Trouble --
vim.keymap.set('n', '<leader>xx', ':TroubleToggle<CR>')
