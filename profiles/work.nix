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

  environment.systemPackages = with pkgs; [

    jdk11
    maven
    cmatrix
    lolcat
    signal-desktop
    factorio
    # python312full  
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    factorio = pkgs.factorio.override {
      username = private.git-name;
      token = "b100c02ff51800924f6b47271cc64c";
    };
  };

  powerManagement.cpuFreqGovernor = "performance";

  environment.sessionVariables = {
    KWIN_LOW_LATENCY = "1";
    KWIN_TRIPLE_BUFFER = "1";
    KWIN_COMPOSE = "O2";
    KDE_NO_PRELOADING = "0";
    BALOO_DISABLE = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
}