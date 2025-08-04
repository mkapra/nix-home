{ config, ... }: {
  programs.bash = {
    enableCompletion = true;
    historyControl = ["erasedups" "ignorespace"];
    historyIgnore = [
      "ls"
      "exit"
      "builtin *"
    ];
    bashrcExtra = ''
      export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
        --color=fg:#5c6a72,fg+:#708089,bg:#fdf6e3,bg+:#efebd4
        --color=hl:#e66868,hl+:#f85552,info:#afaf87,marker:#8da101
        --color=prompt:#df69ba,spinner:#af5fff,pointer:#af5fff,header:#87afaf
        --color=gutter:#fdf6e3,border:#5c6a72,label:#aeaeae,query:#d9d9d9
        --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
        --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'

      git_branch() {
        if $(git rev-parse --git-dir > /dev/null 2>&1); then
          local branch_name=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
          echo "''${branch_name} "
        fi
      }

      nix_env() {
        if $(echo $PATH | grep "/nix/store" > /dev/null 2>&1); then
          echo "(nix)"
        fi
      }

      py_venv() {
        if [ -n "$VIRTUAL_ENV" ]; then
          echo "(venv)"
        fi
      }

      HOST="\[\033[0;33m\]\h\[\033[m\]"
      GIT_NIX="\[\033[0;31m\]\$(git_branch)\$(nix_env)\$(py_venv)\[\033[m\]"
      DIR="\[\033[0;34m\]\w\[\033[m\]"
      NEWLINE=$'\n'
      RED_DOLLAR+='\[\033[0;31m\]$\[\033[00m\] '
      GREEN_DOLLAR+='\[\033[0;32m\]$\[\033[00m\] '

      PROMPT_COMMAND=__prompt_command
      __prompt_command() {
        local EXIT="$?"

        # Shorten $PWD, if it's too long
        if [ $COLUMNS -lt 80 ]; then
          export PROMPT_DIRTRIM=1
        else
          export PROMPT_DIRTRIM=0
        fi

        export PS1="''${HOST} ''${DIR} ''${GIT_NIX}''${NEWLINE}"

        if [ $EXIT != 0 ]
        then
          PS1+=$RED_DOLLAR
        else
          PS1+=$GREEN_DOLLAR
        fi
      }
    '';
  };

  programs.carapace.enableBashIntegration = config.programs.bash.enable;
  programs.direnv.enableBashIntegration = config.programs.bash.enable;
  programs.zoxide.enableBashIntegration = config.programs.bash.enable;
  programs.starship.enableBashIntegration = config.programs.bash.enable;
}
