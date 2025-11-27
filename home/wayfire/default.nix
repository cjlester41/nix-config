{ lib, config, pkgs, private, ... }:

let background = 
  if private.hardware == "sS7" then
    "wf-background"
  else
    "restart-bg";
in

{  
  stylix.targets = {
    wayfire.enable = false;
  };  

  imports = [
    ./config.nix
    ./binds.nix
    ./decoration.nix
  ];

  wayland.windowManager.wayfire = {
    
    enable = true;
    plugins = with pkgs; [
      wayfirePlugins.wayfire-plugins-extra  
      wayfirePlugins.wf-shell
      idle-expo
    ];      

    settings.autostart = {
        
      lock = "hyprlock";
      shader = background;
      startup = "python ~/nix-config/home/wayfire/pywayfire/startup.py";
      polkit = "systemctl --user start hyprpolkitagent";
      autostart_wf_shell = false;
      portal = "/usr/libexec/xdg-desktop-portal";
      # systemdActivation = "/nix/store/wm9npw769j5z8zfap6bgfka0rhd6y85c-dbus-1.14.10/bin/dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP NIXOS_OZONE_WL XCURSOR_THEME XCURSOR_SIZE && systemctl --user stop wayfire-session.target && systemctl --user start wayfire-session.target";
      
    }; 

    wf-shell = {
      
      enable = true;
      settings.dock = {

        autohide_duration = 0;
        css_path = "/home/${private.username}/nix-config/files/wf-dock.css";
        dock_height = 44;
        icon_height = 38;
        autohide = true;
        position = "bottom";
        edge_offset = 0;

        icon_mapping_Code = "/run/current-system/sw/share/icons/candy-icons/apps/scalable/vscode.svg";
        icon_mapping_foot = "/run/current-system/sw/share/icons/candy-icons/apps/scalable/btop.svg";
        icon_mapping_nemo = "/run/current-system/sw/share/icons/Sweet-Rainbow/Places/48/folder.svg";
      };

      settings.background = {

        image = "/home/${private.username}/nix-config/files/black.jpg";
        fill_mode = "stretch";
      
      };

      settings.panel = {
        
        widgets_left = "menu spacing4 launchers window-list";
        widgets_center = "none";
        widgets_right = "command-output tray notifications volume network battery clock";
        minimal_height = 24;
        autohide = false;
        autohide_duration = 300;
        layer = "top";
        position = "top";
        background_color = "gtk_headerbar";
        launcher_firefox = "firefox.desktop";
        launcher_terminal1 = "kitty.desktop";
        launchers_spacing = 4;
        launchers_size = 42;
        clock_format = "%e %a %H:%M";
        clock_font = "DejaVu Sans:style=Book 12";
        battery_status = 1;
        battery_icon_size = 32;
        battery_icon_invert = 1;
        battery_font = "default";
        network_status = 1;
        network_status_font = "DejaVu Sans:style=Book 10";
        network_icon_invert_color = 1;
        network_status_use_color = true;
        menu_show_categories = false;
        menu_list = false;
        menu_fuzzy_search = 1;
        menu_min_category_width = 200;
        menu_min_content_width = 500;
        menu_min_content_height = 500;
        menu_logout_command = "wayland-logout";
        volume_display_timeout = 2.5;
        tray_smooth_scrolling_threshold = 5;
        tray_icon_size = 32;
        tray_menu_on_middle_click = false;
        notifications_autohide_timeout = 2.5;
        notifications_critical_in_dnd = true;
        notifications_icon_size = 32;
        commands_output_max_chars = 10;
      };
    };
  };  
}
