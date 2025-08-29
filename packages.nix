{ pkgs, config, inputs, neve, lib, ... }:
{

environment.systemPackages = with pkgs; [
  
    micro 
    caligula
    spotify-player
    gnome-calculator
    btop    
    mpv   
    # swaynotificationcenter

    # utils
    eza
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
    zenity
    wlogout
    nvd
    wget
    zoxide

    #Coding Stuff
    python312
    gcc
    cmake
    nix-prefetch-git
    nix-output-monitor

  ];

  programs = {

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
      flake = "/home/cjlester/nix-config"; #${username}/nix-minimal";
    };     
  };  
}
