{ config, ... }:

with config.lib.stylix.colors.withHashtag;

{  
  stylix.targets = {
    wayfire.enable = false;
  };

  wayland.windowManager.wayfire.settings = {

    animate = {
      close_animation = "fire";
      duration = "300ms circle";
      enabled_for = "(type equals \"toplevel\" | (type equals \"x-or\" & focusable equals true) | type equals \"overlay\")";
      fade_duration = "300ms circle";
      fade_enabled_for = "type equals \"overlay\" | title is toplevel";
      fire_color = "#B22303FF";
      fire_duration = "200ms circle";
      fire_enabled_for = "none";
      fire_particle_size = 16.0;
      fire_particles = 2000;
      minimize_animation = "squeezimize";
      open_animation = "fade";
      random_fire_color = false;
      spin_duration = "250ms linear";
      spin_rotations = 1;
      squeezimize_duration = "150ms linear";
      startup_duration = "400ms circle";
      zap_duration = "250ms linear";
      zoom_duration = "500ms circle";
      zoom_enabled_for = "none";
    };

    blur = {
      blur_by_default = "type is \"toplevel\"";
      bokeh_degrade = 1;
      bokeh_iterations = 15;
      bokeh_offset = 5.0;
      box_degrade = 1;
      box_iterations = 2;
      box_offset = 2.0;
      gaussian_degrade = 1;
      gaussian_iterations = 2;
      gaussian_offset = 2.0;
      kawase_degrade = 1;
      kawase_iterations = 2;
      kawase_offset = 5.0;
      method = "kawase";
      mode = "normal";
      saturation = 1.0;
      toggle = "none";
    };

    decoration = {
      active_color = "#1d1f21ff";
      border_size = 2;
      button_order = "minimize maximize close";
      # font = "Fira Sans";
      forced_views = "none";
      ignore_views = "none";
      inactive_color = "#39ea49ff";
      title_height = 0;
    };

    extra-animations = {
      blinds_duration = "700ms linear";
      blinds_strip_height = 20;
      helix_duration = "700ms linear";
      helix_rotations = 2;
      helix_strip_height = 20;
      shatter_duration = "1000ms linear";
      vortex_duration = "1000ms linear";
    };

    # firedecor = {
    #   font = "sans-serif";
    #   font_size = 21;
    #   active_font = "#1d1f21ff";
    #   inactive_font = "#1d1f21ff";
    #   border_size = "35 10"; # Represented as a string since it's two values
    #   active_border = "#1d1f21e6";
    #   inactive_border = "#1d1f21e6";
    #   corner_radius = 15;
    #   outline_size = 0;
    #   active_outline = "#000000ff";
    #   inactive_outline = "#000000ff";
    #   button_size = 18;
    #   button_style = "simple";
    #   normal_min = "#c89e2bff";
    #   hovered_min = "#fac636ff";
    #   normal_max = "#2ebb3aff";
    #   hovered_max = "#39ea49ff";
    #   normal_close = "#c24045ff";
    #   hovered_close = "#f25056ff";
    #   inactive_buttons = false;
    #   icon_size = 20;
    #   icon_theme = "hicolor";
    #   active_accent = "#f5f5f5ff";
    #   inactive_accent = "#e1dfe1ff";
    #   layout = "a | icon P4 title | minimize p maximize p close p Atrtl"; # Keep as string
    #   padding_size = 8; # Assuming this corresponds to "-padding_size"
    #   ignore_views = "none";
    #   debug_mode = false;
    #   # round_on = "all";
    # };
    firedecor = {
      font = "sans-serif";
      # font_size = 21;
      # active_font = "#1d1f21ff";
      # inactive_font = "#1d1f21ff";
      border_size = "35 0"; # Represented as a string since it's two values
      active_border = "#1d1f21e6";
      inactive_border = "#1d1f21e6";
      # corner_radius = 15;
      # outline_size = 0;
      active_title = "#000000ff";
      inactive_title = "#000000ff";
      # button_size = 18;
      # button_style = "simple";
      # normal_min = "#c89e2bff";
      # hovered_min = "#fac636ff";
      # normal_max = "#2ebb3aff";
      # hovered_max = "#39ea49ff";
      # normal_close = "#c24045ff";
      # hovered_close = "#f25056ff";
      # inactive_buttons = false;
      # icon_size = 20;
      # icon_theme = "hicolor";
      active_accent = "#f5f5f5ff";
      inactive_accent = "#e1dfe1ff";
      # layout = "a | icon P4 title | minimize p maximize p close p Atrtl"; # Keep as string
      # padding_size = 8; # Assuming this corresponds to "-padding_size"
      ignore_views = "none";
      # debug_mode = false;
      round_on = "tr tl";
    };

    pixdecor = {
      always_decorate = "none";
      animate = true;
      bg_color = "#124580D9";
      bg_text_color = "#B3B3B3FF";
      border_size = 4;
      button_close_image = "";
      button_color = "#000000FF";
      button_line_thickness = 0.7;
      button_maximize_image = "";
      button_minimize_image = "";
      button_spacing = 5;
      button_x_offset = 0;
      button_y_offset = 0;
      csd_titlebar_height = 32;
      effect_color = "#E01C24FF";
      effect_type = "none";
      enable_shade = true;
      fg_color = "#E6A60AFF";
      fg_text_color = "#FFFFFFFF";
      ignore_views = "none";
      maximized_borders = false;
      maximized_shadows = false;
      overlay_engine = "none";
      rounded_corner_radius = 5;
      shade_duration = "1000ms sigmoid";
      shade_modifier = "<ctrl> <super>";
      shade_toggle = "";
      shadow_color = "#00000040";
      shadow_radius = 10;
      title_font = "";
      title_text_align = 1;
      titlebar = false;
    };

    water = {
      activate = "<ctrl> <super> BTN_LEFT";
    };

    windecor = {
      active_color = "#3CB371AA";
      attn_color = "#3CB371AA";
      border_color = "#3CB371AA";
      border_size = 8;
      button_always_colored = true;
      button_order = "minimize maximize close";
      close_color = "#3CB371AA";
      dynamic_border_color = true;
      font = "sans-serif";
      font_color = "#3CB371AA";
      font_size = 18;
      icon_theme = "breeze";
      ignore_views = "none";
      inactive_color = "#3CB371AA";
      maximize_color = "#3CB371AA";
      minimize_color = "#3CB371AA";
      sticky_color = "#3CB371AA";
      title_align = 0;
      title_height = 0;
      title_position = 0;
      work_hard = false;
    };

    winshadows = {
      clip_shadow_inside = true;
      enabled_views = "type is \"toplevel\" & floating is true";
      glow_color = "#1C71D8FF";
      glow_emissivity = 1.0;
      glow_enabled = true;
      glow_intensity = 0.6;
      glow_radius_limit = 100;
      glow_spread = 10.0;
      glow_threshold = 0.03;
      horizontal_offset = 0;
      include_undecorated_views = false;
      light_type = "gaussian";
      overscale = 1.0;
      shadow_color = "#00000070";
      shadow_radius = 60;
      vertical_offset = 5;
    };

    wobbly = {
      friction = 3.0;
      grid_resolution = 6;
      spring_k = 8.0;
    };

  };
}


    