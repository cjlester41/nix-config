let 
  defaults = import ../../common/variables.nix;
  overrides = {

    hardware = "sS7";
    state-version = "24.11";
    
    background = "wf-background";
    
  };

  vars = defaults // overrides;

in vars