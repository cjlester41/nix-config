{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "neon-logo";
  version = "1.0";

  src = builtins.fetchurl {
    url = "https://github.com/cjlester41/nix-config/blob/main/files/nixos-dark-512.png";
    sha256 = "0q2kzwqqs04gn8sji3kj3acvy5zqx1gmgp5mkcmxgn0xwcj2z8fl";
  };

  dontUnpack = true;

  installPhase = ''
    cp $src $out/share/icons/hicolor/512x512/apps/${pname}.png
  '';

}

# (callPackage ./overlays/neon.nix {}) 