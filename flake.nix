{
  inputs.nixpkgs.url = "nixpkgs/nixos-25.05";
  inputs.nixpkgs-deprecated.url = "nixpkgs/nixos-24.11";
  inputs.nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

  outputs = inputs@{ self, ... }: let
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs { inherit system; };
    pkgs-deprecated = import inputs.nixpkgs-deprecated { inherit system; };
    pkgs-unstable = import inputs.nixpkgs-unstable { inherit system; };
  in {
    homeManagerModules.default = self.homeManagerModules.mkapra-home;
    homeManagerModules.mkapra-home = import ./home.nix { inherit pkgs pkgs-deprecated pkgs-unstable; };
  };
}
