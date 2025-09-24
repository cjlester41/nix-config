{ pkgs, config, inputs,  lib, private, ... }:

{
  environment.systemPackages = with pkgs; [
  
    micro 
    caligula
    spotify-player
    galculator
    btop    
    vlc  
    shaderbg
    dysk
    hyprlock
    # tuigreet
    hyprland
    cmatrix
    lolcat
    # swaynotificationcenter

    # utils
    # advcpmv need alternative
    eza
    nmap
    unzip
    blueman
    wlr-randr
    minicom
    usbutils
    nemo
    file-roller
    udiskie
    ntfs3g
    gparted
    pavucontrol
    feh
    zenity # gui dialog boxes
    wlogout
    # ghostty
    # nvd #nix pkg diff
    wget
    zoxide # cd tool. implemented? 
    candy-icons
    nwg-drawer
    networkmanagerapplet

    #Coding Stuff
    python312
    gcc
    cmake
    nix-prefetch-git
    nix-output-monitor

  ];

  programs = {

    # wayfire = {
    #   enable = true;
    #   plugins = with pkgs.wayfirePlugins; [
    #     wayfire-plugins-extra
    #     # wf-shell
    #     # windecor
    #   ];
    # };

    firefox.enable = true;
    zsh.enable = true;
    dconf.enable = true;
    nix-ld.enable = true;

    git = {
      enable = true;
      config = {
        user.name = private.git-name;
        user.email = private.git-mail;
        init.defaultBranch = "main";
      };
    };

    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d --keep 5";
      };
      flake = "/home/${private.username}/nix-config"; 
    };     
  }; 
}


