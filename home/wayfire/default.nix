{ pkgs, ... }:

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
      python = "python ~/nix-config/home/wayfire/pywayfire/ipc-rules.py";
      shaderbg = "shaderbg -l 0 HDMI-A-1 ~/nix-config/files/shaders/sunset.glsl";
      code = "code";
      # btop = "sleep 1.5 && btop";
      kitty = "sleep 2 && kitty";
      nemo = "sleep 1.5 && nemo";
      firefox = "sleep 2.5 && firefox";
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
