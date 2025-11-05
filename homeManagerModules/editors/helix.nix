{ pkgs, ... }:
{
  home.file = {
    ".config/helix/themes/everforest_light.toml".source = ../files/helix_everforest_light.toml;
  };

  programs.helix = {
    package = pkgs.unstable.helix;
    defaultEditor = true;
    settings = {
      theme = "everforest_light";
      keys.normal = {
        C-g = [
          ":new"
          ":insert-output lazygit"
          ":buffer-close"
          ":redraw"
        ];
        V = [
          "goto_first_nonwhitespace"
          "extend_to_line_end"
        ];
        D = [
          "ensure_selections_forward"
          "extend_to_line_end"
        ];
        a = [
          "append_mode"
          "collapse_selection"
        ];
        space = {
          space.h = ":toggle-option file-picker.hidden";
          space.b = ":sh ${pkgs.tmux}/bin/tmux new-window '${pkgs.tig}/bin/tig blame +%{cursor_line} %{buffer_name}'";
          B = ":sh ${pkgs.git}/bin/git blame -L %{cursor_line},+1 %{buffer_name}";
          i = ["open_below" ":append-output echo debugger" "normal_mode" ":write"];
        };
      };
      keys.select = {
        ";" = [
          "collapse_selection"
          "normal_mode"
        ];
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
      language = [
        {
          name = "perl";
          text-width = 80;
          rulers = [ 80 ];
        }
        {
          name = "javascript";
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = [
              "--parser"
              "typescript"
              "--print-width"
              "100"
            ];
          };
        }
        {
          name = "typescript";
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = [
              "--parser"
              "typescript"
              "--print-width"
              "100"
            ];
          };
        }
      ];
      language-server.yaml-language-server.config = {
        yaml.customTags = [
          "!reference sequence"
        ];
      };
    };
    extraPackages = with pkgs; [
      dockerfile-language-server-nodejs
      marksman
      markdown-oxide
      nil
      nodePackages.bash-language-server
      perlnavigator
      texlab
      yaml-language-server
      python3Packages.python-lsp-server
      ansible-language-server
      ansible-lint
    ];
  };

  programs.nushell.environmentVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };
}
