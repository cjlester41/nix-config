{ inputs, pkgs, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
    # ${vars.hardware}
    ../../common.nix
    ../../stylix.nix
    ../../packages.nix
    ../../user.nix
    ../../services.nix   
   
    ./hardware-configuration.nix
    ./intel-gpu.nix
    ./filesystems.nix

    ../../profiles/development.nix
    ../../profiles/remotedev.nix 
    ../../profiles/work.nix 
  ];
  
  networking.hostName = "NixOS-AOC";
  system.stateVersion = "24.11";
  powerManagement.cpuFreqGovernor = "performance";
  
  stylix.targets = {
    plymouth.enable = false;
  };  

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