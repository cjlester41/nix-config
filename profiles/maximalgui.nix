{ inputs, pkgs, vars, ... }:

{
  imports = [ ./minimalgui.nix ];
  
  environment.systemPackages = with pkgs; [
  
    candy-icons feh shaderbg sweet-folders gparted nmgui mpv nautilus wlogout
    
    
    inputs.shader-desk.packages.${pkgs.system}.default 
   
  ];
}