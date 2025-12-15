let 
  defaults = import ../../default-vars.nix;
  overrides = {
    
    editor = "code";
    
  };

  vars = defaults // overrides;

in vars