{
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";
    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    private.url = "/home/private";
  };

  outputs = { self, nixpkgs, chaotic, home-manager, private, ... }@inputs: let    
    
    usernm = private.username;
    hardware = private.hardware;
    system = "x86_64-linux";

  in { 
    nixosConfigurations = {

      NixOS-B460 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./profiles/gaming.nix
          ./hardware/${hardware}
        ];
        specialArgs = {
          inherit inputs usernm hardware private;
          # inherit usernm;
          # inherit hardware;
          # inherit private;
        };
      };

      NixOS-AOC = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./hosts/work
        ];
        specialArgs = {
          inherit private;
          inherit inputs;
          inherit usernm;
          inherit hardware;
        };
      };

      NixOS-S7 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./hosts/laptop
        ];
        specialArgs = {
      	  inherit inputs;
      	  inherit usernm;
          inherit hardware;
        };
      };

      NixOS-Steam = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./hosts/steam
        ];
        specialArgs = {
          inherit private;
      	  inherit inputs;
      	  inherit usernm;
          inherit hardware;
        };
      };
    };
  };
}

# sudo nixos-rebuild switch --flake .#gaming --show-trace  
#TODO:
# borders
# swaync?
# wlogout
# icons
# fastfetch gpu
# gui network manager
# firefox plugins
# fu script
# LUK lanzaboote
# dns is off!!!

# tty fonts
# launch floating
# cava stylix
# codium colors
# mouse switching
# import wf plugins
# workspace launch


