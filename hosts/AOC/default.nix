{ pkgs, ... }:

{
  imports = [
    ../../common
    
    ./hardware-configuration.nix
    ./filesystems.nix

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
    plymouth = {
      enable = false;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };
  };
}