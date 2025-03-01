{ ... }:
{
  home.username = "mkapra";

  imports = [ ./homeManagerModules ];

  programs.home-manager.enable = true;
}
