let 
  defaults = import ../../default-vars.nix;
  overrides = {
    
  };

  vars = defaults // overrides;

in vars