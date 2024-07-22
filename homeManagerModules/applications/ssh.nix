{ ... }:
let
  environmentVariables = {
    SSH_AUTH_SOCK = "~/.ssh/ssh_auth_sock";
  };
in {
  home.file.".ssh/rc".text = ''
    #!/bin/bash

    # Fix SSH auth socket location so agent forwarding works with tmux.
    if test "$SSH_AUTH_SOCK" ; then
      ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
    fi
  '';

  programs.nushell.extraEnv = ''
    let sock = $"($env.HOME)/.ssh/ssh_auth_sock"
    if ($env.SSH_AUTH_SOCK | str length) != 0 and ($env.SSH_AUTH_SOCK != $sock) {
      rm -f $sock
      ln -sf $env.SSH_AUTH_SOCK $sock
      $env.SSH_AUTH_SOCK = $sock
    }
  '';
  };

  home.sessionVariables = environmentVariables;
}
