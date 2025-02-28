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
      set-option -g set-titles-string "#H: #W"

      # Make inactive border a bit less noticeable
      set -g pane-border-style fg="#e3ddcc"

      # Status
      set -g status-style "bg=default"
      set -g status-right "#S @ #H [%H:%M]"
      set -g status-left ""
      setw -g window-status-format "#I:#W "
      setw -g window-status-current-format "#[fg=green]#I:#W*"
    '';
  };

  programs.fzf.tmux.enableShellIntegration = true;
}
