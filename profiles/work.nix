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

  networking.hostName = "NixOS-AOC";

  system.stateVersion = "24.11";

  environment.systemPackages = with pkgs; [

    signal-desktop
    spotify-player
    # factorio
    minicom
    gimp
    
  ];  

  # programs = {
  #   gamescope.enable = true;
  #   gamescope.capSysNice = true;
  #   gamemode.enable = true;
  #   steam = {
  #     enable = true;
  #     extraCompatPackages = [ pkgs.proton-ge-bin ];
  #     gamescopeSession.enable = true;
  #     remotePlay.openFirewall = true;
  #     dedicatedServer.openFirewall = true;
  #     localNetworkGameTransfers.openFirewall = true; 
  #   };
  # };

  # nixpkgs.config.packageOverrides = pkgs: {
  #   factorio = pkgs.factorio.override {
  #     username = private.git-name;
  #     token = "";
  #   };
  # };
  
  # environment.variables = {
  #   WAYFIRE_PLUGIN_PATH="/home/cjlester/wf-idle-expo/result/lib/wayfire";
  #   WAYFIRE_PLUGIN_XML_PATH="/home/cjlester/wf-idle-expo/result/share/wayfire/metadata";
  # };

  powerManagement.cpuFreqGovernor = "performance";
}