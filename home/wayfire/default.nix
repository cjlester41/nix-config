{ pkgs, ... }:

{  
  wayland.windowManager.wayfire = {
    enable = true;
    plugins = with pkgs.wayfirePlugins; [
      wayfire-plugins-extra
      windecor
    ];
  };  

  imports = [
    ./config.nix
    ./binds.nix
    ./decoration.nix
    # ./plugins.nix
  ];
}
