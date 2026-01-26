{ config, pkgs, vars, ... }:

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
    fzf
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
    xwayland-satellite
    nautilus
    # starship
    # niri
        
    # nvd #nix pkg diff
    # zenity # gui dialog boxes
    
  ];

  programs = {

    niri.enable = true;
    git = {
      enable = true;
      config = {
        user.name = vars.git-name;
        user.email = vars.git-mail;
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    starship.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      # dotDir = "${config.users.users.${vars.username}.home}/zsh";
      # promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      # system.userActivationScripts.zshrc = "touch .zshrc";
      shellInit = ''
        zsh-newuser-install() { :; }
        fastfetch
        dysk
      ''; # zsh-newuser-install() { :; }
      shellAliases = {
        fr = "nh os switch /home/${vars.username}/nix-config";
        fu = "nh os switch /home/${vars.username}/nix-config --update";
      };
    };
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


