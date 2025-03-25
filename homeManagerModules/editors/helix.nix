{ pkgs-unstable, ... }: {
  home.file = {
    ".config/helix/themes/everforest_light.toml".source = ../files/helix_everforest_light.toml;
  };

  programs.helix = {
    package = pkgs-unstable.helix;
    defaultEditor = true;
    settings = {
      theme = "everforest_light";
      keys.normal = {
        V = ["goto_first_nonwhitespace" "extend_to_line_end"];
        D = ["ensure_selections_forward" "extend_to_line_end"];
        a = ["append_mode" "collapse_selection"];
      };
      keys.select = {
        ";" = ["collapse_selection" "normal_mode"];
        x = "extend_line";
        V = "extend_to_line_end";
      };
      editor = {
        line-number = "relative";
        true-color = true;
        idle-timeout = 100;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        whitespace.render = {
          space = "none";
          tab = "all";
          nbsp = "none";
          nnbsp = "none";
          newline = "all";
        };
        file-picker.hidden = false;
        indent-guides = {
          render = true;
          skip-levels = 1;
        };
        lsp.display-inlay-hints = true;
        inline-diagnostics = {
          cursor-line = "error";
        };
        end-of-line-diagnostics = "hint";
      };
    };
    languages = {
      language = with pkgs; [
        {
          name = "perl";
          text-width = 80;
          rulers = [ 80 ];
        }
        {
          name = "javascript";
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = ["--parser" "typescript" "--print-width" "100"];
          };
        }
        {
          name = "typescript";
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = ["--parser" "typescript" "--print-width" "100"];
          };
        }
      ];
    };
    extraPackages = with pkgs-unstable; [
      dockerfile-language-server-nodejs
      marksman
      markdown-oxide
      nil
      nodePackages.bash-language-server
      perlnavigator
      python311Packages.pyls-isort
      python311Packages.python-lsp-server
      texlab
      yaml-language-server
    ];
  };

  programs.nushell.environmentVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };
}
