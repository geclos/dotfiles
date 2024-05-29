-- Open configuration file --
vim.api.nvim_create_user_command(
  'Config',
  function()
    -- Open the init.lua configuration file located in ~/.config/nvim/
    vim.cmd('edit ~/.config/nvim/init.lua')
  end,
  { nargs = 0 } -- No arguments are needed for this command
)

-- Source init.lua --
local function source_init()
  local ok, err = pcall(dofile, vim.fn.stdpath('config') .. '/init.lua')
  if not ok then
    vim.notify('Error sourcing init.lua: ' .. err, vim.log.levels.ERROR)
  else
    vim.notify('Successfully sourced init.lua', vim.log.levels.INFO)
  end
end
vim.api.nvim_create_user_command('ConfigLoad', source_init, {})
