require("mason").setup()
require("mason-lspconfig").setup()

-- languages
-- require 'lspconfig'.clangd.setup{}
-- require 'lspconfig'.lua_ls.setup{}
-- require 'lspconfig'.svelte.setup{}
require 'lspconfig'.tsserver.setup{}
require 'lspconfig'.pyright.setup{
  on_new_config = function(new_config, root_dir)
    local pipfile_exists = require("lspconfig").util.search_ancestors(root_dir, function(path)
      local pipfile = require("lspconfig").util.path.join(path, "Pipfile")
      if require("lspconfig").util.path.is_file(pipfile) then
        return true
      else
        return false
      end
    end)

    if pipfile_exists then
      new_config.cmd = { "pipenv", "run", "pyright-langserver", "--stdio" }
    end
  end,
}
