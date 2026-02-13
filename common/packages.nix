{ pkgs, vars, ... }:

{
  environment.systemPackages = with pkgs; [
  
    blueman candy-icons dysk eza feh file-roller fzf gparted hyprlock hyprpolkitagent libnotify 
    mpv nautilus nix-output-monitor nmgui ntfs3g pavucontrol playerctl shaderbg sweet-folders 
    tuigreet udiskie usbutils vim wget wlogout wlr-randr xwayland-satellite zathura zoxide      # starship
   
    # advcpmv need alternative
    # zoxide # cd tool. implemented? 
    # nvd #nix pkg diff
    # zenity # gui dialog boxes
  ];

  programs = {

    # niri.enable = true;
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
    # starship.enable = true;
    zsh = {
      enable = true;
      ohMyZsh.enable = true;
      # enableCompletion = true;
      # autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      # dotDir = "${config.users.users.${vars.username}.home}/zsh";
      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      # system.userActivationScripts.zshrc = "touch .zshrc";
      shellInit = ''
        fastfetch
        dysk
      ''; # zsh-newuser-install() { :; }
      shellAliases = {
        fr = "nh os switch /home/${vars.username}/nix-config";
        fu = "nh os switch /home/${vars.username}/nix-config --update";
        ns = "nix-shell";
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


