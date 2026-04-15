{ ... }:
{
	programs.kitty = {
		enable = true;

		settings = {
			font_family = "Monaspace Argon";
			bold_font = "auto";
			italic_font = "auto";
			bold_italic_font = "auto";
			disable_ligature = "always";
			scrollback_lines = "10000";
		};

		keybindings = {
			"ctrl+w" = "close_window";
			"ctrl+enter" = "new_window";
			"ctrl+j" = "neighboring_window left";
			"ctrl+;" = "neighboring_window right";
			"ctrl+l" = "neighboring_window up";
			"ctrl+k" = "neighboring_window down";
			"ctrl+shift+enter" = "new_tab";
			"ctrl+tab" = "next_tab";
			"ctrl+shift+tab" = "previous_tab";
			"ctrl+f" = "search_scrollback";
			"ctrl+shift+f" = ""; # unbind
		};

		themeFile = "base2tone-desert-dark";
	};
}
