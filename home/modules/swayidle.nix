{ config, pkgs, ... }:

{
    services.swayidle =
    let
    # Lock command
    lock = "${pkgs.hyprlock}/bin/hyprlock";
    # TODO: modify "display" function based on your window manager
    # Sway
    display = status: "swaymsg 'output * power ${status}'"; 
    # Hyprland
    # display = status: "hyprctl dispatch dpms ${status}";
    # Niri
    # display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
    in
    {
    enable = true;
    timeouts = [
        {
        timeout = 2500; # in seconds
        command = "${pkgs.libnotify}/bin/notify-send 'Sleeping in 10 seconds' -t 10000";
        }
        # {
        #   timeout = 20;
        #   command = lock;
        # }
        # {
        #   timeout = 25;
        #   command = display "off";
        #   resumeCommand = display "on";
        # }
        {
        timeout = 2510;
        command = "${pkgs.systemd}/bin/systemctl suspend";
        }
    ];
    events = [
        {
        event = "before-sleep";
        # adding duplicated entries for the same event may not work
        command = lock; #(display "off") + "; " + lock;
        }
    #     {
    #       event = "after-resume";
    #       command = display "on";
    #     }
    #     {
    #       event = "lock";
    #       command = (display "off") + "; " + lock;
    #     }
    #     {
    #       event = "unlock";
    #       command = display "on";
    #     }
    ];
    };
}