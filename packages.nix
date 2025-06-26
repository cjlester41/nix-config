{ pkgs, config, inputs, neve, lib, ... }:
{

environment.systemPackages = with pkgs; [
  
    micro
    mpvpaper
    greetd.tuigreet
    eza
    nmap
    spotify-player
    gnome-calculator
    btop
    wget
    mpv
    pavucontrol
    zenity
    wlogout
    nvd
    lolcat
    cmatrix
    zoxide
    rofi
    unzip
    blueman
    gparted
    # swaync
    glpaper
    wlr-randr
    minicom
    usbutils

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
