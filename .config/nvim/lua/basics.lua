vim.g.mapleader = " "
vim.o.number  = true
vim.o.wrap = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.swapfile = false
vim.o.scrolloff = 5
vim.o.errorbells = false
vim.o.termguicolors = true
vim.o.numberwidth = 4
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

-- < or > doesn't cancel selection
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })

-- remap hjkl to jkl;
vim.api.nvim_set_keymap('', ';', 'l', { noremap = true })
vim.api.nvim_set_keymap('', 'l', 'k', { noremap = true })
vim.api.nvim_set_keymap('', 'k', 'j', { noremap = true })
vim.api.nvim_set_keymap('', 'j', 'h', { noremap = true })

-- split
vim.api.nvim_set_keymap('n', 'vs', ':vs<CR>', { noremap = true })

-- find string shortcut
vim.api.nvim_set_keymap('n', '<C-S>', ':%s/', { noremap = true })

-- tab navigation
vim.api.nvim_set_keymap('', '<C-Tab>', 'gt', { noremap = true })
vim.api.nvim_set_keymap('', '<C-S-Tab>', 'gT', { noremap = true })
