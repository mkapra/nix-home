{ pkgs, lib, ... }: {
  options.mkapra-home.rust.enable = lib.mkEnableOption "install rust";

  config = lib.mkIf mkapra-home.rust.enable {
    home.packages = with pkgs; [
      gcc
      rustc
      cargo
      rust-analyzer
      rustfmt
      clippy
    ];
  
    programs.helix.languages = {
      language = [{
        name = "rust";
        auto-format = true;
        formatter = {
          command = "rustfmt";
        };
      }];
    };
  };
}
