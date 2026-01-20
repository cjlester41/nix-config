{ pkgs, ... }:

{
  imports = [ 
    ../../common
   
   ./hardware-configuration.nix
   ./filesystems.nix
   
   ../../profiles/gaming.nix 
   ../../profiles/nvidia-gpu.nix
  ];
  
  environment.systemPackages = with pkgs; [
    freecad
  ];

  networking.hostName = "NixOS-Steam";
  system.stateVersion = "25.05";
  powerManagement.cpuFreqGovernor = "performance";
  
  environment.sessionVariables = {
    QT_QPA_PLATFORM="xcb";
  };
  
  boot = {
    # kernelPackages = pkgs.linuxPackages_latest;
  };
}
