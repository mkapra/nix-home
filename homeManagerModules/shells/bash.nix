{ config, ... }: {
  programs.bash = {
    enableCompletion = true;
    historyControl = ["erasedups" "ignorespace"];
    historyIgnore = [
      "ls"
      "exit"
    ];
    bashrcExtra = ''
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
}
