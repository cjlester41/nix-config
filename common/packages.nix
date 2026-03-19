{ inputs, pkgs, vars, ... }:

{
  
  environment.systemPackages = with pkgs; [
  
    bat blueman dysk eza file-roller fzf  hyprpolkitagent libnotify 
     nix-output-monitor  ntfs3g pciutils pavucontrol playerctl  
    tuigreet udiskie usbutils wget  wlr-randr  zathura zoxide      # starship
    
    neovim
    # ((vim-full.override { }).customize{
    #   name = "vim";
    #   vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
    #     start = [ vim-nix vim-lastplace ]; # Plugins to load
    #   };
    #   vimrcConfig.customRC = ''
    #     set nocompatible
    #     syntax on
    #     " Add custom settings here
    #   '';
    # })
    
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


