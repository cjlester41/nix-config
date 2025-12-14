let 
  defaults = import ../../default-vars.nix;
  overrides = {
    
    grid = 3;

  };

  vars = defaults // overrides;

in vars