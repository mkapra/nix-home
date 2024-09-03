{ ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 1;
    secureSocket = false;
    sensibleOnTop = true;
    keyMode = "vi";
    historyLimit = 10000;
    terminal = "tmux-256color";
    extraConfig = ''
      set -ga terminal-overrides ",*256col*:Tc,kitty:Tc"

      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      # new windows
      bind-key -n M-c new-window -c "#{pane_current_path}"

      bind-key -n M-v split-window -h -c "#{pane_current_path}"
      bind-key -n M-s split-window -v -c "#{pane_current_path}"

      # pane selection
      bind-key -n 'M-Left' select-pane -L
      bind-key -n 'M-Right' select-pane -R
      bind-key -n 'M-Up' select-pane -U
      bind-key -n 'M-Down' select-pane -D

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

      ########## Styling ##########
      set -g status-position bottom
      set -g status-justify "left"
      set -g status "on"

      set -g status-style "none,bg=#f2e9e1"
      set -g pane-border-style "fg=#f2e9e1,bg=default"
      set -g pane-active-border-style "fg=#ea9d34,bg=default"

      set -g message-command-style "fg=#56949f,bg=#f2e9e1"
      set -g message-style "fg=#56949f,bg=#f2e9e1"
      setw -g window-status-activity-style "none,fg=#93b259,bg=#f2e9e1"
      setw -g window-status-style "none,fg=#286983,bg=#f2e9e1"
      set -g status-left "#[fg=#d7827e,bg=#f2e9e1]   "
      set -g status-right "#[fg=#56949f,bg=#f2e9e1]  #H   "

      set -g status-right-length "100"
      set -g status-left-length "100"
      setw -g window-status-format "#[fg=#9893a5] #I∣#W "
      setw -g window-status-current-format "#[fg=#286983,bold] #I∣#W "
    '';
  };

  programs.fzf.tmux.enableShellIntegration = true;
}
