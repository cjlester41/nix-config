let 
  defaults = import ../../common/variables.nix;
  overrides = {
    
    hardware = "B460";
    state-version = "25.05";
    
    compositor = "niri";
    grid = "3";
    alpha = "0.9";
    theme = "tokyo-night-dark";
    hide-bar = true;
    # bar-pos = "top";
    borders = "False";
    gap-size = 0;
    editor = "zeditor";
    basecolor = "110011";

  };

  vars = defaults // overrides;

in vars
