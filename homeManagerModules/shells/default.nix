{ pkgs-unstable, ... }: {
  imports = [ ./bash.nix ./nushell.nix ./zsh.nix ];

  home.sessionVariables = {
    NIX_SHELL_PRESERVE_PROMPT = 1;
  };

  programs.bat = {
    enable = true;
    config = { theme = "ansi"; };
  };

  programs.zoxide.enable = true;
  programs.zoxide.package = pkgs-unstable.zoxide;
  programs.ripgrep.enable = true;
  programs.ripgrep.package = pkgs-unstable.ripgrep;

  programs.direnv = {
    enable = true;
    package = pkgs-unstable.direnv;
    nix-direnv.enable = true;
  };

  programs.carapace.enable = true;
  programs.carapace.package = pkgs-unstable.carapace;
}
