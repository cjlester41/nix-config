{ pkgs, private, wayggle-bg, ... }:

let background = 
  if private.hardware == "sS7" then
    "swaybg -i ~/Downloads/Balcony-ja.png"
  else if private.hardware == "AOC" then
    "shaderbg -l 0 HDMI-A-1 ~/nix-config/files/shaders/roswirl.glsl"
  else
    "${wayggle-bg}/bin/wayggle-bg default --name box"; 
    # "nix run github:cjlester41/wayggle-bg -- default --name box"; 
in

{  
  stylix.targets = {
    wayfire.enable = false;
  };  

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
      hyprlock = "sleep 1 && hyprlock && python ~/nix-config/home/wayfire/pywayfire/hyprtest.py";
      # firefox = "sleep .5 && firefox";
      # code = "sleep .5 && code";
      # kitty = "sleep .5 && kitty";
      # nemo = "sleep .5 && nemo";
      # btop = "sleep .5 && kitty -e btop";
      # blueman = "blueman-applet";
      dock = "sleep .5 && wf-dock";
      waybar = "sleep .5 &&  && waybar";
      # steam = "sleep 10 && steam -silent %U";
      autostart_wf_shell = false;
      portal = "/usr/libexec/xdg-desktop-portal";
      # systemdActivation = "/nix/store/wm9npw769j5z8zfap6bgfka0rhd6y85c-dbus-1.14.10/bin/dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP NIXOS_OZONE_WL XCURSOR_THEME XCURSOR_SIZE && systemctl --user stop wayfire-session.target && systemctl --user start wayfire-session.target";
      
    }; 

    wf-shell = {
      
      enable = true;
      settings.dock = {

        autohide_duration = 350;
        css_path = "/home/${private.username}/nix-config/files/wf-dock.css";
        dock_height = 64;
        icon_height = 48;
        autohide = true;
        position = "bottom";
        edge_offset = 0;

      };
    };
  };  
}
