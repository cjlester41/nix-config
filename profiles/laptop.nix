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

  environment.sessionVariables = {
    KWIN_LOW_LATENCY = "1";
    KWIN_TRIPLE_BUFFER = "1";
    KWIN_COMPOSE = "O2";
    KDE_NO_PRELOADING = "0";
    BALOO_DISABLE = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
}
