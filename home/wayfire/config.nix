{ config, hostnm, lib, user, ... }:

let background = 
    if hostnm == "NixOS-S7" then
      "swaybg -i ~/Downloads/Balcony-ja.png"
    else
      "shaderbg -l 0 HDMI-A-1 ~/nix-config/files/planet.glsl";
      # "~/./glpaper/build/glpaper -F HDMI-A-1 ~/nix-config/files/test.glsl";  
    wfplugins = import ./plugins.nix;
in
{
  wayland.windowManager.wayfire.settings = {    

    alpha = {
      min_value = 0.85;
      modifier = "<alt> <super>";
    };

    annotate = {
      clear_workspace = "<alt> <super> KEY_C";
      draw = "<alt> <super> BTN_LEFT";
      from_center = true;
      line_width = 3.0;
      method = "draw";
      stroke_color = "#FF0000FF";
    };

    autorotate-iio = {
      lock_rotation = false;
      rotate_down = "<ctrl> <super> KEY_DOWN";
      rotate_left = "<ctrl> <super> KEY_LEFT";
      rotate_right = "<ctrl> <super> KEY_RIGHT";
      rotate_up = "<ctrl> <super> KEY_UP";
    };

    autostart = {
      autostart7 = "python ~/nix-config/home/wayfire/pywayfire/ipc-rules-demo.py";
      autostart6 = "hyprlock";
      autostart0 = background;       
      autostart1 = "kitty"; # --hold zsh -c \"fastfetch\"";
      # autostart2 = "firefox \"https://github.com/WayfireWM/wayfire\"";
      autostart3 = "blueman-applet";
      autostart4 = "waybar"; # "sleep 1 && python /home/${user}/GLWall/pin-view.py 5 \"background\" true";
      autostart5 = "code";      
      autostart_wf_shell = false;
      clipman-restore = "clipman restore";
      clipman-store = "wl-paste -t text --watch clipman store";
      dex = "dex -a -s /etc/xdg/autostart/:~/.config/autostart/";
      gammastep = "gammastep";
      gnome-keyring = "gnome-keyring-daemon --daemonize --start --components=gpg,pkcs11,secrets,ssh";
      # idle = "swayidle before-sleep swaylock";
      # libinput-gesture = "libinput-gestures-setup start";
      # nm = "nm-applet --indicator";
      # notifications = "mako";
      # outputs = "kanshi";
      polkit-gnome = "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1";
      portal = "/usr/libexec/xdg-desktop-portal";
      tracker = "tracker daemon -s";
    };

    # background-view = {
    #   command = "mpv --loop=inf";
    #   file = "";
    # };

    core = {
      # background_color = "#000000FF";
      close_top_view = "<super> KEY_Q | <alt> KEY_F4";
      exit = "<alt> <ctrl> KEY_BACKSPACE";
      focus_button_with_modifiers = false;
      focus_buttons = "BTN_LEFT | BTN_MIDDLE | BTN_RIGHT";
      focus_buttons_passthrough = true;
      max_render_time = -1;
      plugins = wfplugins.plugins; #"wm-actions idle alpha autostart command expo move place resize switcher vswitch window-rules wrot zoom wobbly follow-focus extra-animations animate wf-info filters shortcuts-inhibit ipc-rules cube ipc pin-view simple-tile";
      preferred_decoration_mode = "server";
      transaction_timeout = 100;
      vheight = 2;
      vwidth = 2;
      xwayland = true;
    };

    crosshair = {
      line_color = "#FF0000FF";
      line_width = 2;
    };

    cube = {
      activate = "<alt> <ctrl> BTN_LEFT";
      background = "#1A1A1AFF";
      background_mode = "cubemap";
      cubemap_image = "/home/${user}/nix-config/files/cubemap.png";
      deform = 0;
      initial_animation = "350ms circle";
      light = false;
      rotate_left = "<super> KEY_LEFT";
      rotate_right = "<super> KEY_RIGHT";
      skydome_mirror = false;
      skydome_texture = "";
      speed_spin_horiz = 0.03;
      speed_spin_vert = 0.03;
      speed_zoom = 0.07;
      zoom = 0.2;
    };    

    expo = {
      # background = "#1A1A1AFF";
      duration = "300ms circle";
      inactive_brightness = 0.75;
      keyboard_interaction = true;
      offset = 5;
      select_workspace_1 = "KEY_1";
      select_workspace_2 = "KEY_2";
      select_workspace_3 = "KEY_3";
      select_workspace_4 = "KEY_4";
      select_workspace_5 = "KEY_5";
      select_workspace_6 = "KEY_6";
      select_workspace_7 = "KEY_7";
      select_workspace_8 = "KEY_8";
      select_workspace_9 = "KEY_9";
      toggle = "<super> ";
      transition_length = 200;
    };

    extra-gestures = {
      close_fingers = 20;
      move_delay = 500;
      move_fingers = 3;
    };

    fast-switcher = {
      activate = "<super> KEY_TAB";
      activate_backward = "<alt> <shift> KEY_ESC";
      inactive_alpha = 0.85;
    };

    filters = { };
    
    fisheye = {
      radius = 450.0;
      toggle = "<ctrl> <super> BTN_LEFT";
      zoom = 7.0;
    };

    focus-change = {
      cross-output = false;
      cross-workspace = false;
      down = "<shift> <super> KEY_DOWN";
      grace-down = 1;
      grace-left = 1;
      grace-right = 1;
      grace-up = 1;
      left = "<shift> <super> KEY_LEFT";
      raise-on-change = true;
      right = "<shift> <super> KEY_RIGHT";
      scan-height = 0;
      scan-width = 0;
      up = "<shift> <super> KEY_UP";
    };

    focus-request = {
      auto_focus_children = true;
      auto_focus_views = "none";
      auto_grant_focus = false;
      deny_focus_views = "none";
      focus_last_demand = "<alt> <ctrl> KEY_A";
      focus_stealing_timeout = 1000;
    };

    focus-steal-prevent = {
      cancel_keys = "KEY_ENTER";
      deny_focus_views = "none";
      timeout = 1000;
    };

    follow-focus = {
      change_output = true;
      change_view = true;
      focus_delay = 50;
      raise_on_top = true;
      threshold = 10;
    };

    force-fullscreen = {
      constrain_pointer = false;
      constraint_area = "view";
      key_toggle_fullscreen = "<alt> <super> KEY_F";
      preserve_aspect = true;
      transparent_behind_views = true;
      x_skew = 0.0;
      y_skew = 0.0;
    };

    foreign-toplevel = { };

    ghost = {
      ghost_match = "";
      ghost_toggle = "";
    };

    grid = {
      duration = "300ms circle";
      restore = "<super> KEY_DOWN | <super> KEY_KP0";
      slot_b = "<super> KEY_KP2";
      slot_bl = "<super> KEY_KP1";
      slot_br = "<super> KEY_KP3";
      slot_c = "<super> KEY_UP | <super> KEY_KP5";
      slot_l = "<super> KEY_LEFT | <super> KEY_KP4";
      slot_r = "<super> KEY_RIGHT | <super> KEY_KP6";
      slot_t = "<super> KEY_KP8";
      slot_tl = "<super> KEY_KP7";
      slot_tr = "<super> KEY_KP9";
      type = "crossfade";
    };

    gtk-shell = { };

    hide-cursor = {
      hide_delay = 2000;
      toggle = "<ctrl> <super> KEY_H";
    };

    idle = {
      cube_max_zoom = 1.5;
      cube_rotate_speed = 1.0;
      cube_zoom_speed = 1000;
      disable_initially = false;
      disable_on_fullscreen = true;
      dpms_timeout = -1;
      screensaver_timeout = 3600;
      toggle = "none";
    };

    input = {
      "3fg_drag" = "default";
      click_method = "default";
      cursor_size = 24;
      cursor_theme = "capitaine-cursors";
      disable_touchpad_while_mouse = false;
      disable_touchpad_while_typing = false;
      drag_lock = false;
      gesture_sensitivity = 1.0;
      kb_capslock_default_state = false;
      kb_numlock_default_state = false;
      kb_repeat_delay = 400;
      kb_repeat_rate = 40;
      left_handed_mode = false;
      middle_emulation = false;
      modifier_binding_timeout = 400;
      mouse_accel_profile = "default";
      mouse_cursor_speed = 0.0;
      mouse_natural_scroll = false;
      mouse_scroll_speed = 1.0;
      natural_scroll = false;
      scroll_method = "default";
      tablet_motion_mode = "default";
      tap_and_drag = true;
      tap_to_click = true;
      touchpad_accel_profile = "default";
      touchpad_cursor_speed = 0.0;
      touchpad_scroll_speed = 1.0;
      xkb_layout = "us";
      xkb_model = "";
      #xkb_options = "grp:caps_toggle,grp_led:caps,ctrl:rctrl_ralt";
      xkb_rules = "evdev";
      xkb_variant = "";
    };

    input-device = {
      calibration = "";
      output = "";
    };

    input-method-v1 = {
      enable_text_input_v1 = true;
      enable_text_input_v3 = true;
    };

    invert = {
      preserve_hue = false;
      toggle = "<super> KEY_I";
    };

    ipc = { };

    ipc-rules = { };

    join-views = { };

    keycolor = {
      color = "#000000FF";
      opacity = 0.25;
      threshold = 0.5;
    };

    mag = {
      default_height = 500;
      toggle = "<alt> <super> KEY_M";
      zoom_level = 75;
    };

    move = {
      activate = "<super> BTN_LEFT";
      enable_snap = true;
      enable_snap_off = true;
      join_views = false;
      preview_base_border = "#404080CC";
      preview_base_color = "#8080FF80";
      preview_border_width = 3;
      quarter_snap_threshold = 50;
      snap_off_threshold = 10;
      snap_threshold = 10;
      workspace_switch_after = -1;
    };

    obs = { };

    oswitch = {
      next_output = "<super> KEY_O";
      next_output_with_win = "<shift> <super> KEY_O";
      prev_output = "";
      prev_output_with_win = "";
    };

    output = {
      depth = 8;
      mode = "auto";
      position = "auto";
      scale = 1.0;
      transform = "normal";
      vrr = false;
    };

    pin-view = { };
    
    place = {
      mode = "random";
    };

    preserve-output = {
      last_output_focus_timeout = 10000;
    };

    resize = {
      activate = "<super> BTN_RIGHT";
      activate_preserve_aspect = "none";
    };

    scale = {
      allow_zoom = false;
      bg_color = "#1A1A1AE6";
      close_on_new_view = false;
      duration = "750ms circle";
      inactive_alpha = 0.85;
      include_minimized = false;
      interact = false;
      middle_click_close = false;
      minimized_alpha = 0.85;
      outer_margin = 0;
      spacing = 50;
      text_color = "#CCCCCCFF";
      title_font_size = 9;
      title_overlay = "all";
      title_position = "center";
      toggle = "<super> KEY_P | hotspot left-top 10x100 100";
      toggle_all = "";
    };

    scale-title-filter = {
      bg_color = "#00000080";
      case_sensitive = false;
      font_size = 30;
      overlay = true;
      share_filter = false;
      text_color = "#CCCCCCCC";
    };

    session-lock = { };

    shortcuts-inhibit = {
      break_grab = "none";
      ignore_views = "none";
      inhibit_by_default = "none";
    };

    showrepaint = {
      reduce_flicker = true;
      toggle = "<alt> <super> KEY_S";
    };

    showtouch = {
      center_color = "#80008080";
      finger_color = "#00800080";
      toggle = "<ctrl> <super> KEY_S";
      touch_duration = "250ms sigmoid";
      touch_radius = 25;
    };

    simple-tile = {
      animation_duration = "20ms circle";
      button_move = "<super> BTN_LEFT";
      button_resize = "<super> BTN_RIGHT";
      inner_gap_size = 2;
      keep_fullscreen_on_adjacent = true;
      key_focus_above = "<super> KEY_K";
      key_focus_below = "<super> KEY_J";
      key_focus_left = "<super> KEY_H";
      key_focus_right = "<super> KEY_L";
      key_toggle = "<super> KEY_SPACE";
      outer_horiz_gap_size = 4;
      outer_vert_gap_size = 4;
      preview_base_border = "#404080CC";
      preview_base_color = "#8080FF80";
      preview_border_width = 2;
      tile_by_default = "kitty";
    };

    switcher = {
      gesture_toggle = "edge-swipe down 3";
      next_view = "<alt> KEY_TAB";
      prev_view = "<alt> <shift> KEY_TAB";
      speed = "500ms circle";
      touch_sensitivity = 1.0;
      view_thumbnail_rotation = 30;
      view_thumbnail_scale = 1.0;
    };

    view-shot = {
      capture = "<alt> <super> BTN_MIDDLE";
      command = "notify-send \"The view under cursor was captured to %f\"";
      filename = "/tmp/snapshot-%F-%T.png";
    };

    vswipe = {
      # background = "#1A1A1AFF";
      delta_threshold = 24.0;
      duration = "180ms circle";
      enable_free_movement = true;
      enable_horizontal = true;
      enable_smooth_transition = true;
      enable_vertical = true;
      fingers = 4;
      gap = 32.0;
      speed_cap = 0.05;
      speed_factor = 256.0;
      threshold = 0.35;
    };

    vswitch = {
      # background = "#1A1A1AFF";
      binding_down = "<ctrl> <super> KEY_DOWN";
      binding_last = "";
      binding_left = "<ctrl> <super> KEY_LEFT";
      binding_right = "<ctrl> <super> KEY_RIGHT";
      binding_up = "<ctrl> <super> KEY_UP";
      binding_win_down = "<ctrl> <shift> <super> KEY_DOWN";
      binding_win_left = "<ctrl> <shift> <super> KEY_LEFT";
      binding_win_right = "<ctrl> <shift> <super> KEY_RIGHT";
      binding_win_up = "<ctrl> <shift> <super> KEY_UP";
      duration = "300ms circle";
      gap = 20;
      send_win_down = "";
      send_win_last = "";
      send_win_left = "";
      send_win_right = "";
      send_win_up = "";
      with_win_down = "";
      with_win_last = "";
      with_win_left = "<alt> <shift> <super> KEY_LEFT";
      with_win_right = "<alt> <shift> <super> KEY_RIGHT";
      with_win_up = "<alt> <shift> <super> KEY_UP";
      wraparound = true;
    };
    
    # wayfire-shell = {
    #   toggle_menu = "<super> ";
    # };

    wf-info = { };

    window-rules = {
      rule_1 = "on created then set alpha 0.85";
      rule_2 = "on created if app_id is \"kitty\" then snap left";
      # rule_3 = "match:app_id=\"firefox\" action:workspace=2";
      rule_3 = "on created if title contians \"Firefox\" then set alpha 0.5"; #assign_workspace 1 0";
      # alacritty-on-workspace-2 = "app-id = firefox & move_to_workspace=4";

    };

    winzoom = {
      dec_x_binding = "<ctrl> <super> KEY_LEFT";
      dec_y_binding = "<ctrl> <super> KEY_UP";
      inc_x_binding = "<ctrl> <super> KEY_RIGHT";
      inc_y_binding = "<ctrl> <super> KEY_DOWN";
      modifier = "<ctrl> <super> ";
      nearest_filtering = false;
      preserve_aspect = true;
      zoom_step = 0.1;
    };

    wm-actions = {
      minimize = "none";
      send_to_back = "none";
      toggle_always_on_top = "none";
      toggle_fullscreen = "<super> KEY_F";
      toggle_maximize = "none";
      toggle_showdesktop = "none";
      toggle_sticky = "none";
    };

    workarounds = {
      all_dialogs_modal = true;
      app_id_mode = "stock";
      discard_command_output = true;
      dynamic_repaint_delay = false;
      enable_input_method_v2 = false;
      enable_opaque_region_damage_optimizations = false;
      enable_so_unloading = false;
      force_frame_sync = false;
      force_preferred_decoration_mode = false;
      remove_output_limits = false;
      use_external_output_configuration = false;
    };

    workspace-names = {
      background_color = "#333333B3";
      background_radius = 30.0;
      display_duration = 500;
      font = "Fira Sans";
      margin = 0;
      position = "center";
      show_option_names = false;
      text_color = "#FFFFFFFF";
    };

    wrot = {
      activate = "<ctrl> <super> BTN_RIGHT";
      activate-3d = "<shift> <super> BTN_RIGHT";
      invert = false;
      reset = "<ctrl> <super> KEY_R";
      reset-one = "<super> KEY_R";
      reset_radius = 25.0;
      sensitivity = 24;
    };

    wsets = {
      label_duration = "2000ms linear";
    };

    xdg-activation = {
      check_surface = false;
      only_last_request = false;
      timeout = 30;
    };

    zoom = {
      interpolation_method = 0;
      modifier = "<super> ";
      smoothing_duration = "300ms circle";
      speed = 0.01;
    };
  };
}
