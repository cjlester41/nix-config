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

    # displayManager.sessionPackages = let
    #   SteamFS = pkgs.writeShellScriptBin "SteamFS" ''
    #     ${pkgs.wayfire}/bin/wayfire 
    #   '';
    #   in
    #     [
    #       {
    #         manage = "window";
    #         name = "Wayfire";
    #         start = "${pkgs.wayfire}/bin/wayfire";
    #       }
    #     ];

    # services.greetd = let
    #   sway-igpu = pkgs.writeShellScriptBin "sway-igpu" ''
    #     export WLR_DRM_DEVICES=/dev/dri/card1:/dev/dri/card2 && exec ${pkgs.sway}/bin/sway
    #   '';
    # in {
    greetd = {
      enable = true;
      settings = {
        # initial_session = {
        #   user = "${user}";
        #   command = "sway --config ~/.config/sway/config";
        # };
        default_session = {
          user = "${user}";
          command = "wayfire --config ~/nix-config/files/wfregreet.ini"; #"${pkgs.tuigreet}/bin/tuigreet --time --cmd wayfire"; 
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
