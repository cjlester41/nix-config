{ pkgs, config, inputs,  lib, private, ... }:

{
  environment.systemPackages = with pkgs; [
  
    micro 
    caligula
    spotify-player
    gnome-calculator
    btop    
    mpv   
    shaderbg
    dysk
    hyprlock
    tuigreet
    hyprland
    alacritty
    # wayfirePlugins.wf-shell
    # vscode
    # wayfire
    # wayfirePlugins.wayfire-plugins-extra 
    # wayfirePlugins.wcm
    # swaynotificationcenter

    # utils
    # advcpmv need alternative
    eza
    nmap
    rofi
    unzip
    blueman
    wlr-randr
    minicom
    usbutils
    nemo
    udiskie
    ntfs3g
    gparted
    pavucontrol
    zenity # gui dialog boxes
    wlogout
    # nvd #nix pkg diff
    wget
    zoxide # cd tool. implemented? 
    candy-icons
    gedit
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

    wayfire = {
      enable = true;
      plugins = with pkgs.wayfirePlugins; [
        # wayfire-plugins-extra
        # wf-shell
        # windecor
      ];
    };

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


