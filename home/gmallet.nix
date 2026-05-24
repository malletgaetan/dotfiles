{ config, pkgs, pkgs-unstable, ... }:
{
	imports = [
		./programs/neovim.nix
		./programs/ghostty.nix
		./programs/kitty.nix
		./programs/fzf.nix
		./programs/git.nix
		./programs/bash.nix
		./programs/firefox.nix
		./programs/chrome.nix
	];

	home.username = "gmallet";
	home.homeDirectory = "/home/gmallet";
	home.stateVersion = "25.11";

	programs.home-manager.enable = true;
	programs.kitty.enable = true;

	home.file.".local/share/backgrounds/black-wallpaper.svg".source = ./assets/black-wallpaper.svg;

	home.packages = with pkgs; [
		fzf
		git
		wget
		curl
		zip
		unzip
		jq
		tree
		btop
		ripgrep
		fd
		wl-clipboard
		cloc
		monaspace
		pkgs-unstable.gcc
		pkgs-unstable.cargo
		pkgs-unstable.rustc
		pkgs-unstable.go
		pkgs-unstable.discord
		pkgs-unstable.codex
		pkgs-unstable.gemini-cli
		pkgs-unstable.opencode
		pkgs-unstable.llama-cpp-vulkan
		pkgs-unstable.amdgpu_top
	];

	# 'gsettings': 'man gsettings', 'gsettings list-schemas', 'gsettings list-recursively', 'gsettings list-keys <schema>' to discover valid schemas and keys
	# 'dconf': 'man dconf', 'dconf list /', 'dconf dump /path/' to inspect currently stored values, not the full schema documentation
	# note: dconf is the backend database of gsettings
	dconf.settings = {
		"org/gnome/desktop/notifications" = {
				show-banners = false;
				show-in-lock-screen = false;
		};
		"org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark";
			cursor-theme = "XCursor-Pro-Dark";
			cursor-size = 30;
			enable-animations = false;
		};
		"org/gnome/desktop/background" = {
			picture-uri = "file://${config.home.homeDirectory}/.local/share/backgrounds/black-wallpaper.svg";
			picture-uri-dark = "file://${config.home.homeDirectory}/.local/share/backgrounds/black-wallpaper.svg";
		};
		"org/gnome/desktop/wm/keybindings" = {
			close = [ "<Super>q" ];
			switch-applications = [ ];
			switch-windows = [ "<Alt>Tab" ];
			switch-windows-backward = [ "<Shift><Alt>Tab" ];
		};
		"org/gnome/desktop/screensaver" = {
			picture-uri = "file://${config.home.homeDirectory}/.local/share/backgrounds/black-wallpaper.svg";
		};
		"org/gnome/desktop/peripherals/mouse" = {
			accel-profile = "flat";
			natural-scroll = true;
		};
		"org/gnome/shell" = {
			favorite-apps = [
				"firefox.desktop"
				"kitty.desktop"
				"org.gnome.Nautilus.desktop"
			];
		};
		"org/gnome/mutter" = {
			experimental-features = [
				"scale-monitor-framebuffer" # Enables fractional scaling (125% 150% 175%)
				"xwayland-native-scaling" # Scales Xwayland applications to look crisp on HiDPI screens
				"autoclose-xwayland" # automatically terminates Xwayland if all relevant X11 clients are gone
			];
		};
	};

	gtk = {
		enable = true;
		iconTheme = {
			package = pkgs.adwaita-icon-theme;
			name = "Adwaita";
		};
	};

	home.pointerCursor = {
		package = pkgs.xcursor-pro;
		name = "XCursor-Pro-Dark";
		size = 30;
		gtk.enable = true;
		x11.enable = true;
	};

	xdg.mimeApps = {
		enable = true;

		defaultApplications = {
			"text/html" = "firefox.desktop";
			"text/xml" = "firefox.desktop";
			"application/xhtml+xml" = "firefox.desktop";
			"application/xml" = "firefox.desktop";

			"x-scheme-handler/http" = "firefox.desktop";
			"x-scheme-handler/https" = "firefox.desktop";
		};
	};
}
