{ pkgs, ... }:

{  
  # # nixpkgs.overlays = [ (import ../../overlays/wf-config.nix) (import ../../overlays/wayfire.nix) (import ../../overlays/wcm.nix) (import ../../overlays/wayfire-plugins-extra.nix) ]; 
  # wayland.windowManager.wayfire = {
  #   enable = true;
  #   plugins = with pkgs.wayfirePlugins; [
  #     wayfire-plugins-extra
  #     # wf-shell
  #     wcm
  #     # windecor
  #   ];
  # };  

  # wayland.windowManager.wayfire.settings = {    

  #   autostart = {
  #     kitty="kitty";
  #   };
  # };

  # home.packages = [ 
  #   pkgs.wayfire
    # wayfire-plugins-extra 
  #   pkgs.wayfirePlugins.wcm
    # ];

  # imports = [
  #   ./config.nix
  #   ./binds.nix
  #   ./decoration.nix
  # ];
}
