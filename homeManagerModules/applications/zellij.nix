{ ... }: {
  programs.zellij = {
    enable = true;
    settings = {
      keybinds = {
        unbind = "Ctrl o";
        "shared_except \"session\" \"locked\"" = {
          "bind \"Ctrl Alt o\"" = { SwitchToMode = "Session"; };
        };
      };
      themes = {
        everforest-light-custom = {
          bg = "#fdf6e3";
          black = "#fdf6e3";
          blue = "#3a94c5";
          cyan = "#35a77c";
          fg = "#5c6a72";
          green = "#8da101";
          magenta = "#df69ba";
          orange = "#f57d26";
          red = "#f85552";
          white = "#5c6a72";
          yellow = "#dfa000";
        };
      };
      theme = "everforest-light-custom";
      default_layout = "compact";
    };
  };
}
