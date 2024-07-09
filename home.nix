{ config, pkgs, system, ... }:
{
  home.stateVersion = "23.11";
  home.username = "mkapra";

  imports = [ ./homeManagerModules ];

  programs.home-manager.enable = true;
}
