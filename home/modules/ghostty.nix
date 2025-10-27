{ pkgs, ... }:

{
  stylix.targets = {
    ghostty.enable = true;
  };

  programs.ghostty = {
    enable = true;
    # settings = {
    #   font-size = 11;
    #   font-family = "JetBrainsMono Nerd Font";
    #   background = #000000
    # };
  };
}