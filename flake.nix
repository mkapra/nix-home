{
  inputs.nixpkgs.url = "nixpkgs/nixos-25.05";
  inputs.nixpkgs-deprecated.url = "nixpkgs/nixos-24.11";
  inputs.nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

  outputs = inputs@{ self, ... }: let
    system = "x86_64-linux";

    pylsp-override = pkgs.python3Packages.python-lsp-server.overridePythonAttrs (oldAttrs: {
      propagatedBuildInputs =
        (oldAttrs.propagatedBuildInputs or [])
        ++ (with pkgs.python3Packages; [pylsp-mypy pylsp-rope pyls-memestra]);
    });

    pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [
        pylsp-override
      ];
    };
    pkgs-deprecated = import inputs.nixpkgs-deprecated { inherit system; };
    pkgs-unstable = import inputs.nixpkgs-unstable { inherit system; };
  in {
    homeManagerModules.default = self.homeManagerModules.mkapra-home;
    homeManagerModules.mkapra-home = import ./home.nix { inherit pkgs pkgs-deprecated pkgs-unstable; };
  };
}
