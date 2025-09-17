{ pkgs, config, inputs, user, lib, ... }:

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
    # swaynotificationcenter

    # utils
    # advcpmv need alternative
    eza # is this implemented?
    nmap
    rofi
    unzip
    blueman
    tuigreet # ??????
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

    #Coding Stuff
    python312
    gcc
    cmake
    nix-prefetch-git
    nix-output-monitor

  ];

  programs = {

    regreet = {
      enable = true;
      settings = {
        appearance.greeting_msg = "Welcome to PatOS";
        env.SESSION_DIRS = "${config.services.displayManager.sessionData.desktops}/share/wayland-sessions"; #"/home/cjlester/.wayland-sessions";
      };
    };

    firefox.enable = true;
    zsh.enable = true;
    # dconf.enable = true;
    nix-ld.enable = true;

    yazi = {
      enable = true;
      settings.yazi.opener.text = [
        {
          run = "'micro \"$@\"'";
          block = true;
        }
      ];
    };

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


