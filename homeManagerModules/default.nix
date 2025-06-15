{ pkgs-unstable, ... }: {
  imports = [ ./applications ./desktop-environments ./editors ./languages ./shells ];

  fonts.fontconfig.enable = true;
  home.packages = [ pkgs-unstable.nerd-fonts.jetbrains-mono ];
}
