{ config, pkgs, pkgs-unstable, ... }:
{
	imports = [
		./programs/nvim.nix
		./programs/ghostty.nix
		./programs/kitty.nix
		./programs/fzf.nix
		./programs/git.nix
		./programs/bash.nix
		./programs/firefox.nix
	];

	home.username = "gmallet";
	home.homeDirectory = "/home/gmallet";
	home.stateVersion = "25.11";

	programs.home-manager.enable = true;
	programs.kitty.enable = true;

	home.file.".local/share/backgrounds/black-wallpaper.svg".source = ./assets/black-wallpaper.svg;

	home.packages = with pkgs; [
		git
		wget
		curl
		zip
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
		"org/gnome/shell" = {
			favorite-apps = [
				"firefox.desktop"
				"com.mitchellh.ghostty.desktop"
				"org.gnome.Nautilus.desktop"
			];
		};
		"org/gnome/mutter" = {
			experimental-features = [ "scale-monitor-framebuffer" ];
		};
	};

	gtk = {
		enable = true;
		iconTheme = {
			package = pkgs.adwaita-icon-theme;
			name = "Adwaita";
		};
	};
}
