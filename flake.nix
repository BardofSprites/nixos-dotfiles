{
  description = "A NixOS configuration for higher level computing purposes";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        pocket = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/pocket/configuration.nix
            ./nixos
            ./home-manager
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.bard = { imports = [ ./home-manager/home.nix ]; };
              };
            }
          ];
        };
      };
    };
}
