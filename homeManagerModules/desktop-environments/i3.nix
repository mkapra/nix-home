{
  pkgs,
  lib,
  config,
  ...
}:
let
  modifier = "Mod4";
  ws1 = "1";
  ws2 = "2";
  ws3 = "3";
  ws4 = "4";
  ws5 = "5";
  ws6 = "6";
  ws7 = "7";
  ws8 = "8";
  ws9 = "9";
  ws10 = "10";

  refresh_i3status = "killall -SIGUSR1 i3status";
in
lib.mkIf config.xsession.windowManager.i3.enable {
  home.packages = with pkgs.unstable; [ flameshot ];
  home.file.".background-image".source = ./wallpapers/nix.png;

  programs.i3status = {
    enable = true;
    general = {
      output_format = "i3bar";
      colors = true;
      color_good = "#A7C080";
      color_degraded = "#DBBC7F";
      color_bad = "#E67E80";
      interval = 5;
    };

    modules = {
      "wireless _first_" = {
        position = 1;
        settings = {
          format_up = "  (%quality at %essid, %bitrate)";
          format_down = "  down";
        };
      };

      "ethernet _first_" = {
        position = 2;
        settings = {
          format_up = "󰈀 %ip (%speed)";
          format_down = "󰈀 down";
        };
      };

      "battery 0" = {
        position = 3;
        settings = {
          format = "%status %percentage %remaining %emptytime";
          format_down = "No battery";
          status_chr = "󰂄";
          status_bat = "󰁹";
          status_unk = "󰂑";
          status_full = "󰁹";
          path = "/sys/class/power_supply/BAT%d/uevent";
          low_threshold = 10;
        };
      };

      memory = {
        position = 4;
        settings = {
          format = "%used";
          threshold_degraded = "10%";
          format_degraded = "MEMORY: %free";
        };
      };

      load = {
        position = 5;
        settings.format = "%5min";
      };

      "tztime local" = {
        position = 6;
        settings.format = "%Y-%m-%d %H:%M:%S";
      };
    };
  };

  xsession.windowManager.i3 = {
    package = pkgs.unstable.i3;

    extraConfig = ''
      hide_edge_borders smart
    '';

    config = {
      inherit modifier;

      startup = [
        {
          command = "dex --autostart --environment i3";
          notification = false;
        }
        {
          command = "dunst --startup_notification";
          notification = false;
        }
        {
          command = "xss-lock --transfer-sleep-lock -- i3lock --nofork";
          notification = false;
        }
        {
          command = "nm-applet";
          notification = false;
        }
      ];

      gaps = {
        inner = 5;
        smartGaps = true;
      };

      fonts = {
        names = [ "JetBrainsMono NF" ];
        style = "SemiBold";
        size = 9.0;
      };

      keybindings = {
        "${modifier}+Return" = "exec kitty";
        "${modifier}+q" = "kill";
        "${modifier}+Shift+l" = "exec loginctl lock-session";

        "${modifier}+d" = "exec --no-startup-id i3-dmenu-desktop";

        "${modifier}+h" = "split h";
        "${modifier}+v" = "split v";

        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+Shift+space" = "floating toggle";

        "${modifier}+space" = "focus mode_toggle";

        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+r" = "restart";

        "${modifier}+Shift+minus" = "move scratchpad";

        "${modifier}+Print --release" = "exec --no-startup-id flameshot gui";

        "${modifier}+Shift+w" = "exec --no-startup-id xrandr --output Virtual-1 --auto";

        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        "${modifier}+1" = "workspace number ${ws1}";
        "${modifier}+2" = "workspace number ${ws2}";
        "${modifier}+3" = "workspace number ${ws3}";
        "${modifier}+4" = "workspace number ${ws4}";
        "${modifier}+5" = "workspace number ${ws5}";
        "${modifier}+6" = "workspace number ${ws6}";
        "${modifier}+7" = "workspace number ${ws7}";
        "${modifier}+8" = "workspace number ${ws8}";
        "${modifier}+9" = "workspace number ${ws9}";
        "${modifier}+0" = "workspace number ${ws10}";

        "${modifier}+Shift+1" = "move container to workspace number ${ws1}";
        "${modifier}+Shift+2" = "move container to workspace number ${ws2}";
        "${modifier}+Shift+3" = "move container to workspace number ${ws3}";
        "${modifier}+Shift+4" = "move container to workspace number ${ws4}";
        "${modifier}+Shift+5" = "move container to workspace number ${ws5}";
        "${modifier}+Shift+6" = "move container to workspace number ${ws6}";
        "${modifier}+Shift+7" = "move container to workspace number ${ws7}";
        "${modifier}+Shift+8" = "move container to workspace number ${ws8}";
        "${modifier}+Shift+9" = "move container to workspace number ${ws9}";
        "${modifier}+Shift+0" = "move container to workspace number ${ws10}";

        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";

        "${modifier}+r" = "mode 'resize'";

        XF86AudioRaiseVolume = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && ${refresh_i3status}";
        XF86AudioLowerVolume = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && ${refresh_i3status}";
        XF86AudioMute = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && ${refresh_i3status}";
        XF86AudioMicMute = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && ${refresh_i3status}";

        "${modifier}+Shift+e" =
          "exec \"i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes,exit i3' 'i3-msg exit'\"";
      };
      modes = {
        resize = {
          Down = "resize grow height 10 px or 10 ppt";
          Left = "resize shrink width 10 px or 10 ppt";
          Right = "resize grow width 10 px or 10 ppt";
          Up = "resize shrink height 10 px or 10 ppt";

          Return = "mode default";
          Escape = "mode default";
          "${modifier}+r" = "mode default";
        };
      };
      colors = {
        background = "#2D353B";

        focused = {
          background = "#7FBBB3";
          border = "#7FBBB3";
          childBorder = "#7FBBB3";
          indicator = "#7FBBB3";
          text = "#2D353B";
        };
        focusedInactive = {
          background = "#2D353B";
          border = "#2D353B";
          childBorder = "#2D353B";
          indicator = "#2D353B";
          text = "#D3C6AA";
        };
        unfocused = {
          background = "#2D353B";
          border = "#2D353B";
          childBorder = "#2D353B";
          indicator = "#2D353B";
          text = "#D3C6AA";
        };
        urgent = {
          background = "#E67E80";
          border = "#E67E80";
          childBorder = "#E67E80";
          indicator = "#E67E80";
          text = "#2D353B";
        };
      };
      bars = [
        {
          statusCommand = "${pkgs.unstable.i3status}/bin/i3status";
          trayOutput = "primary";
          position = "top";
          colors = {
            background = "#2D353B";
            statusline = "#D3C6AA";
            separator = "#7A8478";

            focusedWorkspace = {
              background = "#A7C080";
              border = "#A7C080";
              text = "#2D353B";
            };
            activeWorkspace = {
              background = "#7FBBB3";
              border = "#7FBBB3";
              text = "#2D353B";
            };
            inactiveWorkspace = {
              background = "#232A2E";
              border = "#232A2E";
              text = "#D3C6AA";
            };
            urgentWorkspace = {
              background = "#E67E80";
              border = "#E67E80";
              text = "#2D353B";
            };
          };
          extraConfig = ''
            bindsym button1 nop
          '';
        }
      ];
    };
  };
}
