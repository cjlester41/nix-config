let 
  defaults = import ../../default-vars.nix;
  overrides = {

    grid = 3;
    bar = false;
    dock = false;
    alpha = "0.90";
    basecolor = "110011";
    shader = "glitchy.glsl";
    theme = "tokyo-night-dark";

  };

  vars = defaults // overrides;

in vars