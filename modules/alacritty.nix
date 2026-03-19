{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    alacritty
    zed-editor
    hyprlock
    fastfetch
  ];# settings = {
    #   window.decorations = "None";
    #   window.padding = { x = 10; y = 10; };
    #   font.normal.family = "JetBrainsMono Nerd Font";
    # };
}
