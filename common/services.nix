{ config, pkgs, vars, ... }:

{
  services = {

    xserver.enable = true;
    printing.enable = false;
    blueman.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
  
    displayManager.sessionPackages = let 
      wayfire = #ln -sf ${cfg}.ini ${cfg} & wayfire -c ${cfg}
      (pkgs.writeTextDir "share/wayland-sessions/wayfire.desktop" ''
        [Desktop Entry]
        Name=Wayfire
        Exec=wayfire 
        Type=Application
      '').overrideAttrs
        (_: {
          passthru.providedSessions = [ "wayfire" ];
        });

      niri = #-h 1080 -w 1920 -r 60
      (pkgs.writeTextDir "share/wayland-sessions/niri.desktop" ''
        [Desktop Entry]
        Name=Niri
        Exec=niri-session
        Type=Application
      '').overrideAttrs
        (_: {
          passthru.providedSessions = [ "niri" ];
        });
      in [ wayfire niri ];
    
    greetd = { 
      enable = true;
      useTextGreeter = true;
      settings = let 
      # ini = if vars.compositor == "niri" then "niri --config ~/nix-config/home/modules/config.kdl" else "wayfire"; 
      cmd = if vars.compositor == "niri" then "niri-session" else "dbus-run-session wayfire"; 
      ses = "${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
        in { # --config ~/nix-config/files/wayfire.ini"; in {#ln -sf ${cfg}.ini ${cfg} & sleep 2 & wayfire"; in {# -c ${cfg}"; in {
        initial_session = {
          user = "${vars.username}";
          command = "${cmd}";
        };
        default_session = {
          user = "greeter";
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-user-session --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";        };
      };
    };  

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };   
    
    dbus.enable = true; # Often needed for portals to work
  };
}
