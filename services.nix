{ config, pkgs, inputs, lib, chaotic, nix-gaming, user, ... }:

# let 
#   wayfiredefault =
#     (pkgs.writeTextDir "share/wayland-sessions/wayfire-default.desktop" ''
#       [Desktop Entry]
#       Name=Wayfire Desktop
#       Comment=A digital distribution platform
#       Exec=wayfire -c ~/.config/wayfire
#       Type=Application
#     '').overrideAttrs
#       (_: {
#         passthru.providedSessions = [ "wayfire-default" ];
#       });
# in
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
      wayfiredefault =
      (pkgs.writeTextDir "share/wayland-sessions/wayfire-default.desktop" ''
        [Desktop Entry]
        Name=Wayfire Desktop
        Exec=wayfire -c ~/.config/wayfire
        Type=Application
      '').overrideAttrs
        (_: {
          passthru.providedSessions = [ "wayfire-default" ];
        });
      in [ wayfiredefault ];
    
    greetd = { 
      enable = true;
      settings = {
        initial_session = {
          user = "${user}";
          command = "./nix-config/home/wayfire/shell/initsession.sh";
        };
        default_session = {
          user = "${user}";
          command = "./nix-config/home/wayfire/shell/regreet.sh";          
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
