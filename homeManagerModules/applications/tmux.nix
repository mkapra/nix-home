{ pkgs, ... }:
{
  programs.tmux = {
    package = pkgs.tmux;
    enable = true;
    baseIndex = 1;
    escapeTime = 5;
    secureSocket = false;
    sensibleOnTop = true;
    keyMode = "vi";
    mouse = true;
    historyLimit = 10000;
    terminal = "tmux-256color";
    extraConfig = ''
      set -ga terminal-overrides ",*256col*:Tc,kitty:Tc"

      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      # new windows
      bind-key -n M-c new-window -c "#{pane_current_path}"

      bind-key % split-window -h -c "#{pane_current_path}"
      bind-key \" split-window -v -c "#{pane_current_path}"
      bind-key -n 'M-v' split-window -h -c "#{pane_current_path}"
      bind-key -n 'M-s' split-window -v -c "#{pane_current_path}"

      # pane selection
      bind-key -n 'M-Left' select-pane -L
      bind-key -n 'M-Right' select-pane -R
      bind-key -n 'M-Up' select-pane -U
      bind-key -n 'M-Down' select-pane -D

      bind-key -n M-l last-window

      # navigate windows
      bind-key -n M-1 select-window -t 1
      bind-key -n M-2 select-window -t 2
      bind-key -n M-3 select-window -t 3
      bind-key -n M-4 select-window -t 4
      bind-key -n M-5 select-window -t 5
      bind-key -n M-6 select-window -t 6
      bind-key -n M-7 select-window -t 7
      bind-key -n M-8 select-window -t 8
      bind-key -n M-9 select-window -t 9

      set-option -g renumber-windows on

      bind-key -n M-q copy-mode

      bind -n M-S-Left resize-pane -L 5
      bind -n M-S-Right resize-pane -R 5
      bind -n M-S-Up resize-pane -U 5
      bind -n M-S-Down resize-pane -D 5

      # set terminal window title (update every second)
      set-option -g status-interval 1
      set-option -g set-titles on

      # Make inactive border a bit less noticeable
      set -g pane-border-style fg="#e3ddcc"

      # Status
      normal_fg="#5c6a72"
      highlight_fg="#f57d26"
      grey0="#a6b0a0"
      grey1="#939f91"
      grey2="#829181"

      set -g status-position bottom
      set -g status-style "fg=''${normal_fg},bg=default"
      set -g status-left-length 0
      set -g status-left ""
      set -g status-right "#[fg=''${normal_fg}]#S | 🖳 #h"
      set -g window-status-current-format "#[fg=''${highlight_fg},bold] #[underscore]#I:#W"
      set -g window-status-format " #[nobold]#I:#W"
      set -g message-style "fg=''${normal_fg},bg=default"
      set -g mode-style "fg=''${normal_fg},bg=''${highlight_fg}"
      set -g pane-border-style "fg=''${grey0},bg=default"
      set -g pane-active-border-style "fg=''${grey2},bg=default"
    '';
  };

  programs.fzf.tmux.enableShellIntegration = true;
}
