{ inputs, pkgs, vars, ... }:

{
  
  environment.systemPackages = with pkgs; [
  
    bat blueman candy-icons dysk eza feh file-roller fzf gparted hyprlock hyprpolkitagent libnotify 
    mpv nautilus nix-output-monitor nmgui ntfs3g pciutils pavucontrol playerctl shaderbg sweet-folders 
    tuigreet udiskie usbutils vim wget wlogout wlr-randr xwayland-satellite zathura zoxide      # starship
    
    inputs.shader-desk.packages.${pkgs.system}.default 
   
    # advcpmv need alternative
    # zoxide # cd tool. implemented? 
    # nvd #nix pkg diff
    # zenity # gui dialog boxes
  ];

  programs = {

    dconf.enable = true;
    nix-ld.enable = true;
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


