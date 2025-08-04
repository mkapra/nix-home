{ config, pkgs-unstable, ... }: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = config.programs.git.userEmail;
        name = config.programs.git.userName;
      };
    };
  };

  home.activation = {
    generate_jj_nushell_completion = lib.hm.dag.entryAfter ["writeBoundary"] ''
      ${pkgs-unstable.jujutsu}/bin/jj util completion nushell > ~/.config/nushell/completions-jj.nu
    '';
  };
  programs.nushell.extraConfig = ''
    use ~/.config/nushell/completions-jj.nu *
  '';
}
