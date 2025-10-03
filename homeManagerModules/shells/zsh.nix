{ pkgs, config, ... }:
{
  programs.zsh = {
    autocd = true;
    defaultKeymap = "emacs";
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    initContent = ''
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"

      precmd () {
        vcs_info
        print -Pn "\e]2;%-3~\a";
      }

      autoload -Uz vcs_info
      zstyle ':vcs_info:*' enable git
      zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f'
      zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%F{5}]%f'
      zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

      setopt prompt_subst
      PS1='%F{blue}%B%~%b%f %F{%(?.green.red)}❯%f '
      RPS1='%F{cyan}''${vcs_info_msg_0_}%f'
    '';

    history = {
      path = "${config.xdg.dataHome}/.history";
      append = true;
      findNoDups = true;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      saveNoDups = true;
    };
  };

  programs.starship.enableZshIntegration = false;
  programs.carapace.enableZshIntegration = config.programs.zsh.enable;
  programs.direnv.enableZshIntegration = config.programs.zsh.enable;
  programs.zoxide.enableZshIntegration = config.programs.zsh.enable;
  programs.fzf.enableZshIntegration = config.programs.zsh.enable;
}
