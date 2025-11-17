{ config, pkgs, private, ... }:
let 
  isAOC = private.hardware == "AOC";
in
{  
  stylix.targets = {
    hyprlock.enable = false;
  };

  programs.hyprlock.enable = true;
  
  programs.hyprlock.settings = {

  general = {
    hide_cursor = false;
  };

  animations = {
    enabled = false;
    bezier = "linear, 1, 1, 0, 0";
    animation = [
      "fadeIn, 1, 5, linear"
      "fadeOut, 1, 5, linear"
      "inputFieldDots, 1, 2, linear"
    ];
  };

  background = {
    monitor = ""; # Empty string for default or all
    path = "";
    color = "rgba(0, 0, 0, 0.0)";
    blur_passes = 3;
  };

  input-field = {
    monitor = "";
    size = "20%, 5%";
    outline_thickness = 3;
    inner_color = "rgba(0, 0, 0, 0.0)"; # no fill

    outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
    check_color = "rgba(00ff99ee) rgba(ff6633ee) 120deg";
    fail_color = "rgba(ff6633ee) rgba(ff0066ee) 40deg";

    font_color = "rgb(143, 143, 143)";
    fade_on_empty = false;
    rounding = 15;

    # Reference the variable defined at the top
    # font_family = vars.font;
    placeholder_text = "Input password...";
    # fail_text = "$PAMFAIL";

    # uncomment to use a letter instead of a dot to indicate the typed password
    # dots_text_format = "*";
    # dots_size = 0.4;
    dots_spacing = 0.3;

    # uncomment to use an input indicator that does not show the password length
    # hide_input = true;

    position = "0, -20";
    halign = "center";
    valign = "center";
  };

  # Widgets are typically defined in a list of 'label' blocks in Nix
  label = [
    # TIME
    {
      monitor = "";
      text = "$TIME";
      font_size = 90;
      font_family = "Monospace";

      position = "-30, 0";
      halign = "right";
      valign = "top";
    }

    # DATE
    {
      monitor = "";
      # Note: cmd[] is kept as a single string
      text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
      font_size = 25;
      # font_family = vars.font;

      position = "-30, -150";
      halign = "right";
      valign = "top";
    }

    # KEYBOARD LAYOUT
    {
      monitor = "";
      text = "$LAYOUT[en,ru]";
      font_size = 24;
      onclick = "hyprctl switchxkblayout all next";

      position = "250, -20";
      halign = "center";
      valign = "center";
    }
  ];
};
}