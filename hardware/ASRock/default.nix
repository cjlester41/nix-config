{ config, pkgs, lib, ... }:

{
  stylix.targets = {
    plymouth.enable = false;
  };  

  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };
  };


  imports = [ 
    
    ./hardware-configuration.nix
    ./nvidia-gpu.nix
    ./filesystems.nix

  ];  
}
