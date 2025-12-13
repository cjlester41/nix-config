let 
  defaults = import ../../default-vars.nix;
  overrides = {

    grid = 3;
    bar = false;
    dock = false;
    alpha = "0.90";
    basecolor = "111111";

  };

  vars = defaults // overrides;

in vars