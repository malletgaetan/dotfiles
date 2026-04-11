{ config, pkgs, pkgs-unstable, ... }:
{
  imports = [
    ./programs/nvim.nix
    ./programs/ghostty.nix
    ./programs/fzf.nix
    ./programs/git.nix
    ./programs/bash.nix
  ];

  home.username = "gmallet";
  home.homeDirectory = "/home/gmallet";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

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
    pkgs-unstable.gcc
    pkgs-unstable.cargo
    pkgs-unstable.rustc
    pkgs-unstable.go
    pkgs-unstable.firefox
    pkgs-unstable.discord
    pkgs-unstable.codex
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
      switch-applications = [ ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
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
