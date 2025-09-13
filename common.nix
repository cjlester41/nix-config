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

  security = {
    sudo.enable = true;
    sudo.wheelNeedsPassword = false;
    rtkit.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";

}