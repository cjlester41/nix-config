let 
  defaults = import ../../default-vars.nix;
  overrides = {
    
    hardware = "AOC";
    state-version = "24.11";

    grid = "3";
    alpha = "0.90";
    basecolor = "000000";
    shader = "glitchy.glsl -e btop & disown";
    theme = "tokyo-night-dark";
    editor = "zeditor";
    outter-gap = "0";
    borders = "False"; 

  };

  vars = defaults // overrides;

in vars