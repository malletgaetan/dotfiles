-- PLUGIN MANAGER
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- PLUGINS
require("lazy").setup({
    {
        "ibhagwan/fzf-lua",
        config = function()
            require("fzf-lua").setup({
                winopts = {
                    height = 0.85,
                    width = 0.80,
                    preview = { layout = "vertical", vertical = "down:50%" },
                },
            })
        end
    },
})

-- BASIC SETTINGS
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.scrolloff = 8

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

-- COLORSCHEME
vim.cmd("colorscheme default")
vim.cmd("set background=dark")

vim.api.nvim_set_hl(0, "Normal",       { fg = "#c0c0c0", bg = "#1a1a1a" })
vim.api.nvim_set_hl(0, "Comment",      { fg = "#606060", italic = true })
vim.api.nvim_set_hl(0, "Keyword",      { fg = "#a0a0a0", bold = true })
vim.api.nvim_set_hl(0, "String",       { fg = "#909090" })
vim.api.nvim_set_hl(0, "Number",       { fg = "#b0b0b0" })
vim.api.nvim_set_hl(0, "Function",     { fg = "#d0d0d0" })
vim.api.nvim_set_hl(0, "Type",         { fg = "#b0b0b0" })
vim.api.nvim_set_hl(0, "Identifier",   { fg = "#c0c0c0" })
vim.api.nvim_set_hl(0, "Statement",    { fg = "#a0a0a0" })
vim.api.nvim_set_hl(0, "PreProc",      { fg = "#909090" })
vim.api.nvim_set_hl(0, "Special",      { fg = "#a0a0a0" })
vim.api.nvim_set_hl(0, "LineNr",       { fg = "#505050" })
vim.api.nvim_set_hl(0, "CursorLine",   { bg = "#252525" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#808080", bold = true })
vim.api.nvim_set_hl(0, "Visual",       { bg = "#404040" })
vim.api.nvim_set_hl(0, "Search",       { fg = "#1a1a1a", bg = "#808080" })
vim.api.nvim_set_hl(0, "StatusLine",   { fg = "#909090", bg = "#252525" })

-- KEYBINDINGS
vim.g.mapleader = " "

-- Indent without losing selection
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })

-- Remap hjkl to jkl;
vim.api.nvim_set_keymap('', ';', 'l', { noremap = true })
vim.api.nvim_set_keymap('', 'l', 'k', { noremap = true })
vim.api.nvim_set_keymap('', 'k', 'j', { noremap = true })
vim.api.nvim_set_keymap('', 'j', 'h', { noremap = true })

-- Scroll viewport with Shift+K (down) and Shift+L (up)
vim.api.nvim_set_keymap('n', 'K', '<C-d>', { noremap = true })
vim.api.nvim_set_keymap('n', 'L', '<C-u>', { noremap = true })

-- Quick save/quit
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Clear search highlight
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>")

-- FUZZY FINDER
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua files<cr>")      -- find files
vim.keymap.set("n", "<leader>g", "<cmd>FzfLua live_grep<cr>")  -- grep in project
vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<cr>")    -- open buffers
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua grep_curbuf<cr>")-- search current file

-- DISABLE ACCIDENTAL KEYS
local nop = '<Nop>'
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'Q', nop, opts)
vim.api.nvim_set_keymap('n', 'ZZ', nop, opts)
vim.api.nvim_set_keymap('n', 'ZQ', nop, opts)
vim.api.nvim_set_keymap('n', '<C-z>', nop, opts)
vim.api.nvim_set_keymap('n', 's', nop, opts)
vim.api.nvim_set_keymap('n', 'S', nop, opts)
vim.api.nvim_set_keymap('n', 'J', nop, opts)
vim.api.nvim_set_keymap('n', 'q', nop, opts)
vim.api.nvim_set_keymap('n', 'm', nop, opts)
vim.api.nvim_set_keymap('n', '<C-f>', nop, opts)
vim.api.nvim_set_keymap('n', '<C-b>', nop, opts)
vim.api.nvim_set_keymap('n', '<F1>', nop, opts)
vim.api.nvim_set_keymap('i', '<F1>', nop, opts)
vim.api.nvim_set_keymap('', 'h', nop, opts)
