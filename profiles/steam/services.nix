{ config, pkgs, inputs, lib, chaotic, nix-gaming,  ... }:

{
  services = {

    printing.enable = false;
    blueman.enable = true;

    udisks2.enable = true;
    gvfs.enable = true;
  
    ananicy.enable = true;
    ananicy.package = pkgs.ananicy-cpp;
    ananicy.rulesProvider = pkgs.ananicy-rules-cachyos;
    
    # greetd = { 
    #   enable = true;
    #   settings = let
    #     cmd = "gamescope --hdr-enabled --rt --steam -- steam -pipewire-dmabuf -tenfoot"; in {
    #     initial_session = {
    #       user = "${private.username}";
    #       command = "${cmd}";
    #     };
    #     default_session = {
    #       user = "${private.username}";
    #       command = "${pkgs.tuigreet}/bin/tuigreet --cmd ${cmd}";          
    #     };
    #   };
    # };    

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };   
  };
}
