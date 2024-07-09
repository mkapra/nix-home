{ pkgs, ... }: {
  imports = [
    ./btop.nix
    ./tmux.nix
    ./fzf.nix
    ./git.nix
  ];
}
