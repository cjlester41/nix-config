{ pkgs, config, inputs, neve, lib, ... }:
{

environment.systemPackages = with pkgs; [

    steam-run    
    bottles
    lutris
    protontricks
    winetricks
    # gamescope
    seatd

    appimage-run
    vulkan-tools
    ananicy-cpp
    ananicy-rules-cachyos   
  ];
  
  hardware.graphics.extraPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-extension-layer
  ];

  programs = {
    gamescope.enable = true;
    gamescope.capSysNice = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      gamescopeSession.enable = true;
    };
  };
}
