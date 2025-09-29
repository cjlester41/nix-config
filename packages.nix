{ pkgs, config, inputs,  lib, private, ... }:

{
  environment.systemPackages = with pkgs; [
  
    micro 
    # minicom
    # caligula
    # spotify-player
    # vlc  
    galculator    
    shaderbg
    dysk
    hyprlock
    tuigreet
    cmatrix
    lolcat

    # utils
    # advcpmv need alternative
    eza
    nmap
    blueman
    wlr-randr    
    usbutils
    file-roller
    udiskie
    ntfs3g
    gparted
    pavucontrol
    feh    
    wlogout    
    wget
    zoxide # cd tool. implemented? 
    candy-icons
    nwg-drawer
    networkmanagerapplet
    nix-output-monitor
    vlc
    # nvd #nix pkg diff
    # zenity # gui dialog boxes

    #Coding Stuff
    python3
    # binutils
    # gcc
    # cmake
    # nix-prefetch-git
    

  ];

  programs = {

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


