let
  pkgs = import <nixpkgs> {
    overlays = [
      (import ./wayfire.nix)
    ];
  };
in
{
  pixdecor = pkgs.callPackage ./pixdecor.nix { };
}