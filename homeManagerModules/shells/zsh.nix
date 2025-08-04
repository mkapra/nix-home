{ pkgs, config, ... }: {
  programs.zsh = {
    autocd = true;
    defaultKeymap = "emacs";
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    initContent = ''
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward

      zstyle ':prompt:pure:cyan' color #3A94C5
      zstyle ':prompt:pure:red' color #F85552
      zstyle ':prompt:pure:prompt:success' color cyan

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"

      # Enable vcs_info for Git
      autoload -Uz vcs_info

      # Git-only configuration
      zstyle ':vcs_info:*' enable git
      zstyle ':vcs_info:git:*' check-for-changes true
      zstyle ':vcs_info:git:*' unstagedstr " %F{#DFA000}%f "
      zstyle ':vcs_info:git:*' stagedstr " %F{#8DA101}%f "
      zstyle ':vcs_info:git:*' formats '󰘬 %b%u%c'
      zstyle ':vcs_info:git:*' actionformats '  󰘬 %b%u%c'

      # Update vcs_info and set prompts before each prompt render
      precmd() {
        vcs_info
        set_left_prompt
        set_right_prompt
      }

      # Set left prompt with dir and colored ❯ based on last command
      set_left_prompt() {
        local last_status=$?
        # local dir="''${PWD##*/}"
	local dir="%(4~|.../%3~|%~)"

        if [[ $last_status -eq 0 ]]; then
          PROMPT="''${dir} %F{#3a94c5}❯%f "
        else
          PROMPT="''${dir} %F{#f85552}❯%f "
        fi
      }

      # Set right prompt to Git info (via vcs_info)
      set_right_prompt() {
	RPROMPT="''${vcs_info_msg_0_}"
      }
    '';

    history = {
      append = true;
      findNoDups = true;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      saveNoDups = true;
    };
  };

  programs.carapace.enableZshIntegration = config.programs.zsh.enable;
  programs.direnv.enableZshIntegration = config.programs.zsh.enable;
  programs.zoxide.enableZshIntegration = config.programs.zsh.enable;
  programs.fzf.enableZshIntegration = config.programs.zsh.enable;
}
