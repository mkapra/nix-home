{ pkgs-unstable, ... }: {
  programs.tmux = {
    package = pkgs-unstable.tmux;
    enable = true;
    baseIndex = 1;
    escapeTime = 5;
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

      bind-key % split-window -h -c "#{pane_current_path}"
      bind-key \" split-window -v -c "#{pane_current_path}"

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
      set -g status on
      set -g status-position bottom

      set -g status-style bg="#fdf6e3",fg="#5c6a72"

      set -g status-left-length 30
      set -g status-left "#[bg=#fdf6e3,fg=#d3c6aa]#[bg=#d3c6aa,fg=#5c6a72] #S #[bg=#fdf6e3,fg=#d3c6aa]  "

      set -g status-right-length 20
      set -g status-right "#[bg=#fdf6e3,fg=#d699b6]#[bg=#d699b6,fg=#fdf6e3] #h #[bg=#fdf6e3,fg=#d699b6]"

      set -g window-status-format "#[bg=#fdf6e3,fg=#8ba4b0]#[bg=#8ba4b0,fg=#fdf6e3]#I #[bg=#b3c9c9,fg=#5c6a72] #W #[bg=#fdf6e3,fg=#b3c9c9]"
      set -g window-status-current-format "#[bg=#fdf6e3,fg=#e69875]#[bg=#e69875,fg=#fdf6e3]#I #[bg=#f7d3b0,fg=#5c6a72] #W #[bg=#fdf6e3,fg=#f7d3b0]"
      setw -g window-status-separator " "
    '';
  };

  programs.fzf.tmux.enableShellIntegration = true;
}
