{
  pkgs,
  stdenv,
  lib,
  fetchFromGitHub,
#   unstableGitUpdater,
  meson,
  ninja,
  pkg-config,
  wayfire,
  libxkbcommon,
  libGL,
  libinput,
  libdrm,
  xcbutilwm,
  cmake,
  vulkan-headers,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "pixdecor";
  version = "0.10.1";

  src = fetchFromGitHub {
    owner = "cjlester41";
    repo = "pixdecor";
    rev = "v0.10.1";
    hash = "sha256-IE7zvc9Ni/MaHCUCfbaryVlcKDD/vPOJ2qK+w3yMcak=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    wayfire
    libxkbcommon
    libGL
    libinput
    xcbutilwm
    libdrm
    vulkan-headers
  ];

  env = {
    # PKG_CONFIG_WAYFIRE_METADATADIR = "${placeholder "out"}/share/wayfire/metadata";
    # MESON_INSTALL_DESTDIR_PREFIX = "${pkgs.wayfire}/lib";
    LD_LIBRARY_PATH="${pkgs.wayfire}";
  };

#   passthru.updateScript = unstableGitUpdater { };

  # postPatch = ''
  #   substituteInPlace meson.build \
  #     --replace-{warn} "wayfire.get_variable( pkgconfig: 'metadatadir' )" "${pkgs.wayfire}/share/wayfire/metadata')"
  #     --replace-{warn} "wayfire.get_variable( pkgconfig: 'libdir' )" "${pkgs.wayfire}/lib/wayfire')"
  # '';

  meta = {
    homepage = "https://github.com/cjlester41/pixdecor";
    description = "Wayfire plugin";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ cjlester41 ];
    inherit (wayfire.meta) platforms;
  };
})