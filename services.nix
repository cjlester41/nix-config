{ config, pkgs, inputs, lib, chaotic, nix-gaming, private, ... }:

let
  cfg = "~/.config/wayfire";
in
{
  services = {

    printing.enable = false;
    blueman.enable = true;

    udisks2.enable = true;
    gvfs.enable = true;
  
    ananicy.enable = true;
    ananicy.package = pkgs.ananicy-cpp;
    ananicy.rulesProvider = pkgs.ananicy-rules-cachyos;
     
    displayManager.sessionPackages = let
      wayfire = 
      (pkgs.writeTextDir "share/wayland-sessions/wayfire.desktop" ''
        [Desktop Entry]
        Name=Wayfire
        Exec=ln -sf ${cfg}.ini ${cfg} & wayfire -c ${cfg}
        Type=Application
      '').overrideAttrs
        (_: {
          passthru.providedSessions = [ "wayfire" ];
        });
      in [ wayfire ];
    
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
