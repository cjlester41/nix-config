{ inputs, pkgs, ...}: 

{
  imports = [ inputs.niri-flake.homeModules.niri ];
  # nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
  # inputs.niri-flake.cache.enable = true;
  programs.niri = {
    package = pkgs.niri;
    enable = true;
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