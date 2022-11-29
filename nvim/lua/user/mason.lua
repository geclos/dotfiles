nvim_lsp = require('lspconfig')

require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").sorbet.setup {
  cmd = { "bundle", "exec", "srb", "tc", "--lsp" }
}
require'lspconfig'.solargraph.setup{
  cmd = { "bundle", "exec", "solargraph", "stdio" }
}
require'lspconfig'.tsserver.setup{}
