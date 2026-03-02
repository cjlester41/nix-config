let 
  defaults = import ../../common/variables.nix;
  overrides = {

    hardware = "sS7";
    state-version = "25.05";
    
    compositor = "niri";
    editor = "vscode";
    background = "wf-background";
    
  };

  vars = defaults // overrides;

in vars