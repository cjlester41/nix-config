let 
  defaults = import ../../common/variables.nix;
  overrides = {
    
    hardware = "ASRock";
    state-version = "25.05";
    
    username = "patrick";
    git-name = "newhorizon83";
    editor = "zeditor";

  };

  vars = defaults // overrides;

in vars