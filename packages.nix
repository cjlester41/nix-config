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
    # swaync

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
  };

  environment.sessionVariables = {
      KWIN_LOW_LATENCY = "1";
      KWIN_TRIPLE_BUFFER = "1";
      KWIN_COMPOSE = "O2";
      KDE_NO_PRELOADING = "0";
      BALOO_DISABLE = "1";
      MOZ_ENABLE_WAYLAND = "1";
      #XDG_CACHE_HOME = "/home/isolde/.cache";
      #NIXOS_OZONE_WL = "1";
  };
}
