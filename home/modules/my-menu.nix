{ pkgs, ... }:

let
  mkMenu = menu: let
    configFile = pkgs.writeText "config.yaml"
      (pkgs.lib.generators.toYAML {} {
        anchor = "center"; 
        inherit menu; 
      });
  in
    pkgs.writeShellScriptBin "my-menu" ''
      exec ${pkgs.lib.getExe pkgs.wlr-which-key} ${configFile}
    ''; 

  my-menu = mkMenu [
    {
      key = "f"; 
      desc = "Firefox";
      cmd = "firefox";
    }
    {
      key = "a"; 
      desc = "Alacritty";
      cmd = "alacritty";
    }
    {
      key = "c"; 
      desc = "Zed";
      cmd = "zeditor";
    }
    {
      key = "d"; 
      desc = "Files";
      cmd = "nautilus";
    }
    {
      key = "l"; 
      desc = "Lock";
      cmd = "wlogout";
    }
    {
      key = "t"; 
      desc = "btop";
      cmd = "alacritty -e btop";
    }
  ];
in {
  home.packages = [
    my-menu 
  ];
}