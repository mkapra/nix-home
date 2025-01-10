{
  description = "mkapra's personal home-manager configuration";

  outputs = { self, ... }: {
    homeManagerModules.default = self.homeManagerModules.mkapra-home;
    homeManagerModules.mkapra-home = import ./home.nix;
  };
}
