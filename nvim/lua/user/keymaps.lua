local wk = require("which-key")
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic mappings
keymap("", "<Space>", "<Nop>", opts) -- Remap space as leader key

-- General mappings
wk.register({
    ["<C-c>"] = { ":wq<CR>", "Fast file closing" },
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "Tmux Navigate Left" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "Tmux Navigate Down" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "Tmux Navigate Up" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "Tmux Navigate Right" },
    ["<C-d>"] = { "<C-d>zz", "Faster scrolling down" },
    ["<C-u>"] = { "<C-u>zz", "Faster scrolling up" },
    ["<S-l>"] = { ":bnext<CR>", "Next buffer" },
    ["<S-h>"] = { ":bprevious<CR>", "Previous buffer" },
}, {
    mode = "n",
    opts = opts
})


-- Visual mappings
wk.register({
    ["<C-j>"] = { "<Esc>:m .+1<CR>==g", "Move text down" },
    ["<C-k>"] = { "<Esc>:m .-2<CR>==g", "Move text up" }
}, {
    mode = "v",
    opts = opts
})

-- File and Buffer Handling via Telescope
wk.register({
    ["<leader><leader>"] = { ":Telescope find_files<CR>", "Find files" },
    ["<leader>g"] = { ":Telescope live_grep<CR>", "Live grep" },
    ["<leader>b"] = { ":Buffers<CR>", "Buffer list" }
}, {
    mode = "n",
    opts = opts
})

-- Nvim-tree
wk.register({
    ["<leader>m"] = { ":NvimTreeFindFileToggle<CR>", "Toggle NvimTree" },
    ["<leader>m!"] = { ":NvimTreeFindFileToggle!<CR>", "Toggle NvimTree aggressively" }
}, {
    mode = "n",
    opts = opts
})

-- Spectre
wk.register({
    ["<leader>R"] = { "<cmd>lua require('spectre').open()<CR>", "Open Spectre" }
}, {
    mode = "n",
    opts = opts
})

-- vim-test
wk.register({
    ["<leader>tf"] = { ":TestFile -strategy=neovim<CR>", "Test File" },
    ["<leader>tl"] = { ":TestNearest -strategy=neovim<CR>", "Test Nearest" },
    ["<leader>tr"] = { ":TestLast -strategy=neovim<CR>", "Test Last" },
    ["<leader>to"] = { ":Copen -strategy=neovim<CR>", "Open Test Output" }
}, {
    mode = "n",
    opts = opts
})

-- vim argwrap
wk.register({
    ["<leader>a"] = { ":ArgWrap<CR>", "ArgWrap" }
}, {
    mode = "n",
    opts = opts
})

-- vim maximizer
wk.register({
    ["<leader>f"] = { ":MaximizerToggle!<CR>", "Toggle Maximizer" }
}, {
    mode = "n",
    opts = opts
})

-- LSP
wk.register({
    K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    gD = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
    gR = { "<cmd>lua vim.lsp.buf.references()<CR>", "Go to References" }
}, {
    mode = "n",
    opts = opts
})

-- Terminal Navigation
for _, mode in pairs({ "t", "n" }) do
    wk.register({
        ["<C-h>"] = { "<C-\\><C-N><C-w>h", "Terminal left" },
        ["<C-j>"] = { "<C-\\><C-N><C-w>j", "Terminal down" },
        ["<C-k>"] = { "<C-\\><C-N><C-w>k", "Terminal up" },
        ["<C-l>"] = { "<C-\\><C-N><C-w>l", "Terminal right" }
    }, {
        mode = mode,
        opts = term_opts
    })
end

-- Clipboard
wk.register({
    ["<leader>y"] = { '"+y', "Yank-motion" },
    ["<leader>Y"] = { '"+Y', "Yank-line" }
}, {
    mode = { "n", "v" }
})

-- Another ChatGPT Plugin
wk.register({
    ["<leader>aic"] = { "<cmd>% GpChatNew vsplit<cr>", "GP Chat New Entire Buffer" },
    ["<leader>aif"] = { "<cmd>GpChatFinder<cr>", "GP Chat Finder" },
    ["<leader>air"] = { ":<C-u>'<,'>GpRewrite<cr>", "GP Rewrite" },
    ["<leader>ait"] = { "<cmd>GpChatToggle vsplit<cr>", "GP Chat Toggle" },
    -- ["<leader>aia"] = { ":<C-u>'<,'>GpAppend<cr>", "GP Append" },
    -- ["<leader>aip"] = { ":<C-u>'<,'>GpPrepend<cr>", "GP Prepend" },
}, {
    mode = { "n", "v" },
    opts = opts
})

wk.register({
  ["<leader>ai"] = { "<cmd>GpChatNew vsplit<cr>", "GP Chat New" },
  ["<leader>aia"] = { "<cmd>GPTedit<cr>", "Edit inline" },
}, {
  mode = "n",
  opts = opts
})

wk.register({
  ["<leader>ai"] = { ":<C-u>'<,'>GpChatToggle vsplit<cr>", "GP Chat Toggle" },
  ["<leader>aia"] = { ":<C-u>'<,'>GPTedit<cr>", "Edit inline" },
}, {
  mode = "v",
  opts = opts
})

-- GitHub
wk.register({
    ["<leader>gg"] = { ':GBrowse<CR>', "GitHub Browse" }
}, {
    mode = "n",
    opts = opts
})

-- Trouble
wk.register({
    ["<leader>xx"] = { ':TroubleToggle<CR>', "Trouble Toggle" }
}, {
    mode = "n",
    opts = opts
})
