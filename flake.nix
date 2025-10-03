{
  inputs.nixpkgs.url = "nixpkgs/nixos-25.05";
  inputs.systems.url = "github:nix-systems/default";

  outputs = inputs@{ self, nixpkgs, systems, ... }: let
    eachSystem = nixpkgs.lib.genAttrs (import systems);
  in {
    homeModules.default = self.homeModules.mkapra-home;
    homeModules.mkapra-home = import ./home.nix;
    formatter = eachSystem (system: inputs.nixpkgs.legacyPackages.${system}.nixfmt-tree);
  };
}
