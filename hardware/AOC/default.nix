{ pkgs, ... }:

{
  stylix.targets = {
    plymouth.enable = false;
  };  

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
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

  imports = [ 
    
    ./hardware-configuration.nix
    ./intel-gpu.nix
    ./filesystems.nix

  ];
}