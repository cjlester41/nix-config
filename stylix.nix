{ config, pkgs, ...}: 
#   inherit (import ../../hosts/${host}/variables.nix) stylixImage;
let basecolor = 
  if config.networking.hostName == "NixOS-S7" then
    "110011"
  else
  if config.networking.hostName == "NixOS-AOC" then
    "000000"
  else
    "110011";    
in {
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    pkgs.montserrat
    # nerd-fonts.fira-code
    # nerd-fonts.caskaydia-cove
    # nerd-fonts.symbols-only
    # twemoji-color-font
    # noto-fonts-emoji
    # fantasque-sans-mono
    # maple-mono.truetype-autohint    
  ];
  stylix = {
    enable = true;
    targets.gtk.enable = true;
    # targets.firefox.profileNames = [ "7u6dfvp7.default" ];
    # targets.gtk.theme = "stylix-gtk";
    # image = stylixImage;
    base16Scheme = {
      base00 = basecolor; # ----
      base01 = "3c3836"; # ---
      base02 = "504945"; # --
      base03 = "665c54"; # -
      base04 = "bdae93"; # +
      base05 = "d5c4a1"; # ++
      base06 = "ebdbb2"; # +++
      base07 = "fbf1c7"; # ++++
      base08 = "fb4934"; # red
      base09 = "fe8019"; # orange
      base0A = "fabd2f"; # yellow
      base0B = "b8bb26"; # green
      base0C = "8ec07c"; # aqua/cyan
      base0D = "7daea3"; # blue
      base0E = "e089a1"; # purple
      base0F = "f28534"; # brown
    };
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
