{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;

    settings = {
      # WINDOWS
      keybind = [
        "ctrl+w=close_surface"
        "ctrl+enter=new_split:auto"
        "ctrl+j=goto_split:left"
        "ctrl+semicolon=goto_split:right"
        "ctrl+l=goto_split:up"
        "ctrl+k=goto_split:down"
        "ctrl+f=toggle_fullscreen"

        # TABS
        "ctrl+shift+enter=new_tab"
        "ctrl+tab=next_tab"
        "ctrl+shift+tab=previous_tab"
      ];

      # DISABLE LIGATURES
      font-feature = [
        "-calt"
        "-liga"
        "-dlig"
      ];

      # CURSOR
      cursor-style = "block";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor";

      desktop-notifications = false;
      theme = "Broadcast";
    };
  };
}
