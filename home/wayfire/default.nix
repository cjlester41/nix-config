{ pkgs, hostnm, ... }:
let background = 
  if hostnm == "NixOS-S7" then
    "swaybg -i ~/Downloads/Balcony-ja.png"
  else
  if hostnm == "NixOS-AOC" then
    "shaderbg -l 0 HDMI-A-1 ~/nix-config/files/shaders/smoke.glsl"
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
    ];
  };   

  wayland.windowManager.wayfire.settings = {
    
    autostart = {
      
      shaderbg = background; #"shaderbg -l 0 HDMI-A-1 ~/nix-config/files/shaders/sunset.glsl";
      python = "sleep .1 && hyprlock && ~/nix-config/home/wayfire/pywayfire/dist/ipc-rules"; #"python ~/nix-config/home/wayfire/pywayfire/ipc-rules.py";
      code = "sleep .2 && code";
      # btop = "sleep 1.5 && btop";
      # kitty = "sleep 2 && kitty";
      # nemo = "sleep 1.5 && nemo";
      # firefox = "sleep 2.5 && firefox";
      autostart3 = "blueman-applet";
      autostart4 = "waybar";
      autostart_wf_shell = false;
      portal = "/usr/libexec/xdg-desktop-portal";
      systemdActivation = "/nix/store/wm9npw769j5z8zfap6bgfka0rhd6y85c-dbus-1.14.10/bin/dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP NIXOS_OZONE_WL XCURSOR_THEME XCURSOR_SIZE && systemctl --user stop wayfire-session.target && systemctl --user start wayfire-session.target";
    };
  }; 

  imports = [
    ./wayfire.nix
    ./binds.nix
    ./decoration.nix
  ];
}
