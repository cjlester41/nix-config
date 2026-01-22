let 
  defaults = import ../../common/variables.nix;
  overrides = {
    
    hardware = "AOC";
    state-version = "24.11";

    # grid = "3";
    compositor = "niri";
    alpha = "0.90";
    basecolor = "000000";
    shader = "glitchy.glsl -e btop & disown";
    theme = "tokyo-night-dark";
    editor = "zeditor";
    gap-size = 0;
    borders = "False"; 
    hide-bar = true;
    idle-expo = true;

  };

  vars = defaults // overrides;

in vars