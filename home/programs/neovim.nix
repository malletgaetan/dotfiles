{ pkgs, ... }:
{
	programs.neovim = {
		package = pkgs.neovim-unwrapped;
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

		initLua = builtins.readFile ./neovim/init.lua;
	};
}
