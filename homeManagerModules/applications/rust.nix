{ pkgs, ... }: {
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
}
