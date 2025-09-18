{ config, pkgs, inputs, lib, chaotic, nix-gaming, ... }: #neve?

{
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

  systemd.targets = {
    sleep.enable = true;
    suspend.enable = true;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };
  
  systemd.network.wait-online.enable = false;

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
  environment.sessionVariables.WAYFIRE_SOCKET = "/run/user/$(id -u)/wayland-1";

}