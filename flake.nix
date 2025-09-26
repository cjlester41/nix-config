{
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    stylix.url = "github:danth/stylix";
    # nix-gaming.url = "github:fufexan/nix-gaming";    

    firefox-addons = { 
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"; 
      inputs.nixpkgs.follows = "nixpkgs"; 
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    private.url = "/home/private";
  };

  outputs = { self, nixpkgs, chaotic, home-manager, private, ... }@inputs: let       
    system = "x86_64-linux";

  in { 
    nixosConfigurations = {

      NixOS-B460 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./profiles/gaming.nix
          # { nixpkgs.overlays = [ (import ./overlays/wayfire.nix) ]; }
        ];
        specialArgs = {
          inherit inputs private;
        };
      };

      NixOS-AOC = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./profiles/work.nix
          { nixpkgs.overlays = [ (import ./overlays/wayfire.nix) ]; }
        ];
        specialArgs = {
          inherit inputs private;
        };
      };

      NixOS-S7 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./profiles/laptop.nix
          { nixpkgs.overlays = [ (import ./overlays/wayfire.nix) ]; }
        ];
        specialArgs = {
      	  inherit inputs private;
        };
      };

      NixOS-Steam = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./profiles/steam.nix
          { nixpkgs.overlays = [ (import ./overlays/wayfire.nix) ]; }
        ];
        specialArgs = {
          inherit inputs private;
        };
      };
    };
  };
}






# sudo nixos-rebuild switch --flake .#gaming --show-trace  
#TODO:


# modify boot in hardware dir
# nvidia settings

# ssh install?

# format steam dir
# seperate home
# nwg drawer hm
# keybinds
# code not in path
# dark cubemap
# swaync?
# fu script
# tty fonts
# launch floating
# cava stylix
# codium colors
# mouse switching
# fix fonts


