let 
  defaults = import ../../default-vars.nix;
  overrides = {
    
    editor = "code";
    username = "patrick";
    git-name = "newhorizon83";
    
  };

  vars = defaults // overrides;

in vars