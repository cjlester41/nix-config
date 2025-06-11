{ config, pkgs, inputs, lib, chaotic, nix-gaming, ... }:

{

security.rtkit.enable = true;
  services = {
    # displayManager = {
    #   sddm.enable = true;
    #   sddm.theme = "catppuccin-mocha";
    #   #sddm.package = lib.mkForce pkgs.kdePackages.sddm;
    #   #sddm.extraPackages = [pkgs.sddm-astronaut];
    #   sddm.wayland.enable = true;
    #   defaultSession = "plasma";
    # };
    printing.enable = false;
    blueman.enable = false;

    # xserver.videoDrivers = [ "nvidia" ];

    # ssh-agent.enable = true;
  
    ananicy.enable = true;
    ananicy.package = pkgs.ananicy-cpp;
    ananicy.rulesProvider = pkgs.ananicy-rules-cachyos;

    greetd = {
      enable = true;
      vt = 3;
      settings = {
        default_session = {
          user = "cjlester";
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd wayfire"; 
        };
      };
    };

    # gnome = {
    #   tinysparql.enable = true;
    #   gnome-keyring.enable = true;
    # };

    # dbus.packages = with pkgs; [
    #   gcr
    #   gnome-settings-daemon
    # ];

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

    wireplumber.configPackages = [
      (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/usb-audio.conf" ''
        monitor.alsa.rules = [
          {
            matches = [
              {
                device.name = "~alsa_card.usb-Burr-Brown_from_TI_USB_Audio_CODEC.*"
              }
            ]
            actions = {
              update-props = {
                api.alsa.use-acp = true
              }
            }
          }
          {
            matches = [
              {
                node.name = "~alsa_output.usb-Burr-Brown_from_TI_USB_Audio_CODEC.*"
              }
              {
                node.name = "~alsa_input.usb-Burr-Brown_from_TI_USB_Audio_CODEC.*"
              }
            ]
            actions = {
              update-props = {
                session.suspend-timeout-seconds = 0
              }
            }
          }
        ]
      '')
      ];  
    };
  };
}
