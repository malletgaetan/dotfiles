{ pkgs, ... }:
{

	programs.kitty = {
		package = pkgs.kitty;
		enable = true;

		settings = {
			editor = "vim";
			font_family = "family='Monaspace Argon' features='-calt -liga -dlig'";
			bold_font = "auto";
			italic_font = "auto";
			bold_italic_font = "auto";
			disable_ligatures = "always";
			scrollback_lines = "10000";
			scrollback_pager = "nvim --cmd 'set eventignore=FileType' +'nnoremap q ZQ' +'call nvim_open_term(0, {})' +'set nomodified nolist' +'$' -";
			tab_bar_style = "powerline";
			tab_powerline_style = "slanted";
			enabled_layouts = "tall:bias=50;full_size=1;mirrored=false";
			placement_strategy = "top-left";
		};

		keybindings = {
			"ctrl+w" = "close_window";
			"ctrl+enter" = "new_window_with_cwd";
			"ctrl+j" = "neighboring_window left";
			"ctrl+;" = "neighboring_window right";
			"ctrl+l" = "neighboring_window up";
			"ctrl+k" = "neighboring_window down";
			"ctrl+shift+enter" = "new_tab_with_cwd";
			"ctrl+tab" = "next_tab";
			"ctrl+shift+tab" = "previous_tab";
			"ctrl+shift+f" = ""; # unbind
		};

		themeFile = "everforest_dark_hard";
	};
}
