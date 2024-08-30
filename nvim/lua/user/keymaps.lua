-- Shorten function name
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic mappings
keymap("n", "<Space>", "<Nop>", opts) -- Remap space as leader key

-- General mappings
keymap("n", "<C-c>", ":wq<CR>", opts)
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", opts)
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", opts)
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual mappings
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- File and Buffer Handling via Telescope
keymap("n", "<leader>g", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader><leader>", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<CR>", opts)

-- Nvim-tree
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

-- LSP
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

-- Clipboard
keymap({"n", "v"}, "<leader>y", '"+y', opts)
keymap({"n", "v"}, "<leader>Y", '"+Y', opts)

-- Another ChatGPT Plugin
keymap({"n", "v"}, "<leader>ai", "<cmd>GpChatNew vsplit<cr>", opts)
keymap({"n", "v"}, "<leader>aic", "<cmd>% GpChatNew vsplit<cr>", opts)
keymap({"n", "v"}, "<leader>aif", "<cmd>GpChatFinder<cr>", opts)
keymap({"n", "v"}, "<leader>air", ":<C-u>'<,'>GpRewrite<cr>", opts)
keymap({"n", "v"}, "<leader>ait", "<cmd>GpChatToggle vsplit<cr>", opts)
keymap({"n", "v"}, "<leader>aia", ":<C-u>'<,'>GpAppend<cr>", opts)
keymap({"n", "v"}, "<leader>aip", ":<C-u>'<,'>GpPrepend<cr>", opts)

-- GitHub
keymap("n", "<leader>gg", ':Git<CR>', opts)
keymap("n", "<leader>go", ':GBrowse<CR>', opts)
keymap("n", "<leader>gdiff", ':DiffViewOpen<CR>', opts)

-- Trouble
keymap("n", "<leader>xx", ':TroubleToggle<CR>', opts)

-- Triggers the first LSP code action available. Useful to, for example,
-- quickly fix missing imports.
vim.keymap.set('n', '<leader>ff', function()
  local params = vim.lsp.util.make_range_params()
  params.context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }

  local result, err = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 1000)

  if not result or vim.tbl_isempty(result) then
    print("No code actions available")
    return
  end

  for _, server_actions in pairs(result) do
    if server_actions.result and server_actions.result[1] then
      local action = server_actions.result[1]
      if action.edit or type(action.command) == "table" then
        if action.edit then
          vim.lsp.util.apply_workspace_edit(action.edit)
        end
        if type(action.command) == "table" then
          local command = action.command
          vim.lsp.buf.execute_command(command)
        end
      else
        vim.lsp.buf.execute_command(action)
      end
      break
    end
  end
end, opts)
--
-- -- Opens a popup window to LSP rename
vim.keymap.set("n", "<leader>r", function()
  local cmdId
  cmdId = vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
    callback = function()
      local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
      vim.api.nvim_feedkeys(key, "c", false)
      vim.api.nvim_feedkeys("0", "n", false)
      -- autocmd was triggered and so we can remove the ID and return true to delete the autocmd
      cmdId = nil
      return true
    end,
  })

  vim.lsp.buf.rename()
  -- if LPS couldn't trigger rename on the symbol, clear the autocmd
  vim.defer_fn(function()
    -- the cmdId is not nil only if the LSP failed to rename
    if cmdId then
      vim.api.nvim_del_autocmd(cmdId)
    end
  end, 500)
end, opts)
