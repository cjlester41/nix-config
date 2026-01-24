{ pkgs, vars, ... }:

{
  environment.systemPackages = with pkgs; [
  
    shaderbg
    libnotify
    # galculator  
    dysk
    hyprlock
    tuigreet
    playerctl

    # advcpmv need alternative
    vim
    eza
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
    nix-output-monitor
    vlc
    ghostty
    nmgui
    hyprpolkitagent
    # xwayland-satellite
        
    # nvd #nix pkg diff
    # zenity # gui dialog boxes
    
  ];

  programs = {

    zsh.enable = true;
    dconf.enable = true;
    nix-ld.enable = true;
    gdk-pixbuf.modulePackages = [ pkgs.librsvg ]; #svg icons fix?

    nh = {
      enable = true;
      flake = "/home/${vars.username}/nix-config"; 
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d --keep 5";
      };
    };     
  }; 
}


