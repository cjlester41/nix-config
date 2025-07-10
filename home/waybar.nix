{
  pkgs,
  lib,
  host,
  config,
  ...
}: let
#   inherit (import ../../../hosts/${host}/variables.nix) clock24h;
in
  with lib; {
    # Configure & Theme Waybar
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
      settings = [
        {
          layer = "top";
          position = "bottom";
          # modules-center = ["hyprland/workspaces"];
          modules-left = [
            "custom/startmenu"
            "custom/arrow6"
            "custom/exit"
            "pulseaudio"
            "custom/arrow8"
            "cpu"
            "memory"
            "idle_inhibitor"
            "custom/arrow7"
            # "hyprland/window"
          ];
          modules-right = [
            "custom/arrow4"
            "custom/hyprbindings"
            # "custom/arrow3"
            "custom/notification"
            # "custom/arrow3"
            # "custom/exit"
            # "battery"
            "custom/arrow2"            
            "network"
            "tray"
            "custom/arrow1"
            "clock"
          ];

          #"hyprland/workspaces" = {
          #  format = "{name}";
          #  format-icons = {
          #    default = " ";
          #    active = " ";
          #    urgent = " ";
          #  };
          #  on-scroll-up = "hyprctl dispatch workspace e+1";
          #  on-scroll-down = "hyprctl dispatch workspace e-1";
          #};
          "clock" = {
            format = ''  {:L%H:%M}'';
            #   if clock24h == true
            #   then '' {:L%H:%M}''
            #   else '' {:L%I:%M %p}'';
            tooltip = true;
            tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
          };
          # "wayfire/window" = {
          #   max-length = 42;
          #   separate-outputs = false;
          #   rewrite = {
          #     "" = " 🙈 No Windows? ";
          #   };
          # };
          "memory" = {
            interval = 5;
            format = " {}%";
            tooltip = true;
          };
          "cpu" = {
            interval = 5;
            format = " {usage:2}%";
            tooltip = true;
          };
          "disk" = {
            format = " {free}";
            tooltip = true;
          };
          "network" = {
            format-icons = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            format-ethernet = " {bandwidthDownOctets}";
            format-wifi = "{icon} "; #{signalStrength}%";
            format-disconnected = "󰤮";
            tooltip = false;
          };
          # "bluetooth" = {
          #   on-click = "blueman &";#"~/.config/waybar/scripts/rofi-bluetooth &";
          #   format = " {status}";
          # }; 
          "tray" = {
            spacing = 12;
          };
          "pulseaudio" = {
            format = "{icon}   {volume}% ";
            format-bluetooth = "{volume}%   {icon} ";
            format-bluetooth-muted = "   {icon} ";
            format-muted = " ";
            # format-source = " {volume}%";
            # format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
                ""
              ];
            };
            on-click = "sleep 0.1 && pavucontrol";
          };
          "custom/exit" = {
            tooltip = false;
            format = "";
            on-click = "sleep 0.1 && wlogout";
          };
          "custom/startmenu" = {
            tooltip = false;
            format = "  ";
            on-click = "sleep 0.1 && rofi -show drun";
          };
          "custom/hyprbindings" = {
            tooltip = false;
            format = " 󱕴 ";
            on-click = "sleep 0.1 && list-keybinds";
          };
          "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";
            };
            tooltip = "true";
          };
          "custom/notification" = {
            tooltip = false;
            format = "{icon} {}";
            format-icons = {
              notification = "<span foreground='red'><sup></sup></span>";
              none = "";
              dnd-notification = "<span foreground='red'><sup></sup></span>";
              dnd-none = "";
              inhibited-notification = "<span foreground='red'><sup></sup></span>";
              inhibited-none = "";
              dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
              dnd-inhibited-none = "";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "sleep 0.1 && task-waybar";
            escape = true;
          };
          
          "custom/arrow1" = {
            format = "";
          };
          "custom/arrow2" = {
            format = "";
          };
          "custom/arrow3" = {
            format = "";
          };
          "custom/arrow4" = {
            format = "";
          };
          "custom/arrow5" = {
            format = "";
          };
          "custom/arrow6" = {
            format = "";
          };
          "custom/arrow7" = {
            format = "";
          };
          "custom/arrow8" = {
            format = "";
          };
        }
      ];
      style = concatStrings [ # JetBrainsMono Nerd Font Mono;
        ''
          * {
            font-family: JetBrains Mono; 
            font-size: 11px; 
            border-radius: 0px;
            border: none;
            min-height: 0px;
            opacity: 1.0;
          }
          window#waybar {
            background: #${config.lib.stylix.colors.base00};
            color: #${config.lib.stylix.colors.base05};
          }
          #workspaces button {
            padding: 0px 5px;
            background: transparent;
            color: #${config.lib.stylix.colors.base04};
          }
          #workspaces button.active {
            color: #${config.lib.stylix.colors.base0A};
          }
          #workspaces button:hover {
            color: #${config.lib.stylix.colors.base0A};
          }
          tooltip {
            background: #${config.lib.stylix.colors.base00};
            border: 1px solid #${config.lib.stylix.colors.base05};
            border-radius: 12px;
          }
          tooltip label {
            color: #${config.lib.stylix.colors.base05};
          }
          #window {
            padding: 0px 10px;
          }
          #pulseaudio {
            padding: 0px 10px;
            background: #${config.lib.stylix.colors.base0D};
            color: #${config.lib.stylix.colors.base00};
          }
          #cpu, #memory, #idle_inhibitor {
            padding: 0px 10px;
            background: #${config.lib.stylix.colors.base0B};
            color: #${config.lib.stylix.colors.base00};
          }
          #custom-startmenu {
            color: #${config.lib.stylix.colors.base00};
            padding: 0px 0px;
            font-size: 14px;
            background: #${config.lib.stylix.colors.base04};
          }
          #custom-hyprbindings {
            color: #${config.lib.stylix.colors.base00};
            background: #${config.lib.stylix.colors.base0A};
          }
          #network, #battery {
            color: #${config.lib.stylix.colors.base00};
            background: #${config.lib.stylix.colors.base02};
          }
          #custom-notification {
            background: #${config.lib.stylix.colors.base0A};
            color: #${config.lib.stylix.colors.base00};
            padding: 0px 10px;
          }
          #custom-exit {
            background: #${config.lib.stylix.colors.base0D};
            color: #${config.lib.stylix.colors.base00};
            padding: 0px 10px;
          }
          #tray {
            background: #${config.lib.stylix.colors.base02};
            color: #${config.lib.stylix.colors.base00};
            padding: 0px 10px;
          }
          #clock {
            font-weight: bold;
            padding: 0px 10px;
            color: #${config.lib.stylix.colors.base00};
            background: #${config.lib.stylix.colors.base04};
          }
          #custom-arrow1 {
            font-size: 20px;
            color: #${config.lib.stylix.colors.base04};
            background: #${config.lib.stylix.colors.base02};
          }
          #custom-arrow2 {
            font-size: 20px;
            color: #${config.lib.stylix.colors.base02};
            background: #${config.lib.stylix.colors.base0A};
          }
          #custom-arrow3 {
            font-size: 20px;
            color: #${config.lib.stylix.colors.base00};
            background: #${config.lib.stylix.colors.base0A};
          }
          #custom-arrow4 {
            font-size: 20px;
            color: #${config.lib.stylix.colors.base0A};
            background: transparent;
          }
          #custom-arrow6 {
            font-size: 20px;
            color: #${config.lib.stylix.colors.base04};
            background: #${config.lib.stylix.colors.base0D};
          }
          #custom-arrow7 {
            font-size: 20px;
            color: #${config.lib.stylix.colors.base0B};
            background: transparent;
          }
          #custom-arrow8 {
            font-size: 20px;
            color: #${config.lib.stylix.colors.base0D};
            background: #${config.lib.stylix.colors.base0B};
          }
        ''
      ];
    };
  }