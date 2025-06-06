{ pkgs-unstable, ... }: {
  imports = [
    ./btop.nix
    ./tmux.nix
    ./fzf.nix
    ./git.nix
    ./ssh.nix
    ./fd.nix
    ./zellij.nix
    ./kitty.nix
  ];

  home.packages = with pkgs-unstable; [
    tig
    glow
  ];
}
