{ pkgs, config, ... }: {
  programs.kitty = {
    package = pkgs.unstable.kitty;
    themeFile = "everforest_light_medium";
    shellIntegration = {
      mode = "no-cursor";
      enableZshIntegration = config.programs.zsh.enable;
      enableBashIntegration = config.programs.bash.enable;
    };
    font = {
      name = "JetBrainsMonoNL Nerd Font Mono";
      size = 10.0;
    };
    settings = {
      remember_window_size = "no";
      initial_window_width = 1280;
      initial_window_height = 720;
      confirm_os_window_close = 0;
      disable_ligatures = "cursor";
      font_features = "+calt +liga";
      cursor_blink_interval = 0;
      window_margin_width = 5;
      placement_strategy = "center";

      visual_bell_duration = 0;
      enable_audio_bell = "no";
      window_alert_on_bell = "no";

      scrollback_lines = 50000;
      strip_trailing_spaces = "smart";

      default_pointer_shape = "arrow";
      pointer_shape_when_dragging = "beam";
      pointer_shape_when_grabbed = "hand";

      update_check_interval = 0;

      term = "xterm-256color";
    };
  };
}
