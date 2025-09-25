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
    ../boot.nix
  ];

  networking.hostName = "NixOS-S7";

  environment.systemPackages = with pkgs; [

    swaybg

  ];

  services.logind.lidSwitch = "sleep";

  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024;
  }];
}
