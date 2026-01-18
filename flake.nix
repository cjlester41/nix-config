{
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";    
    stylix.url = "github:nix-community/stylix";  
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nvf.url = "github:notashelf/nvf";
    # nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";

    # firefox-addons = { 
    #   url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"; 
    #   inputs.nixpkgs.follows = "nixpkgs"; 
    # };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: let       
    system = "x86_64-linux";
    # pkgs = nixpkgs.legacyPackages.${system};

  in { 
    nixosConfigurations = {

      NixOS-B460 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hardware/B460 ];
        specialArgs = {
          inherit inputs;
          vars = import ./hardware/B460/variables.nix;
        };
      };

      NixOS-AOC = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hardware/AOC ];
        specialArgs = {
          inherit inputs;
          vars = import ./hardware/AOC/variables.nix;
        };
      };

      NixOS-S7 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./profiles/laptop.nix
        ];
        specialArgs = {
      	  inherit inputs;
          vars = import ./hardware/sS7/variables.nix;
        };
      };

      NixOS-Steam = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./profiles/PATRICK.nix
        ];
        specialArgs = {
          inherit inputs;
          vars = import ./hardware/ASRock/variables.nix;
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



