-- Required so that :GBrowser works correctly
vim.api.nvim_create_user_command(
  'Browse',
  function(opts)
    vim.fn.system('open ' .. vim.fn.shellescape(opts.args, true))
  end,
  { nargs = 1 }
)
