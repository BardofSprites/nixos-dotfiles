{
  description = "A NixOS configuration for higher level computing purposes";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
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
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit (self.inputs) zen-browser;
                };
                users.bard = {
                  imports = [ ./home-manager/home.nix ];
                };
              };
            }
          ];
        };
        seraph = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/seraph/configuration.nix

            # Integrate Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                users.bard = import ./home-manager/home-server.nix;
              };
            }
          ];
        };
      };
    };
}
