{ config, pkgs, lib, ... }: let
  stdenv = pkgs.stdenv;
in lib.mkIf stdenv.isDarwin {
  home.packages = with pkgs.unstable; [
    arc-browser
    raycast
    sketchybar
  ];

  services.jankyborders = {
    enable = true;
    settings = {
      style = "round";
      width = 6.0;
      active_color = "0x7fbbb3";
      inactive_color = "0x1e2326";
    };
  };

  home.file.".local/bin/sketchybar-wrapper".text = ''
    #!/usr/bin/env bash
    export PATH="${pkgs.unstable.lib.makeBinPath [
      pkgs.unstable.sketchybar
      pkgs.unstable.jq
      pkgs.unstable.yabai
      pkgs.unstable.coreutils
      pkgs.unstable.bash
      pkgs.unstable.aerospace
    ]}:$PATH"

    exec ${pkgs.unstable.sketchybar}/bin/sketchybar "$@"
  '';
  home.file.".local/bin/sketchybar-wrapper".executable = true;

  programs.aerospace = {
    enable = true;
    package = pkgs.unstable.aerospace;
    userSettings = {
      after-login-command = [];
      after-startup-command = [
        "exec-and-forget ${config.home.homeDirectory}/.local/bin/sketchybar-wrapper > ~/sketchybar.log 2>&1"
      ];

      start-at-login = true;

      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      accordion-padding = 30;

      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

      automatically-unhide-macos-hidden-apps = true;

      key-mapping.preset = "qwerty";

      gaps = {
        inner.horizontal = 10;
        inner.vertical =   10;
        outer.left =       5;
        outer.bottom =     5;
        outer.top =        35;
        outer.right =      5;
      };

      exec-on-workspace-change = [
        "/bin/bash"
        "-c"
        "${pkgs.unstable.sketchybar}/bin/sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE"
      ];

      mode.main.binding = {
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";

        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        alt-left = "focus left";
        alt-down = "focus down";
        alt-up = "focus up";
        alt-right = "focus right";

        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        alt-shift-left = "move left";
        alt-shift-down = "move down";
        alt-shift-up = "move up";
        alt-shift-right = "move right";

        alt-minus = "resize smart -50";
        alt-equal = "resize smart +50";

        alt-f = "fullscreen";

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-0 = "workspace 10";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";
        alt-shift-0 = "move-node-to-workspace 10";

        alt-tab = "workspace-back-and-forth";
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

        alt-shift-semicolon = "mode service";

        cmd-h = []; # Disable "hide application"
        cmd-alt-h = []; # Disable "hide others"
      };
      mode.service.binding = {
        esc = ["reload-config" "mode main"];
        r = ["flatten-workspace-tree" "mode main"];
        f = ["layout floating tiling" "mode main"];
        backspace = ["close-all-windows-but-current" "mode main"];

        alt-shift-h = ["join-with left" "mode main"];
        alt-shift-j = ["join-with down" "mode main"];
        alt-shift-k = ["join-with up" "mode main"];
        alt-shift-l = ["join-with right" "mode main"];

        down = "volume down";
        up = "volume up";
        shift-down = ["volume set 0" "mode main"];
      };
    };
  };
}
