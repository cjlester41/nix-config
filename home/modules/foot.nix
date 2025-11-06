{ lib, config, pkgs, ... }:

{
  programs.foot.enable = true;

  programs.foot.settings = {
    main = {
      font = lib.mkForce "JetBrainsMono Nerd Font:size=11";
      pad = "10x10 center";
    };
    colors = {
    };    
  };
  xdg.desktopEntries = {
    "foot" = {
      name = "foot";
      noDisplay = true;
    };
    "footclient" = {
      name = "footclient";
      noDisplay = true;
    };
    "foot-server" = {
      name = "foot-server";
      noDisplay = true;
    };
  };
}