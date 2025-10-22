{ config, pkgs, inputs, lib, chaotic, nix-gaming, private, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
    ../hardware/${private.hardware}
    ../common.nix
    ../stylix.nix
    ../packages.nix
    ../user.nix
    ../services.nix    
  ];

  networking.hostName = "NixOS-AOC";

  system.stateVersion = "24.11";

  environment.systemPackages = with pkgs; [

    # jdk11
    # maven
    signal-desktop
    factorio
    minicom
    gimp
    # python314
    nix-prefetch-git
    shaderbg
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    factorio = pkgs.factorio.override {
      username = private.git-name;
      token = private.factorio;
    };
  };

  powerManagement.cpuFreqGovernor = "performance";
}