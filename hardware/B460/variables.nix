let 
  defaults = import ../../default-vars.nix;
  overrides = {
    
    grid = 3;
    # theme = "tokyo-night-dark";

  };

  vars = defaults // overrides;

in vars