{ pkgs, config, inputs, neve, lib, ... }:
{

environment.systemPackages = with pkgs; [

    steam-run    
    bottles
    lutris
    protontricks
    winetricks

    # appimage-run
    # ananicy-cpp
    # ananicy-rules-cachyos   
  ];
  
  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      gamescopeSession.enable = true;
    };
  };
}
