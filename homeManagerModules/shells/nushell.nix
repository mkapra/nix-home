{ config, lib, ... }: {
  options = {
    mkapraConfig.nushell.enable = lib.mkEnableOption "enable nushell";
  };

  config = lib.mkIf config.mkapraConfig.nushell.enable {
    programs.nushell = {
      enable = true;
      shellAliases = {
        nd = "nix develop -c $env.SHELL";
      };
    };
  };
}
