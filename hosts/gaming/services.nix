{ config, pkgs, inputs, lib, chaotic, nix-gaming, ... }:

{
  security.rtkit.enable = true;
  
  services = {

    # logind.extraConfig = ''
    #   IdleAction=suspend
    #   IdleActionSec=30s
    # '';

    # displayManager.ly = {
    #   enable = true;
    #   settings = {
    #     animation = "matrix";
    #     # colormix_col1 = "0x08FF0000";
    #     # colormix_col2 = "0x0800FF00";
    #     # colormix_col3 = "0x080000FF";
    #     fg = "0x00A9A9A9";
    #     cmatrix_fg = "0x00666666";
    #     bigclock = true;
    #     waylandsessions = "/home/cjlester/.wayland-sessions";
    #     xinitrc = "";
    #   };
    # };

    printing.enable = false;
    blueman.enable = false;
    udisks2.enable = true;
    gvfs.enable = true;

    # seatd.group = "seat"; ####################
    # getty.autologinUser = "cjlester";
      
    # ssh-agent.enable = true;
  
    ananicy.enable = true;
    ananicy.package = pkgs.ananicy-cpp;
    ananicy.rulesProvider = pkgs.ananicy-rules-cachyos;

    greetd = {
      enable = true;
      # vt = 3;
      settings = {
        default_session = {
          user = "cjlester";
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd wayfire"; 
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
      # alsa.support32Bit = true;
      pulse.enable = true;
    #   extraConfig.pipewire."92-low-latency" = {
    #   "context.properties" = {
    #   "default.clock.rate" = 48000;
    #   "default.clock.quantum" = 32;
    #   "default.clock.min-quantum" = 32;
    #   "default.clock.max-quantum" = 128;
    #   };
    # };

    # wireplumber.configPackages = [
    #   (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/usb-audio.conf" ''
    #     monitor.alsa.rules = [
    #       {
    #         matches = [
    #           {
    #             device.name = "~alsa_card.usb-Burr-Brown_from_TI_USB_Audio_CODEC.*"
    #           }
    #         ]
    #         actions = {
    #           update-props = {
    #             api.alsa.use-acp = true
    #           }
    #         }
    #       }
    #       {
    #         matches = [
    #           {
    #             node.name = "~alsa_output.usb-Burr-Brown_from_TI_USB_Audio_CODEC.*"
    #           }
    #           {
    #             node.name = "~alsa_input.usb-Burr-Brown_from_TI_USB_Audio_CODEC.*"
    #           }
    #         ]
    #         actions = {
    #           update-props = {
    #             session.suspend-timeout-seconds = 0
    #           }
    #         }
    #       }
    #     ]
    #   '')
    #   ];  
    };
  };
}
