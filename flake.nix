{
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/25.11-beta";
    # chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    stylix.url = "github:danth/stylix";  

    # firefox-addons = { 
    #   url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"; 
    #   inputs.nixpkgs.follows = "nixpkgs"; 
    # };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: let       
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

  in { 
    nixosConfigurations = {

      NixOS-B460 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./profiles/gaming.nix
        ];
        specialArgs = {
          inherit inputs;
          private = import ./hardware/B460/private.nix;
        };
      };

      NixOS-AOC = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./profiles/work.nix
        ];
        specialArgs = {
          inherit inputs;
          private = import ./hardware/AOC/private.nix;
        };
      };

      NixOS-S7 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./profiles/laptop.nix
        ];
        specialArgs = {
      	  inherit inputs;
          private = import ./hardware/sS7/private.nix;
        };
      };

      NixOS-Steam = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./profiles/PATRICK.nix
        ];
        specialArgs = {
          inherit inputs;
          private = import ./hardware/ASRock/private.nix;
        };
      };
    };
  };
}






# sudo nixos-rebuild switch --flake .#gaming --show-trace  
#TODO:

# auto staging
# restart ipc
# variables for session, animations, homepage, stylix, etc
# seperate home
# code not in path
# dark cubemap
# cava stylix
# mouse view switching
# xdg portal
# git pull.rebase
# permission for root opened from launcher



