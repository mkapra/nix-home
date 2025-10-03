{ config, ... }:
{
  home.file.".ssh/rc" = {
    executable = true;
    text = ''
      #!/bin/bash

      # Fix SSH auth socket location so agent forwarding works with tmux.    
      if test "$SSH_AUTH_SOCK" ; then
        ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
      fi
    '';
  };

  programs.nushell.extraEnv = ''
    let sock = $env.HOME | path join ".ssh/ssh_auth_sock"
    if (not ($sock  | path exists)) {
      rm -f $sock
      ln -sf $env.SSH_AUTH_SOCK $sock
      $env.SSH_AUTH_SOCK = $sock
    }
  '';

  programs.tmux.extraConfig = ''
    setenv -g SSH_AUTH_SOCK $HOME/.ssh/ssh_auth_sock
  '';
}
