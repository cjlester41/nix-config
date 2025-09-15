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

    greetd = {
      enable = true;
      settings = {
        initial_session = {
          user = "${user}";
          command = "wayfire";
        };
        default_session = {
          user = "${user}";
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd wayfire"; 
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
