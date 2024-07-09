{ ... }: {
  home.file."btoptheme" = {
    source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/rose-pine/btop/main/rose-pine-dawn.theme";
      sha256 = "9c5863fefe2ccce52e06efc0c9d7a6f1f75387e0dec50452bb0bbb56266743ac";
    };
    target = ".config/btop/themes/rosepine_dawn.theme";
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "rosepine_dawn";
    };
  };
}
