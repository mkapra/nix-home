{ pkgs, ... }:
{
  imports = [
    ./applications
    ./desktop-environments
    ./editors
    ./languages
    ./shells
  ];

  fonts.fontconfig.enable = true;
  home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
}
