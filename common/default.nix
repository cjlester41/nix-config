{ pkgs, ... }:

{
  imports = [ 
    ./packages.nix 
    ./services.nix 
    ./user.nix 
    ./stylix.nix 
  ];
  
  # xdg.icons.enable = true;
  # xdg.portal = {
    # enable = true;
    # extraPortals = with pkgs; [
      # xdg-desktop-portal-gtk
      # xdg-desktop-portal-gnome
    # ];
    # config = {
      # niri.default = [ "gtk" ];
      # common.default = [ "*" ];
      # common.default = [ "gtk" ];
    # };
  # };

  systemd.tmpfiles.rules = [
    "d '/var/cache/tuigreet' - greeter greeter - -" #0755 greetd greetd -"
  ];
  
  boot = {    
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
    # enableAllFirmware = true;
  };
  
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

  systemd.targets = {
    sleep.enable = true;
    suspend.enable = true;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };
  
  systemd.network.wait-online.enable = false;

  #polkit, gnome keyring?
  security = {
    sudo.enable = true;
    sudo.wheelNeedsPassword = false;
    polkit.enable = true;
    rtkit.enable = true;
    # pam.services.hyprlock.text = ''auth include login''; 
  };

  nixpkgs.config.allowUnfree = true;

  environment = {
    variables = {
      NIXOS_OZONE_WL = "1";
      # DISPLAY = ":0";
    };
    sessionVariables = {
      WAYFIRE_SOCKET = "/run/user/1000/wayland-1"; #$(id -u)/wayland-1";
      MOZ_ENABLE_WAYLAND = "1";
      NEWT_COLORS="root=white,black";
    };
  };
  
  environment.pathsToLink = [
    "/share/icons"
    "/share/pixmaps"
  ];
  
  # nix.gc = {
  #     automatic = true;
  #     dates = "daily";
  #     options = "-d";
  #   };
}