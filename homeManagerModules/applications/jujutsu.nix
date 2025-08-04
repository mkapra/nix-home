{ config, ... }: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = config.programs.git.userEmail;
        name = config.programs.git.userName;
      };
    };
  };

  programs.nushell.extraConfig = ''
    ${pkgs-unstable.jujutsu}/bin/jj util completion nushell | save ~/.config/nushell/completions-jj.nu
    use ~/.config/nushell/completions-jj.nu *
  '';
}
