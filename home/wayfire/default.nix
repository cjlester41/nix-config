{ config, pkgs, vars, ... }:

{  
  stylix.targets = {
    wayfire.enable = false;
  };  

  imports = [
    ./config.nix
    ./binds.nix
    ./decoration.nix
    ./wf-shell.nix
  ];
  
  nixpkgs.config.packageOverrides = pkgs: {
    idle-expo = pkgs.callPackage ./idle-expo {};
  };

  # home.file."wayfire.ini" = {
  #   source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/wayfire.ini";
  #   force = true;
  # };

  wayland.windowManager.wayfire = {
    
    enable = true;
    plugins = with pkgs; [
      wayfirePlugins.wayfire-plugins-extra  
      wayfirePlugins.wf-shell
      wayfirePlugins.wcm
      idle-expo
      # auto-tile
    ];      

    settings.autostart = {
        
      lock = "hyprlock";
      shader = vars.background;
      startup = "python ~/nix-config/home/wayfire/pywayfire/startup.py ${vars.alpha} ${vars.grid} ${vars.editor} ${vars.borders} > pyout.txt 2>&1";
      polkit = "systemctl --user start hyprpolkitagent";
      autostart_wf_shell = false;
      portal = "/usr/libexec/xdg-desktop-portal";
      # systemdActivation = "/nix/store/wm9npw769j5z8zfap6bgfka0rhd6y85c-dbus-1.14.10/bin/dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP NIXOS_OZONE_WL XCURSOR_THEME XCURSOR_SIZE && systemctl --user stop wayfire-session.target && systemctl --user start wayfire-session.target";
      
    }; 
  };  
}
