{ config, pkgs, inputs, spicetify-nix, lib, chaotic, nix-gaming, neve, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
    ../../stylix.nix
    ../../packages.nix
    ../../user.nix
    ./hardware-configuration.nix
    ./boot.nix
    ./services.nix
    ./packages.nix
  ];

  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024;
  }];

  system.stateVersion = "24.11";
  time.timeZone = "America/Vancouver";
  i18n.defaultLocale = "en_CA.UTF-8";
  # virtualisation.podman.enable = true;
  # virtualisation.libvirtd.enable = true;
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };

  networking = {
    hostName = "nixos";
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
  # systemd.user.services."app-org.kde.kalendarac@autostart".enable = false;
  systemd.network.wait-online.enable = false;

  # users.users.cjlester = {
  #   isNormalUser = true;
  #   description = "cjlester";
  #   extraGroups = [ "networkmanager" "wheel" "audio" "gamemode" "video" "kvm" "libvirtd"];
  #   # packages = with pkgs; [ kdePackages.kate ];
  #   shell = pkgs.zsh;
  # };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  nixpkgs.config.allowUnfree = true;

  powerManagement.cpuFreqGovernor = "performance";
  #hardware.graphics.enable = true;
  #hardware.graphics.enable32Bit = true;
  #hardware.cpu.amd.updateMicrocode = true;
  #hardware.nvidia-container-toolkit.enable = true;
  #hardware.enableAllFirmware = true;
  #hardware.nvidia = {
  #  modesetting.enable = true;
  #  powerManagement.enable = true;
  #  powerManagement.finegrained = false;
  #  open = false;
  #  nvidiaSettings = true;
  #  package = config.boot.kernelPackages.nvidiaPackages.stable;
    #nvidiaPersistenced = true;
    #forceFullCompositionPipeline = true;
  #};

}
