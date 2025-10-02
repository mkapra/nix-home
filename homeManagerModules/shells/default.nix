{ pkgs, lib, ... }: {
  imports = [ ./bash.nix ./nushell.nix ./zsh.nix ];

  home.sessionVariables = {
    NIX_SHELL_PRESERVE_PROMPT = 1;
    FZF_DEFAULT_OPTS = lib.concatStringsSep " " [
      "--color=fg:#5c6a72,fg+:#708089,bg:#fdf6e3,bg+:#efebd4"
      "--color=hl:#e66868,hl+:#f85552,info:#afaf87,marker:#8da101"
      "--color=prompt:#df69ba,spinner:#af5fff,pointer:#af5fff,header:#87afaf"
      "--color=gutter:#fdf6e3,border:#5c6a72,label:#aeaeae,query:#d9d9d9"
      "--border='rounded' --border-label='' --preview-window='border-rounded' --prompt='> '"
      "--marker='>' --pointer='◆' --separator='─' --scrollbar='│'"
    ];
  };

  programs.zoxide.enable = true;
  programs.zoxide.package = pkgs.zoxide;

  programs.ripgrep.enable = true;
  programs.ripgrep.package = pkgs.ripgrep;

  programs.direnv = {
    enable = true;
    package = pkgs.unstable.direnv;
    silent = true;
    nix-direnv.enable = true;
  };

  programs.carapace.enable = true;
  programs.carapace.package = pkgs.unstable.carapace;

  programs.starship.enable = true;
}
