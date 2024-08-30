-- Open configuration file --
vim.api.nvim_create_user_command(
  'Config',
  function()
    -- Open the init.lua configuration file located in ~/.config/nvim/
    vim.cmd('edit ~/.config/nvim/init.lua')
  end,
  { nargs = 0 } -- No arguments are needed for this command
)
