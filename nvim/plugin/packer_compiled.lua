-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/gerardclos/.cache/nvim/packer_hererocks/2.1.1710088188/share/lua/5.1/?.lua;/Users/gerardclos/.cache/nvim/packer_hererocks/2.1.1710088188/share/lua/5.1/?/init.lua;/Users/gerardclos/.cache/nvim/packer_hererocks/2.1.1710088188/lib/luarocks/rocks-5.1/?.lua;/Users/gerardclos/.cache/nvim/packer_hererocks/2.1.1710088188/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/gerardclos/.cache/nvim/packer_hererocks/2.1.1710088188/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  black = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/black",
    url = "https://github.com/psf/black"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  colorschemes = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/colorschemes",
    url = "https://github.com/lunarvim/colorschemes"
  },
  ["copilot-cmp"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16copilot_cmp\frequire\0" },
    load_after = {
      ["copilot.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    after = { "copilot-cmp" },
    commands = { "Copilot" },
    config = { "\27LJ\2\nˆ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\npanel\1\0\1\fenabled\1\15suggestion\1\0\2\npanel\0\15suggestion\0\1\0\1\fenabled\1\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["darkplus.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/darkplus.nvim",
    url = "https://github.com/lunarvim/darkplus.nvim"
  },
  ["fine-cmdline.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/fine-cmdline.nvim",
    url = "https://github.com/VonHeikemen/fine-cmdline.nvim"
  },
  ["gp.nvim"] = {
    config = { "\27LJ\2\n…\r\0\0\14\0!\0M6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0006\3\3\0009\3\4\3'\5\5\0B\3\2\2=\3\a\0024\3\6\0005\4\b\0005\5\t\0=\5\n\4'\5\v\0'\6\f\0'\a\r\0'\b\14\0'\t\15\0'\n\16\0'\v\17\0'\f\18\0'\r\19\0&\5\r\5=\5\20\4>\4\1\0035\4\21\0005\5\22\0=\5\n\4'\5\v\0'\6\f\0'\a\r\0'\b\14\0'\t\15\0'\n\16\0'\v\17\0'\f\18\0'\r\19\0&\5\r\5=\5\20\4>\4\2\0035\4\23\0005\5\24\0=\5\n\4'\5\v\0'\6\f\0'\a\r\0'\b\14\0'\t\15\0'\n\16\0'\v\17\0'\f\18\0'\r\19\0&\5\r\5=\5\20\4>\4\3\0035\4\25\0005\5\26\0=\5\n\4'\5\27\0'\6\28\0'\a\29\0&\5\a\5=\5\20\4>\4\4\0035\4\30\0005\5\31\0=\5\n\4'\5\27\0'\6\28\0'\a\29\0&\5\a\5=\5\20\4>\4\5\3=\3 \2B\0\2\1K\0\1\0\vagents\1\0\3\nmodel\vgpt-4o\ntop_p\3\1\16temperature\4š³æÌ\t™³¦ÿ\3\1\0\5\18system_prompt\0\fcommand\2\tname\15CodeGPT3-5\nmodel\0\tchat\1)START AND END YOUR ANSWER WITH:\n\n```>Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n.You are an AI working as a code editor.\n\n\1\0\3\nmodel\vgpt-4o\ntop_p\3\1\16temperature\4š³æÌ\t™³¦ÿ\3\1\0\5\18system_prompt\0\fcommand\2\tname\rCodeGPT4\nmodel\0\tchat\1\1\0\3\nmodel\vgpt-4o\ntop_p\3\1\16temperature\4š³æÌ\t™³Æÿ\3\1\0\5\18system_prompt\0\fcommand\1\tname\15ChatGPT3-5\nmodel\0\tchat\2\1\0\3\nmodel\vgpt-4o\ntop_p\3\1\16temperature\4š³æÌ\t™³Æÿ\3\1\0\5\18system_prompt\0\fcommand\1\tname\rChatGPT4\nmodel\0\tchat\2\18system_prompt,- Take a deep breath; You've got this!\nL- Don't elide any code from your output if the answer requires coding.\nG- Use Socratic method to improve your thinking and coding skills.\nJ- Zoom out first to see the big picture and then zoom in to details.\nF- Think deeply and carefully from first principles step by step.\nH- Ask question if you need clarification to provide better answer.\nD- If you're unsure don't guess and say you don't know instead.\nVThe user provided the additional info about how they would like you to respond:\n\n&You are a general AI assistant.\n\n\nmodel\1\0\3\nmodel\vgpt-4o\ntop_p\3\1\16temperature\4š³æÌ\t™³Æÿ\3\1\0\5\18system_prompt\0\fcommand\2\tname\19ChatGPT4Latest\nmodel\0\tchat\2\19openai_api_key\1\0\3\vagents\0\25chat_topic_gen_model\vgpt-4o\19openai_api_key\0\19OPENAI_API_KEY\vgetenv\aos\nsetup\agp\frequire\0" },
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/gp.nvim",
    url = "https://github.com/robitx/gp.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/lexima.vim",
    url = "https://github.com/cohama/lexima.vim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["monokai.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/monokai.nvim",
    url = "https://github.com/tanvirtin/monokai.nvim"
  },
  neovim = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/neovim",
    url = "https://github.com/rose-pine/neovim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-config-local"] = {
    config = { "\27LJ\2\ný\1\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0026\3\6\0009\3\a\0039\3\b\3'\5\t\0B\3\2\2'\4\n\0&\3\4\3=\3\v\2B\0\2\1K\0\1\0\rhashfile\18/config-local\tdata\fstdpath\afn\bvim\17config_files\1\0\5\24autocommands_create\2\rhashfile\0\17config_files\0\vsilent\1\20commands_create\2\1\3\0\0\15.vimrc.lua\v.vimrc\nsetup\17config-local\frequire\0" },
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/nvim-config-local",
    url = "https://github.com/klen/nvim-config-local"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ripgrep = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/ripgrep",
    url = "https://github.com/BurntSushi/ripgrep"
  },
  ["solarized.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/solarized.nvim",
    url = "https://github.com/shaunsingh/solarized.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  tabular = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  tcomment_vim = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/tcomment_vim",
    url = "https://github.com/tomtom/tcomment_vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-argwrap"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-argwrap",
    url = "https://github.com/FooSoft/vim-argwrap"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-jsx-typescript"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-jsx-typescript",
    url = "https://github.com/peitalin/vim-jsx-typescript"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-move",
    url = "https://github.com/matze/vim-move"
  },
  ["vim-paper"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-paper",
    url = "https://github.com/yorickpeterse/vim-paper"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-synthwave84"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-synthwave84",
    url = "https://github.com/artanikin/vim-synthwave84"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-terraform",
    url = "https://github.com/hashivim/vim-terraform"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/janko/vim-test"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  vimux = {
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/vimux",
    url = "https://github.com/benmills/vimux"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0" },
    loaded = true,
    path = "/Users/gerardclos/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gp.nvim
time([[Config for gp.nvim]], true)
try_loadstring("\27LJ\2\n…\r\0\0\14\0!\0M6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0006\3\3\0009\3\4\3'\5\5\0B\3\2\2=\3\a\0024\3\6\0005\4\b\0005\5\t\0=\5\n\4'\5\v\0'\6\f\0'\a\r\0'\b\14\0'\t\15\0'\n\16\0'\v\17\0'\f\18\0'\r\19\0&\5\r\5=\5\20\4>\4\1\0035\4\21\0005\5\22\0=\5\n\4'\5\v\0'\6\f\0'\a\r\0'\b\14\0'\t\15\0'\n\16\0'\v\17\0'\f\18\0'\r\19\0&\5\r\5=\5\20\4>\4\2\0035\4\23\0005\5\24\0=\5\n\4'\5\v\0'\6\f\0'\a\r\0'\b\14\0'\t\15\0'\n\16\0'\v\17\0'\f\18\0'\r\19\0&\5\r\5=\5\20\4>\4\3\0035\4\25\0005\5\26\0=\5\n\4'\5\27\0'\6\28\0'\a\29\0&\5\a\5=\5\20\4>\4\4\0035\4\30\0005\5\31\0=\5\n\4'\5\27\0'\6\28\0'\a\29\0&\5\a\5=\5\20\4>\4\5\3=\3 \2B\0\2\1K\0\1\0\vagents\1\0\3\nmodel\vgpt-4o\ntop_p\3\1\16temperature\4š³æÌ\t™³¦ÿ\3\1\0\5\18system_prompt\0\fcommand\2\tname\15CodeGPT3-5\nmodel\0\tchat\1)START AND END YOUR ANSWER WITH:\n\n```>Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n.You are an AI working as a code editor.\n\n\1\0\3\nmodel\vgpt-4o\ntop_p\3\1\16temperature\4š³æÌ\t™³¦ÿ\3\1\0\5\18system_prompt\0\fcommand\2\tname\rCodeGPT4\nmodel\0\tchat\1\1\0\3\nmodel\vgpt-4o\ntop_p\3\1\16temperature\4š³æÌ\t™³Æÿ\3\1\0\5\18system_prompt\0\fcommand\1\tname\15ChatGPT3-5\nmodel\0\tchat\2\1\0\3\nmodel\vgpt-4o\ntop_p\3\1\16temperature\4š³æÌ\t™³Æÿ\3\1\0\5\18system_prompt\0\fcommand\1\tname\rChatGPT4\nmodel\0\tchat\2\18system_prompt,- Take a deep breath; You've got this!\nL- Don't elide any code from your output if the answer requires coding.\nG- Use Socratic method to improve your thinking and coding skills.\nJ- Zoom out first to see the big picture and then zoom in to details.\nF- Think deeply and carefully from first principles step by step.\nH- Ask question if you need clarification to provide better answer.\nD- If you're unsure don't guess and say you don't know instead.\nVThe user provided the additional info about how they would like you to respond:\n\n&You are a general AI assistant.\n\n\nmodel\1\0\3\nmodel\vgpt-4o\ntop_p\3\1\16temperature\4š³æÌ\t™³Æÿ\3\1\0\5\18system_prompt\0\fcommand\2\tname\19ChatGPT4Latest\nmodel\0\tchat\2\19openai_api_key\1\0\3\vagents\0\25chat_topic_gen_model\vgpt-4o\19openai_api_key\0\19OPENAI_API_KEY\vgetenv\aos\nsetup\agp\frequire\0", "config", "gp.nvim")
time([[Config for gp.nvim]], false)
-- Config for: nvim-config-local
time([[Config for nvim-config-local]], true)
try_loadstring("\27LJ\2\ný\1\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0026\3\6\0009\3\a\0039\3\b\3'\5\t\0B\3\2\2'\4\n\0&\3\4\3=\3\v\2B\0\2\1K\0\1\0\rhashfile\18/config-local\tdata\fstdpath\afn\bvim\17config_files\1\0\5\24autocommands_create\2\rhashfile\0\17config_files\0\vsilent\1\20commands_create\2\1\3\0\0\15.vimrc.lua\v.vimrc\nsetup\17config-local\frequire\0", "config", "nvim-config-local")
time([[Config for nvim-config-local]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Copilot', function(cmdargs)
          require('packer.load')({'copilot.lua'}, { cmd = 'Copilot', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'copilot.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Copilot ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
