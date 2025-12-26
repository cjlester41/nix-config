{ vars, ... }:

let
  wfplugins = import ./plugins.nix; ####################server or client?
  framesync = if vars.hardware == "ASRock" then true else false;
  idle-expo = if vars.idle-expo then "idle-expo " else "";
  ws-labels = if vars.grid == "3" then "workspace-names " else "";
  wf-deform = if vars.grid == "3" then 1 else 0;
in
{  
  wayland.windowManager.wayfire.settings = {

    alpha = {
      min_value = vars.alpha;
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

    bench = {
      average_frames = 25;
      position = "top_center";
    };            

    core = {
      background_color = "#000000FF";
      close_top_view = "<super> KEY_Q | <alt> KEY_F4";
      exit = "<alt> <ctrl> KEY_BACKSPACE";
      focus_button_with_modifiers = false;
      focus_buttons = "BTN_LEFT | BTN_MIDDLE | BTN_RIGHT";
      focus_buttons_passthrough = true;
      max_render_time = -1;
      plugins = wfplugins.plugins + idle-expo + ws-labels;
      preferred_decoration_mode = "server";
      transaction_timeout = 100;
      vheight = vars.grid;
      vwidth = vars.grid;
      xwayland = true;
      xwayland_startup_script = "";
    };

    crosshair = {
      line_color = "#FF0000FF";
      line_width = 2;
    };

    cube = {
      activate = "<alt> <ctrl> BTN_LEFT";
      background = "#1A1A1AFF";
      background_mode = "cubemap";
      cubemap_image = "/home/${vars.username}/nix-config/files/cubemap.png";
      deform = wf-deform;
      initial_animation = "350ms circle";
      light = true;
      rotate_left = "<super> KEY_LEFT";
      rotate_right = "<super> KEY_RIGHT";
      skydome_mirror = false;
      skydome_texture = "";
      speed_spin_horiz = 0.03;
      speed_spin_vert = 0.03;
      speed_zoom = 0.07;
      zoom = 0.3;
    };      

    expo = {
      background = "#1A1A1AFF";
      duration = "300ms circle";
      inactive_brightness = 1;
      keyboard_interaction = true;
      offset = 0;
      select_workspace_1 = "KEY_1";
      select_workspace_2 = "KEY_2";
      select_workspace_3 = "KEY_3";
      select_workspace_4 = "KEY_4";
      select_workspace_5 = "KEY_5";
      select_workspace_6 = "KEY_6";
      select_workspace_7 = "KEY_7";
      select_workspace_8 = "KEY_8";
      select_workspace_9 = "KEY_9";
      toggle = "<super>";
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

    filters = {};

    fisheye = {
      radius = 450.0;
      toggle = "<ctrl> <super> KEY_F";
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
      transparent_behind_views = false;
      x_skew = 0.0;
      y_skew = 0.0;
    };

    foreign-toplevel = {};

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

    gtk-shell = {};

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
      screensaver_timeout = 60;
      toggle = "none";
    };

    idle-expo = {
      disable_initially = false;
      disable_on_fullscreen = true;
      dpms_timeout = -1;
      screensaver_timeout = 60;
      toggle = "none";
    };

    input = {
      "3fg_drag" = "default";
      click_method = "default";
      cursor_size = 24;
      cursor_theme = "default";
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
      xkb_options = "";
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

    ipc = {};

    ipc-rules = {};

    join-views = {};

    keycolor = {
      color = "#000000FF";
      opacity = 0.25;
      threshold = 0.5;
    };

    live-previews = {
		  max_dimension = 400;
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

    obs = {};

    oswitch = {
      above_output = "";
      below_output = "";
      left_output = "";
      next_output = "<super> KEY_O";
      next_output_with_win = "<shift> <super> KEY_O";
      prev_output = "";
      prev_output_with_win = "";
      right_output = "";
    };

    output = {
      depth = 8;
      icc_profile = "";
      mode = "auto";
      position = "auto";
      scale = 1.0;
      transform = "normal";
      vrr = false;
    };

    pin-view = {};

    place = {
      mode = "random";
    };

    preserve-output = {
      last_output_focus_timeout = 10000;
    };

    resize = {
      activate = "<super> BTN_RIGHT";
      activate_preserve_aspect = "none";
      min_height = 0;
      min_width = 0;
    };

    scale = {
      allow_zoom = false;
      bg_color = "#1A1A1AE6";
      close_on_new_view = false;
      duration = "750ms circle";
      inactive_alpha = 0.75;
      include_minimized = false;
      middle_click_close = false;
      minimized_alpha = 0.45;
      outer_margin = 0;
      spacing = 50;
      text_color = "#CCCCCCFF";
      title_font_size = 16;
      title_overlay = "all";
      title_position = "center";
      toggle = "<super> KEY_P";
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

    session-lock = {};

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
      inner_gap_size = vars.gap-size;
      keep_fullscreen_on_adjacent = true;
      key_focus_above = "<super> KEY_K";
      key_focus_below = "<super> KEY_J";
      key_focus_left = "<super> KEY_H";
      key_focus_right = "<super> KEY_L";
      key_toggle = "<super> KEY_SPACE";
      outer_horiz_gap_size = vars.gap-size * 2;
      outer_vert_gap_size = vars.gap-size * 2;
      preview_base_border = "#404080CC";
      preview_base_color = "#8080FF80";
      preview_border_width = 2;
      tile_by_default = "!(app_id contains \"steam\") & !(app_id contains \"ghostty\") & !(app_id contains \"FreeCAD\")";
    };

    switcher = {
      next_view = "<alt> KEY_TAB";
      prev_view = "<alt> <shift> KEY_TAB";
      speed = "500ms circle";
      view_thumbnail_rotation = 30;
      view_thumbnail_scale = 1.0;
    };

    view-shot = {
      capture = "<alt> <super> BTN_MIDDLE";
      command = "notify-send \"The view under cursor was captured to %f\"";
      filename = "/tmp/snapshot-%F-%T.png";
    };

    vswipe = {
      background = "#1A1A1AFF";
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
      background = "#1A1A1AFF";
      binding_down = "<super> KEY_J";
      binding_last = "";
      binding_left = "<super> KEY_H";
      binding_right = "<super> KEY_L";
      binding_up = "<super> KEY_K";
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

    water = {
      activate = "<ctrl> <super> BTN_LEFT";
    };

    wayfire-shell = {
      toggle_menu = "<super> KEY_M";
    };

    window-rules = {
      rule_1 = "on created then set alpha ${vars.alpha}";
      # rule_5 = "on created if title is \"Steam\" then set alpha 1";
      # rule_2 = "on created if app_id is \"steam\" then maximize";
      # rule_3 = "on created if app_id contains \"steam\" then set alpha 1";
      rule_4 = "on fullscreened then set alpha 1.0";
      # rule_5 = "on unmaximized then set alpha .85";
    };

    winzoom = {
      dec_x_binding = "<ctrl> <super> KEY_LEFT";
      dec_y_binding = "<ctrl> <super> KEY_UP";
      inc_x_binding = "<ctrl> <super> KEY_RIGHT";
      inc_y_binding = "<ctrl> <super> KEY_DOWN";
      modifier = "<ctrl> <super>";
      nearest_filtering = false;
      preserve_aspect = true;
      zoom_step = 0.1;
    };

    wm-actions = {
      minimize = "<super> KEY_X";
      send_to_back = "none";
      toggle_always_on_top = "none";
      toggle_fullscreen = "<super> KEY_F";
      toggle_maximize = "none";
      toggle_showdesktop = "none";
      toggle_sticky = "none";
    };

    wobbly = {
      friction = 3.0;
      grid_resolution = 6;
      spring_k = 8.0;
    };

    workarounds = {
      all_dialogs_modal = true;
      app_id_mode = "stock";
      auto_reload_config = true;
      config_reload_delay = 20;
      disable_primary_selection = false;
      discard_command_output = true;
      dynamic_repaint_delay = false;
      enable_input_method_v2 = false;
      enable_opaque_region_damage_optimizations = false;
      enable_so_unloading = false;
      focus_main_surface_instead_of_popup = false;
      force_frame_sync = framesync;
      force_preferred_decoration_mode = false;
      keep_last_toplevel_activated = true;
      max_buffer_size = 16384;
      remove_output_limits = false;
      use_external_output_configuration = false;
    };

    workspace-names = {
      # background_color = "00000080";
      background_radius = 30.0;
      display_duration = 999;
      font = "sans-serif";
      margin = 0;
      position = "top_right";
      show_option_names = false;
      show_option_values = true;
      # text_color = "#FFFFFF80";
      HDMI-A-1_workspace_1 = "TL";
      HDMI-A-1_workspace_2 = "TC";
      HDMI-A-1_workspace_3 = "TR";
      HDMI-A-1_workspace_4 = "ML";
      HDMI-A-1_workspace_5 = "MC";
      HDMI-A-1_workspace_6 = "MR";
      HDMI-A-1_workspace_7 = "BL";
      HDMI-A-1_workspace_8 = "BC";
      HDMI-A-1_workspace_9 = "BR";

    };

    wrot = {
      activate = "<shift> <super> BTN_RIGHT";
      activate-3d = "<ctrl> <super> BTN_RIGHT";
      invert = false;
      reset = "<ctrl> <super> KEY_Z";
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
      modifier = "<super>";
      smoothing_duration = "300ms circle";
      speed = 0.01;
    };
  };
}