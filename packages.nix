{ pkgs, config, inputs, lib, private, ... }:

{
  environment.systemPackages = with pkgs; [
  
    micro 
    libnotify
    # caligula
    galculator  
    dysk
    hyprlock
    tuigreet

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
    sweet-folders
    nwg-drawer
    networkmanagerapplet
    nix-output-monitor
    vlc
    ghostty
    shaderbg
    
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
    gdk-pixbuf.modulePackages = [ pkgs.librsvg ]; #svg icons fix?
    # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d --keep 5";
      };
      flake = "/home/${private.username}/nix-config"; 
    };     
  }; 

  xdg.portal.enable = true;
  # xdg.portal.wlr.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}


