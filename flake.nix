{
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";    
    stylix.url = "github:nix-community/stylix";  
    niri-flake.url = "github:sodiboo/niri-flake";
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
        modules = [ ./hosts/B460 ];
        specialArgs = {
          inherit inputs;
          vars = import ./hosts/B460/variables.nix;
        };
      };

      NixOS-AOC = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/AOC ];
        specialArgs = {
          inherit inputs;
          vars = import ./hosts/AOC/variables.nix;
        };
      };

      NixOS-S7 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/sS7 ];
        specialArgs = {
      	  inherit inputs;
          vars = import ./hosts/sS7/variables.nix;
        };
      };

      NixOS-Steam = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/ASRock ];
        specialArgs = {
          inherit inputs;
          vars = import ./hosts/ASRock/variables.nix;
        };
      };
    };
  };
}
