# sudo nixos-rebuild switch --flake .#gaming --show-trace  
#TODO:
# borders
# swaync?
# tty fonts
# launch floating
# host/username imports
# cava stylix
# codium colors
# mouse switching
# import wf plugins
# workspace launch
# firefox stylix

{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";
    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, chaotic, home-manager, ... }@inputs: let
  
    # hostnm = builtins.getEnv "HOSTNAME"; #"NixOS s7"; #{config.networking.hostName};
    user = "cjlester"; #{config.users.users.username};
    system = "x86_64-linux";

  in { 
    nixosConfigurations = {

      NixOS-B460 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./hosts/gaming
          ./gpu/amd.nix
        ];
      specialArgs = {
          inherit inputs;
          # inherit hostnm;
          inherit user;
        };
      };

      NixOS-AOC = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./hosts/work
          ./gpu/intel.nix
        ];
        specialArgs = {
          inherit inputs;
          # inherit hostnm;
          inherit user;
        };
      };

      NixOS-S7 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./hosts/laptop
          ./gpu/amd.nix    
        ];
      specialArgs = {
      	  inherit inputs;
      	  # inherit hostnm;
      	  inherit user;
        };
      };
    };
  };
}

