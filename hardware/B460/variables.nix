let 
  defaults = import ../../default-vars.nix;
  overrides = {
    
    # grid = "3";
    # alpha = "0.9";
    # # theme = "tokyo-night-dark";
    # hide-bar = true;
    # bar-pos = "top";
    # borders = "False";
    # outter-gap = 0;
    # editor = "zeditor";
    # basecolor = "000000";

  };

  vars = defaults // overrides;

in vars
