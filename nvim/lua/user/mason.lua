nvim_lsp = require('lspconfig')

require("mason").setup()
require("mason-lspconfig").setup()

require 'lspconfig'.eslint.setup{}
require 'lspconfig'.jedi_language_server.setup{}
require 'lspconfig'.solargraph.setup{
  cmd = { "bundle", "exec", "solargraph", "stdio" },
}
require 'lspconfig'.sorbet.setup{
  cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
}
require 'lspconfig'.tsserver.setup{}
