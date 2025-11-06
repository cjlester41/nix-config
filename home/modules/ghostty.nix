{ pkgs, ... }:

{
  stylix.targets = {
    ghostty.enable = true;
  };

  programs.ghostty = {
    enable = true;
    settings = {
      # font-size = 11;
      # font-family = "JetBrainsMono Nerd Font";
      # background = #000000
      # custom-shader = "~/nix-config/files/shaders/lava.glsl";

      # only set this during testing, defaults to "true" which animates only active windows
      # custom-shader-animation = "always";
      resize-overlay="never";
    };
  };
}