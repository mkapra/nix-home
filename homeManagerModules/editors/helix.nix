{ pkgs, ... }: {
  programs.helix = {
    enable = true;
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
          tab = "all";
          space = "all";
        };
        file-picker.hidden = false;
        indent-guides.render = true;
        lsp.display-inlay-hints = true;
      };
    };
    languages = {
      language = [{
        name = "perl";
        text-width = 80;
        rulers = [ 80 ];
      }];
    };
    extraPackages = with pkgs; [
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
