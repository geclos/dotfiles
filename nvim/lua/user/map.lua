-- Quickly add keybindings such as map('n', '<CR>', ':noh<CR><CR>', {noremap = true})
function map(mode, combo, mapping, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, combo, mapping, options)
end
