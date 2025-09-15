{ config, pkgs, inputs, lib, chaotic, nix-gaming, ... }:

{

  services = {

    logind = {
      # enable = true;
      lidSwitch = "sleep";
    }; 

    printing.enable = false;
    # blueman.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
  
    ananicy.enable = true;
    ananicy.package = pkgs.ananicy-cpp;
    ananicy.rulesProvider = pkgs.ananicy-rules-cachyos;

    greetd = {
      enable = true;
      vt = 3;
      settings = {
        default_session = {
          user = "${user}";
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd wayfire"; 
        };
      };
    };    

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      extraConfig.pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 32;
          "default.clock.min-quantum" = 32;
          "default.clock.max-quantum" = 128;
        };
      };
    };   
  };
}
