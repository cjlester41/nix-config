{ config, pkgs, inputs, lib, chaotic, nix-gaming, ... }: 

{
  xdg.icons.enable = true;
  
  boot = {    
    kernelPackages = pkgs.linuxPackages_cachyos;
    initrd.systemd.enable = true;
    supportedFilesystems = ["ntfs"];  
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };   
  };

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    enableRedistributableFirmware = true;
  };

  system.stateVersion = "24.11";
  time.hardwareClockInLocalTime = true;
  time.timeZone = "America/Vancouver";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };

  networking = {
    networkmanager.enable = true;
    nameservers = [ "8.8.8.8" "8.8.4.4" "1.1.1.1" ];
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 59010 59011 ];
      allowedUDPPorts = [ 59010 59011 ];
    };
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  # nix.gc = {
  #     automatic = true;
  #     dates = "daily";
  #     options = "-d";
  #   };

  systemd.targets = {
    sleep.enable = true;
    suspend.enable = true;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };
  
  systemd.network.wait-online.enable = false;

  #polkit, gnome kdyring
  security = {
    sudo.enable = true;
    sudo.wheelNeedsPassword = false;
    polkit.enable = true;
    rtkit.enable = true;
    pam.services.hpyrlock.text = ''auth include login''; 
    pam.services.swaylock.text = ''auth include login''; 
  };

  nixpkgs.config.allowUnfree = true;
  environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";
  environment.sessionVariables.WAYFIRE_SOCKET = "/run/user/1000/wayland-1";#$(id -u)/wayland-1";

}