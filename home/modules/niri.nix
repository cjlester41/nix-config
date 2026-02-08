{ inputs, pkgs, ...}: 

{
  # stylix.targets.niri.enable = false;
  
  imports = [ inputs.niri-flake.homeModules.niri ];
  nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
  # niri-flake.cache.enable = false;
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    # settings = {
      # layout.gaps = 10;
    # };
    # config = null;#with inputs.niri.lib.kdl; [
        # (node "output" "eDP-1" [
        #   (leaf "scale" 2.0)
        # ])
      # ];
  };
}