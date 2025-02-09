{ config, pkgs, lib, ... }: {
  options.mkapra-home.private-desktop.enable = lib.mkEnableOption "Setup private desktop environment";

  config = lib.mkIf config.mkapra-home.private-desktop.enable {
    programs.kitty.enable = true;
    programs.helix.enable = true;
    programs.nushell.enable = true;
    programs.zellij.enable = true;
    mkapra-home.rust.enable = true;

    home.packages = with pkgs; [
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

    dconf.settings = {
      "org/gnome/desktop/wm/preferences" = {
        resize-with-right-button = true;
      };
      "org/gnome/desktop/interface" = {
        enable-animations = false;
      };
      "org/gnome/desktop/wm/preferences" = {
        focus-mode = "mouse";
      };
      "org/gnome/shell" = {
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "chromium-browser.desktop"
          "kitty.desktop"
          "org.gnome.Geary.desktop"
          "org.gnome.Calendar.desktop"
          "bitwarden.desktop"
        ];
      };
    };
  };
}
