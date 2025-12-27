{ pkgs, vars, ... }:

{
  environment.systemPackages = with pkgs; [
  
    shaderbg
    libnotify
    # caligula
    galculator  
    dysk
    hyprlock
    tuigreet
    playerctl

    # utils
    # advcpmv need alternative
    vim
    eza
    nmap
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
        
    # nvd #nix pkg diff
    # zenity # gui dialog boxes

    #Coding Stuff
    lazygit
    platformio 
    (pkgs.python3.withPackages (ppkgs: [
      ppkgs.pyserial
    ]))
    # binutils
    # gcc
    # cmake
    # nix-prefetch-git    
    
    (writeShellScriptBin "findpi" ''
        
      LOCAL_IP=$(ip route get 1.1.1.1 | grep -oP 'src \K\S+')
      BASE_PREFIX=$(echo $LOCAL_IP | cut -d. -f1-2)
      THIRD_OCTET=$(echo $LOCAL_IP | cut -d. -f3)
      NMAP_OPTS="-n -p 22,41041 --open --max-retries 0 -T4" # --max-rtt-timeout 500ms,  maybe increase timeout?
      
      for i in 0 -1 1 -2 2 -3 3
      do
        SCAN_OCTET=$((THIRD_OCTET + i))
        if [ $SCAN_OCTET -lt 0 ] || [ $SCAN_OCTET -gt 254 ]; then
          continue
        fi
    
        TARGET_SUBNET="$BASE_PREFIX.$SCAN_OCTET.0/24"
        echo "Scanning in $TARGET_SUBNET"
    
        IP=$(sudo nmap $NMAP_OPTS $TARGET_SUBNET | awk '/Nmap scan report for/{ip=$NF} /Raspberry Pi/{print ip}')
    
        if [ -n "$PI_IP" ]; then
          echo "Pi found at $IP"
          break 
        fi
      done
    '')

  ];

  programs = {

    zsh.enable = true;
    dconf.enable = true;
    nix-ld.enable = true;
    gdk-pixbuf.modulePackages = [ pkgs.librsvg ]; #svg icons fix?
    # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d --keep 5";
      };
      flake = "/home/${vars.username}/nix-config"; 
    };     

    # nvf = {
    #   enable = false;
    #   settings.vim = {
    #     vimAlias = true;
    #     lsp = {
    #       enable = true;
    #     };
    #     # vim.theme.enable = true;
    #     # vim.theme.name = lib.mkForce "gruvbox";
    #     # vim.theme.style = "dark";

    #     languages = {
    #       enableTreesitter = true;
    #       lua.enable = true;
    #       python.enable = true;
    #       nix.enable = true;
    #     };

    #     statusline.lualine.enable = true;
    #     telescope.enable = true;
    #     autocomplete.nvim-cmp.enable = true;
    #     filetree.neo-tree.enable = true;
    #     minimap.minimap-vim.enable = true;
    #   };
    # };
  }; 

  nixpkgs.config.packageOverrides = pkgs: {
    idle-expo = pkgs.callPackage ./home/wayfire/idle-expo {};
  };

  # xdg.portal.enable = true;
  # xdg.portal.wlr.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}


