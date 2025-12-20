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

  networking.hostName = "NixOS-S7";

  system.stateVersion = "25.05";

  boot.loader = {
      systemd-boot.enable = lib.mkForce false;
      grub.enable = true;
      grub.device = "/dev/sda";
      grub.useOSProber = true;
  };

  environment.systemPackages = with pkgs; [

    swaybg

  ];

  services.logind.settings.Login.HandleLidSwitch = "sleep";

  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024;
  }];
}
