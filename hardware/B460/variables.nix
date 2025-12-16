let 
  defaults = import ../../default-vars.nix;
  overrides = {
    
    # grid = "3";
    # # theme = "tokyo-night-dark";
    # hide-bar = false;
    # borders = "False";
    # outter-gap = 0;
    editor = "code";

  };

  vars = defaults // overrides;

in vars