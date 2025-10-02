{ pkgs, ... }: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./tmux.nix
    ./fzf.nix
    ./git.nix
    ./ssh.nix
    ./fd.nix
    ./zellij.nix
    ./kitty.nix
    ./jujutsu.nix
  ];

  home.packages = with pkgs; [
    tig
    glow
  ];
}
