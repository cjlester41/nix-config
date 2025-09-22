final: prev: {

    wayfire = prev.wayfire.overrideAttrs (oldAttrs: rec {
        version = "0.10.0";
        
        src = prev.fetchFromGitHub {
            owner = "WayfireWM";
            repo = "wayfire";
            rev = "v0.10.0"; #${oldAttrs.version}";
            fetchSubmodules = true;
            hash = "sha256-rnrcuikfRPnIfIkmKUIRh8Sm+POwFLzaZZMAlmeBdjY=";  
        };

        postPatch = ("") + ''
            substituteInPlace plugins/common/wayfire/plugins/common/cairo-util.hpp \
            --replace "<drm_fourcc.h>" "<libdrm/drm_fourcc.h>"
        '';

        buildInputs = oldAttrs.buildInputs ++ [
            final.yyjson
            final.vulkan-headers
        ];

        propagatedBuildInputs = oldAttrs.propagatedBuildInputs ++ [
            final.wlroots_0_19
        ];
    });
}