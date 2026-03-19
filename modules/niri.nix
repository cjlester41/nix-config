{ lib, inputs, pkgs, ... }:

{
  imports = [ inputs.niri-flake.nixosModules.niri ];
  nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable; 
  };
  # home-manager.sharedModules = [
  #   {
  #     xdg.configFile.niri-config.enable = lib.mkForce false;
  #   }
  # ];
}
