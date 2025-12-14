let 
  defaults = import ../../default-vars.nix;
  overrides = {

    background = "wf-background";
    
  };

  vars = defaults // overrides;

in vars