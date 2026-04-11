{ pkgs, ... }:
{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;

    historyWidgetOptions = [
      "--height=40%"
      "--layout=reverse"
      "--border"
      "--inline-info"
      "--exact"
    ];
  };
}
