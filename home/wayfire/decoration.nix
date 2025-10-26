{ config, ... }:

with config.lib.stylix.colors.withHashtag;

{  
  wayland.windowManager.wayfire.settings = {

    animate = {
      close_animation = "shatter";
      duration = "300ms circle";
      enabled_for = "(type equals \"toplevel\" | (type equals \"x-or\" & focusable equals true))";
      fade_duration = "300ms circle";
      fade_enabled_for = "type equals \"overlay\"";
      fire_color = "#B22303FF";
      fire_duration = "200ms circle";
      fire_enabled_for = "none";
      fire_particle_size = 16.0;
      fire_particles = 2000;
      minimize_animation = "squeezimize";
      open_animation = "vortex";
      random_fire_color = false;
      spin_duration = "250ms linear";
      spin_rotations = 1;
      squeezimize_duration = "3400ms linear";
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
      box_offset = 1.0;
      gaussian_degrade = 1;
      gaussian_iterations = 2;
      gaussian_offset = 1.0;
      kawase_degrade = 3;
      kawase_iterations = 2;
      kawase_offset = 1.7;
      method = "kawase";
      saturation = 1.0;
      toggle = "none";
    };

    # decoration = {
    #   active_color = "#160039FF";
    #   border_size = 1;
    #   button_order = "minimize maximize close";
    #   font = "sans-serif";
    #   font_color = "#FFFFFFFF";
    #   forced_views = "none";
    #   ignore_views = "none";
    #   inactive_color = "#160039FF";
    #   title_height = 0;
    # };

    pixdecor = {      
      fg_color=".5 0 .5 .1";
      bg_color=".5 0 .5 .1";
      border_size=6;
      maximized_borders=true;
      overlay_engine="rounded_corners";
      rounded_corner_radius=22;
      titlebar=false;
      # alwaysDecorate = "imv";
      # animate = true;
      # bg_color = ".5 0 .5 .5";
      # bgTextColor = "#B3B3B3FF";
      # border_size = 5;
      # csdTitlebarHeight = 32;
      # effectColor = "#9D7CD8FF";
      # effectType = "none";
      # enableShade = true;
      # fgColor = "#1a1b26FF";
      # fgTextColor = "#FFFFFFFF";
      # ignoreViews = "(app_id is \"ulauncher\")";
      # maximized_borders = true;
      # maximizedShadows = true;
      # overlay_engine = "rounded_corners";
      # rounded_corner_radius = 12;
      # shadeDuration = "1000ms sigmoid";
      # shadeModifier = "<ctrl> <super>";
      # shadeToggle = "";
      # shadowColor = "#00000040";
      # shadowRadius = 10;
      # titleTextAlign = 1;
      # titlebar = false;
      # (The empty [pin-view] section is omitted.)
    };

    extra-animations = {
      blinds_duration = "700ms linear";
      blinds_strip_height = 20;
      helix_duration = "700ms linear";
      helix_rotations = 2;
      helix_strip_height = 20;
      melt_distortion_factor = 20;
      melt_duration = "1000ms linear";
      shatter_duration = "1000ms linear";
      vortex_duration = "1000ms linear";
    };
  };
}


    