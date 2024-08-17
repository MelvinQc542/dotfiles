-- Vhyrro's way - more explanatory than typecraft's
-- print("Hello")
--[[
-- Variables types explanation
--
-- vim.b --> buffer   vim.bo --> buffer options
-- vim.w --> window   vim.wo --> window options
-- vim.t --> tab      vim.to --> tab options
-- vim.g --> global   vim.o --> global options
-- vim.opt / vim.opt_local
--
]]--

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2 -- for >> or << utilization
vim.opt.softtabstop = 2

vim.opt.clipboard = "unnamedplus" -- to synchronize nvim and system clipboards

vim.opt.scrolloff = 10

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.g.background = "light"

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
-- Options proposed by typecraft
--[[
vim.opt.swapfile = false
vim.wo.number = true
]]--
