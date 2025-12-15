let 
  defaults = import ../../default-vars.nix;
  overrides = {

    # grid = "3";
    bar = false;
    dock = false;
    alpha = "0.90";
    basecolor = "111111";
    shader = "glitchy.glsl";
    theme = "tokyo-night-dark";
    background = "glitchy-bg";

  };

  vars = defaults // overrides;

in vars