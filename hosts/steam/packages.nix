{ pkgs, config, inputs, user, lib, ... }:

{
  environment.systemPackages = with pkgs; [

    micro
    btop
    dysk
    fastfetch
    tuigreet
    ntfsprogs
    ntfs3g
    nix-output-monitor
    wayfire
    hyprlock
    shaderbg
    kitty
    vscode
    zoxide

    steam-run    
    # bottles
    # lutris
    protontricks
    # winetricks
    # seatd
    mangohud
    
    appimage-run
    vulkan-tools
    ananicy-cpp
    ananicy-rules-cachyos      
    
  ];
  
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    montserrat
  ];

  fonts.fontconfig = {
    defaultFonts = {
      monospace = ["JetBrains Mono"];      
      sansSerif = ["Montserrat"];
      serif = ["Montserrat"];
    };
  };
  
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
      remotePlay.openFirewall = true; 
      dedicatedServer.openFirewall = true; 
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

    firefox.enable = true;
    zsh.enable = true;
    nix-ld.enable = true;

    git = {
      enable = true;
      config = {
        user.name = "cjlester41";
        user.email = "cjlester@outlook.com";
        init.defaultBranch = "main";
      };
    };

    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d --keep 5";
      };
      flake = "/home/${user}/nix-config"; 
    };     
  };
}
