nvim_lsp = require('lspconfig')

require("mason").setup()
require("mason-lspconfig").setup()

-- languages
require 'lspconfig'.svelte.setup{}
require 'lspconfig'.tsserver.setup{}
require 'lspconfig'.pyright.setup{}
