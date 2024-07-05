{ config, pkgs, system, ... }:
{
  home.stateVersion = "23.11";
  home.username = "mkapra";

  programs.home-manager.enable = true;

  programs.helix = {
    enable = true;
    defaultEditor = true;
  };
}
