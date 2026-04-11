{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        name = "gmallet";
        email = "malletgaetan@protonmail.com";
      };
    };
  };
}
