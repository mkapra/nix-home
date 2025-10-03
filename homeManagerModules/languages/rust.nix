{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.mkapra-home.rust.enable = lib.mkEnableOption "install rust";

  config = lib.mkIf config.mkapra-home.rust.enable {
    home.packages = with pkgs; [
      gcc
      rustc
      cargo
      rust-analyzer
      rustfmt
      clippy
    ];

    programs.helix.languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
          formatter = {
            command = "rustfmt";
          };
        }
      ];
    };
  };
}
