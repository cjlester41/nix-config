{ config, pkgs, inputs, lib, chaotic, nix-gaming, user, ... }:

{

  services = {
    # displayManager.ly = {
    # enable = true;
    #   settings = {
    #     animation = "colormix";
    #     colormix_col1 = "0x00010101";
    #     colormix_col2 = "0x00050505";
    #     colormix_col3 = "0x00090909";
    #     bigclock = "en";
    #     waylandsessions = "/home/${user}/.wayland-sessions";
    #     xinitrc = "";
    #   };
    # };

    printing.enable = false;
    blueman.enable = true;
  
    ananicy.enable = true;
    ananicy.package = pkgs.ananicy-cpp;
    ananicy.rulesProvider = pkgs.ananicy-rules-cachyos;

    greetd = {
      enable = true;
      # vt = 3;
      settings = {
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
