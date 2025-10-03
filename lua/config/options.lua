-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false
vim.g.ai_cmp = false

vim.opt.colorcolumn = "81"
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.expandtab = false

vim.cmd([[highlight CursorLineNr guifg=#89dceb]])
vim.cmd([[highlight LineNr guifg=#89dceb]])
vim.cmd([[highlight LineNrAbove guifg=#a6e3a1]])
vim.cmd([[highlight LineNrBelow guifg=#eba0ac]])
