local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim"                   -- Have packer manage itself
  use "nvim-lua/plenary.nvim"                    -- Useful lua functions used ny lots of plugins
  use "AndrewRadev/splitjoin.vim"                -- Transform oneliners into multiple lines of code
  use "FooSoft/vim-argwrap"                      -- Argument wrapping and unwrapping
  use "cespare/vim-toml"                         -- Toml syntax
  use "cohama/lexima.vim"                        -- Auto close parentheses, ruby blocks and more
  use "jremmen/vim-ripgrep"                      -- Global grep, faster than usual grep
  use "leafgarland/typescript-vim"               -- Typescript syntax
  use "matze/vim-move"                           -- Move lines easily
  use "mg979/vim-visual-multi"                   -- Column editing
  use "tpope/vim-commentary"                     -- Helpers for easy code comments
  use "tpope/vim-dispatch"                       -- Dispatch tests from vim
  use "tpope/vim-fugitive"                       -- Git goodies
  use "tpope/vim-rhubarb"                        -- Gihtub hooks for vim fugitive
  use "tpope/vim-surround"                       -- Surround helpers
  use "wellle/targets.vim"                       -- Enhancements to Vim's text selection
  use "lukas-reineke/indent-blankline.nvim"      -- Show indentation.
  use "goolord/alpha-nvim"                       -- Welcome screen
  use "ahmedkhalf/project.nvim"                  -- Project detection
  use 'janko/vim-test'                           -- Run tests from vim
  use {       
    "klen/nvim-config-local",                    -- Load local vimrc configs, the configuration needs to be included.
    config = function()                     
      require('config-local').setup {
        -- Default configuration (optional)
        config_files = { ".vimrc.lua", ".vimrc" },  -- Config file patterns to load (lua supported)
        hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
        autocommands_create = true,                 -- Create autocommands (VimEnter, DirectoryChanged)
        commands_create = true,                     -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
        silent = false,                             -- Disable plugin messages (Config loaded/ignored)
      }
    end
  }

  -- Command completions
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- Required by the lsp plugin
  use "hrsh7th/cmp-path" -- path completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- NvimTree
  use 'kyazdani42/nvim-web-devicons'
  use "kyazdani42/nvim-tree.lua"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Copilot
  use "github/copilot.vim"

  -- Find and replace
  use 'windwp/nvim-spectre'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
