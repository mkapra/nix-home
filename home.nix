{ pkgs, ... }:
{
  home.username = "mkapra";

  imports = [ ./homeManagerModules ];

  home.packages = [
    pkgs.devenv
  ];

  programs.home-manager.enable = true;
}
