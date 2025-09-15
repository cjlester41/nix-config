{ config, pkgs, inputs, lib, chaotic, nix-gaming, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
    ../../common.nix
    ../../stylix.nix
    ../../packages.nix
    ../../user.nix
    ../../services.nix
    ./hardware-configuration.nix
    ./boot.nix
    ./packages.nix
  ];

  networking.hostName = "NixOS-S7";

  services.logind.lidSwitch = "sleep";

  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024;
  }];

  # system.stateVersion = "24.11";
  # time.timeZone = "America/Vancouver";
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };
  
  # system.autoUpgrade = {
  #   enable = true;
  #   allowReboot = false;
  # };

  
    # networkmanager.enable = true;
    # networkmanager.dns = "none";
    # useDHCP = false;
    # dhcpcd.enable = false;
    # # interfaces.wlp2s0.useDHCP = lib.mkDefault true;
    # nameservers = [ "8.8.8.8" "8.8.4.4" "1.1.1.1" ];
    # firewall = {
    #   enable = false;
    #   # allowedTCPPorts = [ 22 80 443 59010 59011 ];
    #   # allowedUDPPorts = [ 59010 59011 ];
    # };
  # };

  # nix.settings = {
  #   experimental-features = [ "nix-command" "flakes" ];
  #   auto-optimise-store = true;
  # };

  # nix.gc = {
  #     automatic = true;
  #     dates = "daily";
  #     options = "-d";
  #   };

  # systemd.targets = {
  #   sleep.enable = true;
  #   suspend.enable = true;
  #   hibernate.enable = false;
  #   hybrid-sleep.enable = false;
  # };
  
  # systemd.network.wait-online.enable = false;

  # security = {
  #   sudo.enable = true;
  #   sudo.wheelNeedsPassword = false;
  #   rtkit.enable = true;
  # };

  # nixpkgs.config.allowUnfree = true;

  # powerManagement.cpuFreqGovernor = "performance";

  # environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";
}
