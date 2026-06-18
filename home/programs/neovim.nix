{ pkgs, pkgs-unstable, ... }:
{
	programs.neovim = {
		package = pkgs-unstable.neovim-unwrapped;
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;

		extraPackages = with pkgs; [
			git
			ripgrep
			fd
			fzf
		];

		plugins = with pkgs.vimPlugins; [
			fzf-lua
			nvim-lspconfig
			nvim-cmp
			cmp-nvim-lsp
			cmp-buffer
			cmp-path
			luasnip
			cmp_luasnip
		];

		initLua = ''
			-- BASIC SETTINGS
			vim.opt.number = true
			vim.opt.cursorline = true

			vim.opt.tabstop = 4
			vim.opt.shiftwidth = 4
			vim.opt.expandtab = true
			vim.opt.smartindent = true

			vim.opt.wrap = false
			vim.opt.scrolloff = 5
			vim.opt.scroll = 5

			vim.opt.ignorecase = true
			vim.opt.smartcase = true

			vim.opt.termguicolors = true
			vim.opt.clipboard = "unnamedplus"
			vim.opt.swapfile = false

			vim.g.mapleader = " "

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

			-- PLUGIN CONFIG
			require("fzf-lua").setup({
				winopts = {
					height = 0.85,
					width = 0.80,
					preview = { layout = "vertical", vertical = "down:50%" },
				},
			})

			-- COMPLETION
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
			})

			-- LSP
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = false,
				signs = false,
				underline = false,
				update_in_insert = false,
			})

			local on_lsp_attach = function(_, bufnr)
				local map = function(mode, lhs, rhs)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
				end

				map("n", "gd", vim.lsp.buf.definition)
				map("n", "gD", vim.lsp.buf.declaration)
				map("n", "gi", vim.lsp.buf.implementation)
				map("n", "gr", vim.lsp.buf.references)
				map("n", "h", vim.lsp.buf.hover)
			end

			local servers = {
				{ name = "zls", command = "zls" },
				{ name = "rust_analyzer", command = "rust-analyzer" },
				{ name = "gopls", command = "gopls" },
				{ name = "clangd", command = "clangd" },
			}

			for _, server in ipairs(servers) do
				if vim.fn.executable(server.command) == 1 then
					vim.lsp.config(server.name, {
						capabilities = capabilities,
						on_attach = on_lsp_attach,
					})
					vim.lsp.enable(server.name)
				end
			end

			-- KEYBINDINGS
			-- Indent without losing selection
			vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
			vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })

			-- Remap hjkl to jkl;
			vim.api.nvim_set_keymap("", ';', 'l', { noremap = true })
			vim.api.nvim_set_keymap("", 'l', 'k', { noremap = true })
			vim.api.nvim_set_keymap("", 'k', 'j', { noremap = true })
			vim.api.nvim_set_keymap("", 'j', 'h', { noremap = true })

			-- Scroll viewport with Shift+K (down) and Shift+L (up)
			vim.api.nvim_set_keymap('n', 'K', '<C-d>', { noremap = true })
			vim.api.nvim_set_keymap('n', 'L', '<C-u>', { noremap = true })

			-- Quick save/quit
			vim.keymap.set("n", "<leader>w", ":w<CR>")
			vim.keymap.set("n", "<leader>q", ":q<CR>")

			-- Clear search highlight
			vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>")

			-- FUZZY FINDER
			vim.keymap.set("n", "<C-p>", "<cmd>FzfLua files<cr>")
			vim.keymap.set("n", "<C-S-f>", "<cmd>FzfLua live_grep<cr>")

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
			vim.api.nvim_set_keymap("", 'h', nop, opts)
		'';
	};
}
