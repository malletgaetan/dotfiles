vim.g.mapleader = " "
vim.o.number  = true
vim.o.wrap = false
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.swapfile = false
vim.o.splitright = true
vim.o.scrolloff = 3
vim.o.errorbells = false
vim.o.shiftwidth = 2
vim.o.termguicolors = true
vim.o.numberwidth = 4
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'

-- < or > doesn't cancel selection
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })

-- remap hjkl to jkl;
vim.api.nvim_set_keymap('', ';', 'l', { noremap = true })
vim.api.nvim_set_keymap('', 'l', 'k', { noremap = true })
vim.api.nvim_set_keymap('', 'k', 'j', { noremap = true })
vim.api.nvim_set_keymap('', 'j', 'h', { noremap = true })

vim.api.nvim_set_keymap('n', 'vs', ':vs<CR>', { noremap = true })

-- find string shortcut
vim.api.nvim_set_keymap('n', '<C-S>', ':%s/', { noremap = true })
