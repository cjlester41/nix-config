let 
  defaults = import ../../default-vars.nix;
  overrides = {

    hardware = "sS7";
    state-version = "24.11";
    
    background = "wf-background";
    
  };

  vars = defaults // overrides;

in vars