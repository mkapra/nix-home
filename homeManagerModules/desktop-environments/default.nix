{ config, pkgs, lib, ... }: {
  options.mkapra-home.private-desktop.enable = lib.mkEnableOption "Setup private desktop environment";

  imports = [
    ./gnome.nix
    ./i3.nix
  ];

  config = lib.mkIf config.mkapra-home.private-desktop.enable {
    programs.kitty.enable = true;
    programs.helix.enable = true;
    programs.nushell.enable = true;
    programs.bash.enable = true;
    programs.zellij.enable = true;
    mkapra-home.rust.enable = true;

    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      bitwarden-desktop
    ];

    programs.chromium = {
      enable = true;
      extensions = [
        "ddkjiahejlhfcafbddmgiahcphecmpfh" # Ublock lite
        "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      ];
      dictionaries = [
        pkgs.hunspellDictsChromium.en_US
        pkgs.hunspellDictsChromium.de_DE
      ];
    };
  };
}
