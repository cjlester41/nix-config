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
    pkgs = nixpkgs.legacyPackages.${system};

  in { 
    packages.${system}.default = (import ./overlays/neon/default.nix { inherit pkgs; });
    nixosConfigurations = {

      NixOS-B460 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./profiles/gaming.nix
          { nixpkgs.overlays = [ (import ./overlays/wayfire.nix) ]; }
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
          ./profiles/PATRICK.nix
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


# add freecad !simple tile #
# restart ipc
# link volume keys
# windows partition
# steam windows and nix #
# auto staging

# variables for session, animations, homepage, stylix, etc
# seperate home
# code not in path
# dark cubemap
# cava stylix
# mouse view switching
# xdg portal
# git pull.rebase



