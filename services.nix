{ config, pkgs, inputs, lib, chaotic, nix-gaming, user, ... }:

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
      wayfiredefault = let
        cfg = "~/.config/wayfire";
      in
      (pkgs.writeTextDir "share/wayland-sessions/wayfire.desktop" ''
        [Desktop Entry]
        Name=Wayfire Desktop
        Exec=ln -sf ${cfg}.ini ${cfg} & wayfire -c ${cfg}
        Type=Application
      '').overrideAttrs
        (_: {
          passthru.providedSessions = [ "wayfire" ];
        });
      in [ wayfiredefault ];
    
    greetd = { 
      enable = true;
      settings = let
        cmd = "./nix-config/home/wayfire/shell/initsession.sh"; in {
        initial_session = {
          user = "${user}";
          command = "${cmd}";
        };
        default_session = {
          user = "${user}";
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${cmd}";          
        };
      };
    };    

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };   
  };
}
