{ config, pkgs, inputs, lib, chaotic, nix-gaming, private, ... }:

let
  cfg = "~/.config/wayfire";
in
{
  services = {

    # xserver.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];

    printing.enable = false;
    blueman.enable = true;

    udisks2.enable = true;
    gvfs.enable = true;
  
    ananicy.enable = true;
    ananicy.package = pkgs.ananicy-cpp;
    ananicy.rulesProvider = pkgs.ananicy-rules-cachyos;
     
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

      steam = #-h 1080 -w 1920 -r 60
      (pkgs.writeTextDir "share/wayland-sessions/steam.desktop" ''
        [Desktop Entry]
        Name=Steam
        Exec=gamescope --adaptive-sync --hdr-enabled --mangoapp --rt --steam -- steam -pipewire-dmabuf -tenfoot
        Type=Application
      '').overrideAttrs
        (_: {
          passthru.providedSessions = [ "steam" ];
        });
      in [ wayfire steam ];
    
    greetd = { 
      enable = true;
      useTextGreeter = true;
      settings = let
        cmd = "wayfire"; in { # --config ~/nix-config/files/wayfire.ini"; in {#ln -sf ${cfg}.ini ${cfg} & sleep 2 & wayfire"; in {# -c ${cfg}"; in {
        initial_session = {
          user = "${private.username}";
          command = "${private.isession}";
        };
        default_session = {
          user = "greeter"; #"${private.username}";
          command = "${pkgs.tuigreet}/bin/tuigreet --remember -c ${cmd}"; ########         
        };
      };
    };  

    # logind.settings.Login = {
    #   IdleAction = "sleep";
    #   IdleActionSec = 10;
    # };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };   
  };
}
