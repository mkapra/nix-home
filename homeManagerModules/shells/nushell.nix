{ config, lib, ... }: {
  options = {
    mkapraConfig.nushell.enable = lib.mkEnableOption "enable nushell";
  };

  config = lib.mkIf config.mkapraConfig.nushell.enable {
    programs.nushell = {
      enable = true;
      shellAliases = {
        nd = "nix develop -c $env.SHELL";
        grep = "rg";
      };

      extraConfig = ''
      let config = {
        show_banner: false,
      }

      def help [cmd] {
        nu -c $"($cmd) --help" | bat --style=plain --paging=never
      }

      def --env gitoff [] {
        $env.gitoff = true
      }
      def --env giton [] {
        hide-env gitoff
      }
      def create_left_prompt [] {
        let path = pwd
        let nix_shell = ($env | select -i IN_NIX_SHELL | get IN_NIX_SHELL | is-empty)
        let branch = (git rev-parse --abbrev-ref HEAD err> /dev/null)

        let snowflake = "❆"

        mut prompt = $path

        if (($branch | is-not-empty) and not ("gitoff" in $env)) {
          let has_changes = (git status --porcelain err> /dev/null)

          $prompt += " ("

          if ($has_changes | is-not-empty) {
            $prompt += $"(ansi yellow)"
          }
          $prompt += $"($branch)(ansi reset)\)"
        }

        if not $nix_shell {
          $prompt += $" (ansi blue)($snowflake)(ansi reset) "
        }

        $prompt
      }

      $env.PROMPT_COMMAND = { create_left_prompt }
      $env.PROMPT_COMMAND_RIGHT = {|| "" }
      $env.TRANSIENT_PROMPT_COMMAND = {|| "" }
      $env.TRANSIENT_PROMPT_INDICATOR = "> "
      $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = $env.TRANSIENT_PROMPT_INDICATOR
      '';
    };

    programs.carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    programs.bat = {
      enable = true;
      config = { theme = "ansi"; };
    };

    programs.zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };

    programs.atuin = {
      enable = true;
      enableNushellIntegration = true;
      settings.workspaces = true;
    };

    programs.ripgrep.enable = true;
  };
}
