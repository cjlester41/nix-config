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

    #Coding Stuff
    python312
    gcc
    cmake
    nix-prefetch-git
    nix-output-monitor

  ];

  programs = {

    # dconf.profiles.user.databases = [
    #   {
    #   settings."org/gnome/desktop/interface" = {
    #     gtk = {
    #       iconTheme = lib.mkForce {
    #         name = "Papirus-Dark";
    #         package = pkgs.catppuccin-papirus-folders;
    #       };
    #     };
    #   };
    #   }
    # ];

    regreet = {
      enable = true;
      settings = {
        appearance.greeting_msg = "Welcome to PatOS";
        env.SESSION_DIRS = "${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
      };
    };

    xfconf.enable = true;
    firefox.enable = true;
    zsh.enable = true;
    dconf.enable = true;
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


