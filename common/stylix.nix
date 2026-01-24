{ inputs, lib, pkgs, vars, ...}: 

let schemeAttr = file:
  (builtins.fromJSON (builtins.readFile (pkgs.runCommand "json" { } ''
    ${lib.getExe pkgs.yj} < "${file}" > $out
  '').outPath)).palette;
in

{
  imports = [ inputs.stylix.nixosModules.stylix ];
  
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    pkgs.montserrat 
  ];
  stylix = {
    enable = true;
    targets.gtk.enable = true;
    # targets.gtk.theme = "stylix-gtk";
    # image = stylixImage;

    base16Scheme = let 
      defaults = schemeAttr "${pkgs.base16-schemes}/share/themes/${vars.theme}.yaml";
      overrides = {
        base00 = vars.basecolor;
      };
    
      base16Scheme = defaults // overrides;
    
    in base16Scheme;
   
    polarity = "dark";
    opacity.terminal = 1.0;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        # package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        # package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        # package = pkgs.montserrat;
        name = "Montserrat";
      };
      sizes = {
        applications = 11;
        terminal = 11;
        desktop = 11;
        popups = 11;
      };
    };
  };
}
