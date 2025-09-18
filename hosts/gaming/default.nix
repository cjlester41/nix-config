{ config, pkgs, inputs, lib, chaotic, nix-gaming, user, ... }:

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

  networking.hostName = "NixOS-B460";

  fileSystems."/home/${user}/share" = {
    device = "/dev/disk/by-uuid/7A50CDFB34EF3C22";
    fsType = "ntfs";
    # options = [ "subvol=games" ];
  };

  fileSystems."/home/${user}/steam" = {
    device = "/dev/disk/by-uuid/7c63130c-adf0-48fe-94ab-cda7181379d1";
    fsType = "ext4";
    options = [ "exec" ];
  };

  powerManagement.cpuFreqGovernor = "performance";

  environment.sessionVariables = {
      KWIN_LOW_LATENCY = "1";
      KWIN_TRIPLE_BUFFER = "1";
      KWIN_COMPOSE = "O2";
      KDE_NO_PRELOADING = "0";
      BALOO_DISABLE = "1";
      MOZ_ENABLE_WAYLAND = "1";
      #XDG_CACHE_HOME = "/home/isolde/.cache";
      #NIXOS_OZONE_WL = "1";
  };
  

  # environment = {
  #   loginShellInit = ''
  #     [[ "$(tty)" = "/dev/tty1" ]] && ./gs.sh
  #   '';
  # };

  # hardware = {
  #   enableRedistributableFirmware = true;
  #   bluetooth.enable = true;
  #   bluetooth.powerOnBoot = true;
  # };

  # swapDevices = [{
  #   device = "/swapfile";
  #   size = 16 * 1024;
  # }];
  
  # system.stateVersion = "24.11";
  # time.hardwareClockInLocalTime = true;
  # time.timeZone = "America/Vancouver";
  # i18n.defaultLocale = "en_CA.UTF-8";

  # system.autoUpgrade = {
  #   enable = true;
  #   allowReboot = false;
  # };
  
  # console = {
  #   font = "Lat2-Terminus16";
  #   # keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  
    # networkmanager.enable = true;
    # nameservers = [ "8.8.8.8" "8.8.4.4" "1.1.1.1" ];
    # firewall = {
    #   enable = true;
    #   allowedTCPPorts = [ 22 80 443 59010 59011 ];
    #   allowedUDPPorts = [ 59010 59011 ];
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

  # security.sudo = {
  #   enable = true;
  #   wheelNeedsPassword = false;
  # };

  # nixpkgs.config.allowUnfree = true;

  
}
