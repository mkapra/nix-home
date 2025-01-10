{
  description = "mkapra's personal home-manager configuration";

  inputs.nixpkgs.url = "nixpkgs/nixos-24.11";
  inputs.nixpkgs-deprecated.url = "nixpkgs/nixos-24.05";
  inputs.nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

  outputs = inputs@{ self, ... }:
  let
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
    pkgs-deprecated = inputs.nixpkgs-deprecated.legacyPackages.${system};
    pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${system};
  in {
    homeManagerModules.default = self.homeManagerModules.mkapra-home;
    homeManagerModules.mkapra-home = import ./home.nix { inherit pkgs pkgs-deprecated pkgs-unstable; };
  };
}
