{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "rose_pine_dawn";
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
          nbsp = "all";
          newline = "all";
          tab = "all";
        };
        file-picker = {
          hidden = false;
        };
        indent-guides = {
          render = true;
          skip-levels = 1;
          character = "⸽";
        };
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
