{ ..., config, options }: {
  options = {
    mkapraConfig.nushell.enable = lib.mkEnableOption "enable nushell";
  };

  config = lib.mkIf mkapraConfig.nushell.enable {
    programs.nushell = {
      enable = true;
    };
  };
}
