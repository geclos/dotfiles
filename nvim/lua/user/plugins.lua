-- Automatically install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "nvim-lua/plenary.nvim" },
  { "FooSoft/vim-argwrap" },
  { "cohama/lexima.vim" },
  { "peitalin/vim-jsx-typescript" },
  { "matze/vim-move" },
  { "mg979/vim-visual-multi" },
  { "tomtom/tcomment_vim" },
  { "tpope/vim-dispatch" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "tpope/vim-surround" },
  { "wellle/targets.vim" },
  { "goolord/alpha-nvim" },
  { "ahmedkhalf/project.nvim" },
  {
    "janko/vim-test",
    dependencies = { "benmills/vimux" }
  },
  { "prettier/vim-prettier" },
  { "hashivim/vim-terraform" },
  { "szw/vim-maximizer" },
  {
    "klen/nvim-config-local",
    config = function()
      require('config-local').setup {
        -- Default configuration (optional)
        config_files = { ".vimrc.lua", ".vimrc" },  -- Config file patterns to load (lua supported)
        hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
        autocommands_create = true,                 -- Create autocommands (VimEnter, DirectoryChanged)
        commands_create = true,                     -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
        silent = false,                             -- Disable plugin messages (Config loaded/ignored)
      }
    end,
  },

  -- Command completions
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/nvim-cmp" },
  { "saadparwaiz1/cmp_luasnip" },
  { "AndrewRadev/splitjoin.vim" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },

  -- Colorschemes
  { "artanikin/vim-synthwave84" },
  { "ellisonleao/gruvbox.nvim" },
  { "lunarvim/colorschemes" },
  { "lunarvim/darkplus.nvim" },
  { "tanvirtin/monokai.nvim" },
  { "shaunsingh/solarized.nvim" },
  { "yorickpeterse/vim-paper" },
  { "catppuccin/nvim", name = "catppuccin" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
    },
  },

  -- Nvim-tree
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },

  -- LSP
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
  },

  -- Find and replace
  { "windwp/nvim-spectre" },

  -- Copilot
  { "github/copilot.vim" },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Floating cmd line
  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
  },

  -- Python black formatter
  { "psf/black" },

  -- ChatGPT plugin
  { "robitx/gp.nvim" },

  -- Trouble
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    "preservim/vim-markdown",
    dependencies = { "godlygeek/tabular" },
  },

  -- Better markdown previews
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- Tmux integration
  { "christoomey/vim-tmux-navigator" },

  -- Rose pine colorscheme
  { "rose-pine/neovim" },

  -- Popup with keybinding suggestions
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- Configuration here (if any)
      }
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
}

require('lazy').setup(plugins)
