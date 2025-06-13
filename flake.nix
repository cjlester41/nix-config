# sudo nixos-rebuild switch --flake .#gaming --show-trace  
#TODO:
# borders
# swaync?
# network icon
# tty fonts
# launch floating
# host/username imports
# nh os switch
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

  outputs = { self, nixpkgs, chaotic, home-manager, ... }@inputs: {

    nixosConfigurations = {

      gaming = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          chaotic.nixosModules.default
          ./hosts/gaming/configuration.nix
        ];
      };

      work = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          chaotic.nixosModules.default
          ./hosts/work
          ./gpu/intel.nix
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          chaotic.nixosModules.default
          ./hosts/laptop/configuration.nix
        ];
      };
    };
  };
}

