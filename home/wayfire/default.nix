{ pkgs, private, ... }:

let background = 
  if private.hardware == "sS7" then
    "swaybg -i ~/Downloads/Balcony-ja.png"
  else if private.hardware == "AOC" then
    "shaderbg -l 0 HDMI-A-1 ~/nix-config/files/shaders/roswirl.glsl"
  else
    "shaderbg -l 0 HDMI-A-1 ~/nix-config/files/shaders/sunset.glsl";    
in

{  
  stylix.targets = {
    wayfire.enable = false;
  };

  wayland.windowManager.wayfire = {
    enable = true;
    plugins = with pkgs.wayfirePlugins; [
      wayfire-plugins-extra   
      filters
    ];
  };   

  wayland.windowManager.wayfire.settings = {
    
    autostart = {
      
      shaderbg = background;
      hyprlock = "sleep .2 && hyprlock && python ~/nix-config/home/wayfire/pywayfire/ipc-rules.py";
      blueman = "blueman-applet";
      waybar = "waybar";
      autostart_wf_shell = false;
      portal = "/usr/libexec/xdg-desktop-portal";
      # systemdActivation = "/nix/store/wm9npw769j5z8zfap6bgfka0rhd6y85c-dbus-1.14.10/bin/dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP NIXOS_OZONE_WL XCURSOR_THEME XCURSOR_SIZE && systemctl --user stop wayfire-session.target && systemctl --user start wayfire-session.target";
    };
  }; 

  imports = [
    ./config.nix
    ./binds.nix
    ./decoration.nix
  ];
}
