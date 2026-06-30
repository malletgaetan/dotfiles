{ config, pkgs, pkgs-unstable, ... }:
{
	imports = [
		./programs/neovim.nix
		./programs/kitty.nix
		./programs/fzf.nix
		./programs/git.nix
		./programs/bash.nix
		./programs/firefox.nix
		./programs/chrome.nix
	];

	home.username = "gmallet";
	home.homeDirectory = "/home/gmallet";
	home.stateVersion = "26.05";

	programs.home-manager.enable = true;
	programs.kitty.enable = true;

	home.sessionVariables = {
		# Nixpkgs' Discord wrapper only enables native Wayland when this is set.
		NIXOS_OZONE_WL = "1";
	};

	home.pointerCursor = {
		package = pkgs.adwaita-icon-theme;
		name = "Adwaita";
		size = 24;
		gtk.enable = true;
	};

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
		tokei
		monaspace
		docker
		android-tools
		killall
		discord
		obs-studio
		gdb
		gnumake
		pkgs-unstable.gcc
		pkgs-unstable.cargo
		pkgs-unstable.rustc
		pkgs-unstable.go
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
			enable-animations = false;
			cursor-theme = "Adwaita";
			cursor-size = 24;
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
				"chromium-browser.desktop"
				"kitty.desktop"
				"org.gnome.Nautilus.desktop"
			];
		};
		"org/gnome/mutter" = {
			experimental-features = [
				"scale-monitor-framebuffer" # Enables GNOME fractional scaling (125%, 150%, 175%).
			];
		};
	};

	gtk.enable = true;

	xdg.mimeApps = {
		enable = true;

		defaultApplications = {
			"text/html" = "chromium-browser.desktop";
			"text/xml" = "chromium-browser.desktop";
			"application/xhtml+xml" = "chromium-browser.desktop";
			"application/xml" = "chromium-browser.desktop";

			"x-scheme-handler/http" = "chromium-browser.desktop";
			"x-scheme-handler/https" = "chromium-browser.desktop";
		};
	};
}
