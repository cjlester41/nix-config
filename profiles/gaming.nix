{ config, pkgs, inputs, lib, chaotic, nix-gaming, private, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
    ../hardware/${private.hardware}
    ../common.nix
    ../stylix.nix
    ../packages.nix
    ../user.nix
    ../services.nix
  ];

  networking = {
    hostName = "NixOS-B460";
    networkmanager.dns = "none";
    useDHCP = false;
    # dhcpcd.enable = false;
  };
  
  environment.systemPackages = with pkgs; [

    steam-run    
    bottles
    lutris
    protontricks
    winetricks
    seatd
    mangohud
    ntfsprogs

    appimage-run
    vulkan-tools
    ananicy-cpp
    ananicy-rules-cachyos 
    
  ];

  programs = {
    gamescope.enable = true;
    gamescope.capSysNice = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; 
    };

    appimage = {
      enable = true;
      binfmt = true;
      package = pkgs.appimage-run.override {
        extraPkgs = pkgs: [
          pkgs.glibc
          pkgs.libGL
          pkgs.mesa
          pkgs.libffi
          pkgs.vulkan-loader
          pkgs.xdg-utils
          pkgs.wayland
        ];
      };
    };   
  };

  powerManagement.cpuFreqGovernor = "performance";
  
}
