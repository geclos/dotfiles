local options = {
  expandtab = true,                        -- convert tabs to spaces
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  numberwidth = 2,                         -- set number column width to 2 {default 4}
  relativenumber = false,                  -- set relative numbered lines
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  swapfile = false,                        -- creates a swapfile
  tabstop = 2,                             -- insert 2 spaces for a tab
  timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- faster completion (4000ms default)
  wrap = false,                            -- display lines as one long line
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end
