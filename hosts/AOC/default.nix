{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./filesystems.nix
    ../../common
    
    ../../profiles/development.nix
    ../../profiles/remotedev.nix 
    ../../profiles/work.nix 
    ../../profiles/intel-gpu.nix 
  ];
  
  networking.hostName = "NixOS-AOC";
  system.stateVersion = "24.11";
  powerManagement.cpuFreqGovernor = "performance";

  boot = {
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "loglevel=3" ];
  };
}