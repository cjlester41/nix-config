# sudo nixos-rebuild switch --flake .#gaming --show-trace  
#TODO:
# borders
# swaync?
# wlogout
# home manager
# icons
# secure boot
# fastfetch gpu
# gui network manager
# get user
# firefox plugins
# fu script
# LUK lanzaboote
# dns is off!!!

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
    gputyp = private.gpu-type;
    hw-cfg = private.hardware;
    system = "x86_64-linux";

  in { 
    nixosConfigurations = {

      NixOS-B460 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./hosts/gaming
          ./gpu/${gputyp}
        ];
        specialArgs = {
          inherit inputs;
          inherit usernm;
          inherit hw-cfg;
        };
      };

      NixOS-AOC = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./hosts/work
          ./gpu/${gputyp}
        ];
        specialArgs = {
          inherit inputs;
          inherit usernm;
          inherit hw-cfg;
        };
      };

      NixOS-S7 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./hosts/laptop
          ./gpu/${gputyp}  
        ];
        specialArgs = {
      	  inherit inputs;
      	  inherit usernm;
          inherit hw-cfg;
        };
      };

      NixOS-Steam = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./hosts/steam
          ./gpu/${gputyp}   
        ];
        specialArgs = {
          inherit private;
      	  inherit inputs;
      	  inherit usernm;
          inherit hw-cfg;
        };
      };
    };
  };
}

