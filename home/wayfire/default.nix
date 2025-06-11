{ pkgs, ... }:

{  
  wayland.windowManager.wayfire = {
    enable = true;
    plugins = with pkgs.wayfirePlugins; [
      wf-shell
      wayfire-plugins-extra
    ];
  };

  stylix.targets = {
    wayfire.enable = false;
  };

  imports = [
    ./config.nix
    ./binds.nix
    ./decoration.nix
    # ./plugins.nix
  ];
}
