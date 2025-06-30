{ pkgs-unstable, ... }:
{
  home.username = "mkapra";

  imports = [ ./homeManagerModules ];

  home.packages = [
    pkgs-unstable.devenv
  ];

  programs.home-manager.enable = true;
}
