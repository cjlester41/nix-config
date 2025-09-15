{ pkgs, config, inputs, lib, ... }:
{

  environment.systemPackages = with pkgs; [

    jdk11
    maven
    cmatrix
    lolcat
    signal-desktop
    factorio
    # python312full  
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
  };

  nixpkgs.config.packageOverrides = pkgs: {
    factorio = pkgs.factorio.override {
      username = "cjlester41";
      token = "b100c02ff51800924f6b47271cc64c";
    };
  };
}

