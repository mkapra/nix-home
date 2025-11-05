{ config, pkgs, ... }:
let
  stdenv = pkgs.unstable.stdenv;
in
{
  programs.nushell = {
    package = pkgs.unstable.nushell;
    shellAliases = {
      nd = "nix develop -c $env.SHELL";
      grep = "rg";
    };

    extraEnv = ''
      $env.PATH = ($env.PATH | split row (char esep) |
        ${
          if stdenv.isDarwin then
            "append [/etc/profiles/per-user/mkapra/bin /run/current-system/sw/bin]"
          else
            "append []"
        }
      )
      $env.LS_COLORS = (${pkgs.unstable.vivid}/bin/vivid generate ${./static/everforest_vivid_theme})
    '';

    extraConfig = ''
      $env.config.show_banner = false

      def help [cmd] {
        nu -c $"($cmd) --help" | bat --style=plain --paging=never
      }
    '';
  };

  programs.carapace.enableNushellIntegration = config.programs.nushell.enable;
  programs.direnv.enableNushellIntegration = config.programs.nushell.enable;
  programs.zoxide.enableNushellIntegration = config.programs.nushell.enable;
  programs.starship.enableNushellIntegration = false;
}
