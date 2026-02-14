{ pkgs, ... }:

{
  imports = [
    ../../common
    
    ./hardware-configuration.nix
    ./filesystems.nix

    ../../profiles/development.nix
    ../../profiles/remotedev.nix 
    ../../profiles/gaming.nix 
    ../../profiles/amd-gpu.nix
  ];
  
  networking = {
    hostName = "NixOS-B460";
    networkmanager.dns = "none";
    # useDHCP = false;
    # dhcpcd.enable = false;
  };
  
  system.stateVersion = "25.05";
  powerManagement.cpuFreqGovernor = "performance";
  
  hardware.uinput.enable = true;
  
  boot = {
    # kernelModules = [ "uinput" ];
    kernelPackages = pkgs.linuxPackages_testing;
  };
}
