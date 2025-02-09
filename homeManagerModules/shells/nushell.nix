{ config, pkgs-unstable, ... }: {
  programs.nushell = {
    package = pkgs-unstable.nushell;
    shellAliases = {
      nd = "nix develop -c $env.SHELL";
      grep = "rg";
    };

    extraConfig = ''
      $env.config.show_banner = false

      def help [cmd] {
        nu -c $"($cmd) --help" | bat --style=plain --paging=never
      }
    '';

    extraEnv = ''
      $env.__zoxide_hooked = true
    '';
  };

  programs.carapace.enableNushellIntegration = config.programs.nushell.enable;
  programs.direnv.enableNushellIntegration = config.programs.nushell.enable;
  programs.zoxide.enableNushellIntegration = config.programs.nushell.enable;
}
