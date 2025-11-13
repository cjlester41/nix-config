{ lib, config, pkgs, private, ... }:

let background = 
  if private.hardware == "sS7" then
    "swaybg -i ~/Downloads/Balcony-ja.png"
  else
    "start-shader";
in

{  
  stylix.targets = {
    wayfire.enable = false;
  };  
  
  # home.file.".config/wayfire_link" = {
  #   onChange = ''
  #     cat ~/.ssh/wayfire.ini > ~/.ssh/wayfire
  #     rm ~/.ssh/wayfire_link
  #     chmod 600 ~/.ssh/wayfire
  #   '';
  #   force = true;
  # }; 

  imports = [
    ./config.nix
    ./binds.nix
    ./decoration.nix
  ];

  wayland.windowManager.wayfire = {
    enable = true;
    plugins = with pkgs.wayfirePlugins; [
      wayfire-plugins-extra   
      filters
      wf-shell
    ];      
    settings.autostart = {
        
      shader = background;
      startup = "python ~/nix-config/home/wayfire/pywayfire/startup.py";
      # hyprlock = "sleep 6 && hyprlock && python ~/nix-config/home/wayfire/pywayfire/hyprtest.py";
      # firefox = "sleep .1 && firefox";
      # code = "sleep .2 && code";
      # kitty = "sleep .3 && kitty";
      # nemo = "sleep .4 && nemo";
      # btop = "sleep .5 && ghostty -e btop";
      # blueman = "blueman-applet";
      # dock = "wf-dock";
      # waybar = "sleep .5 &&  && waybar";
      # steam = "sleep 10 && steam -silent %U";
      polkit = "systemctl --user start hyprpolkitagent";
      autostart_wf_shell = false;
      portal = "/usr/libexec/xdg-desktop-portal";
      # systemdActivation = "/nix/store/wm9npw769j5z8zfap6bgfka0rhd6y85c-dbus-1.14.10/bin/dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP NIXOS_OZONE_WL XCURSOR_THEME XCURSOR_SIZE && systemctl --user stop wayfire-session.target && systemctl --user start wayfire-session.target";
      
    }; 

    wf-shell = {
      
      enable = true;
      settings.dock = {

        autohide_duration = 350;
        css_path = "/home/${private.username}/nix-config/files/wf-dock.css";
        dock_height = 44;
        icon_height = 38;
        autohide = true;
        position = "bottom";
        edge_offset = 0;

        icon_mapping_Code = "/run/current-system/sw/share/icons/candy-icons/apps/scalable/vscode.svg";
        icon_mapping_foot = "/run/current-system/sw/share/icons/candy-icons/apps/scalable/btop.svg";
        icon_mapping_nemo = "/run/current-system/sw/share/icons/Sweet-Rainbow/Places/48/folder.svg";
      };

      settings.background = {

        image = "/home/${private.username}/nix-config/files/";
        fill_mode = "stretch";
      
      };
    };
  };  
}
