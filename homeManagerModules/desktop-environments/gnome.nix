{ ... }:
{
  dconf.settings = {
    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "kitty";
      name = "kitty";
    };
    "org/gnome/desktop/interface" = {
      enable-animations = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      focus-mode = "click";
      resize-with-right-button = true;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
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
}
