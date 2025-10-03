{ config, ... }:
{
  home.file."bat-theme" = {
    source = ./static/bat-everforest-light.theme.xml;
    target = "${config.xdg.configHome}/bat/themes/everforest-light.tmTheme";
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "everforest-light";
    };
  };
}
