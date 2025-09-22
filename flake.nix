{
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";
    stylix.url = "github:danth/stylix";

    # wf-config.url = "github:cjlester41/wf-config";
    # wayfire.url = "github:cjlester41/wayfire";
    # wayfire-plugins-extra = "github:cjlester41/wayfire-plugins-extra";

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
          { nixpkgs.overlays = [ (import ./overlays/wf-config.nix) ]; }
          { nixpkgs.overlays = [ (import ./overlays/wayfire.nix) ]; }
          # { nixpkgs.overlays = [ (import ./overlays/wayfire-plugins-extra.nix) ]; }
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
        ];
        specialArgs = {
      	  inherit inputs private;
        };
      };

      NixOS-Steam = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./profiles/steam
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
# borders
# swaync?
# fastfetch gpu
# nm-connection-editor waybar
# firefox plugins
# launcher
# opaque on fullscreen
# dark cubemap
# rotate blur
# stylix dark reader

# fu script
# tty fonts
# launch floating
# cava stylix
# codium colors
# mouse switching
# import wf plugins
# workspace launch


