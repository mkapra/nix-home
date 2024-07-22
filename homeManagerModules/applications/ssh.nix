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

  programs.nushell = {
    inherit environmentVariables;
  };

  home.sessionVariables = environmentVariables;
}
