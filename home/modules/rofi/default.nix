{...}: {

  stylix.targets = {
    rofi.enable = false;
  };

  imports = [
    ./config-long.nix
    ./rofi.nix
  ];
}
