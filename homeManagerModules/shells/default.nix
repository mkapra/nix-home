{ ... }: {
  imports = [ ./bash.nix ./nushell.nix ];

  home.sessionVariables = {
    NIX_SHELL_PRESERVE_PROMPT = 1;
  };

  programs.bat = {
    enable = true;
    config = { theme = "ansi"; };
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.ripgrep.enable = true;
  programs.direnv.enable = true;
  programs.carapace.enable = true;
}
