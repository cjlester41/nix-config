final: prev: {

    wf-config = prev.wf-config.overrideAttrs (oldAttrs: rec {
        version = "0.10.0";
        
        src = prev.fetchFromGitHub {
            owner = "WayfireWM";
            repo = "wf-config";
            rev = "v0.10.0"; #${oldAttrs.version}";
            fetchSubmodules = true;
            hash = "sha256-WcGt6yl2LpLnAOVtiCyMyWsoMAUMG1MYhvW/m2DDMX4=";  
        };
    });

    wayfire = prev.wayfire.overrideAttrs (oldAttrs: rec {
    	version = "v0.10.1";
        
        src = prev.fetchFromGitHub {
            owner = "cjlester41";
            repo = "wayfire";
            rev = "v0.10.1"; #"${oldAttrs.version}";
            fetchSubmodules = true;
            hash = "sha256-n1tf6mxswR9Ujy7CDh3iRpsjXkAlE92zg2Ar8OAOCa0=";  
        };

        # postPatch = ("") + ''
        #     substituteInPlace plugins/common/wayfire/plugins/common/cairo-util.hpp \
        #     --replace "<drm_fourcc.h>" "<libdrm/drm_fourcc.h>" 
        # '';

        buildInputs = oldAttrs.buildInputs ++ [
            final.yyjson
            final.vulkan-headers
        ];

        propagatedBuildInputs = oldAttrs.propagatedBuildInputs ++ [
            final.wlroots_0_19
        ];
    });

    wayfirePlugins = {
        
        wayfire-plugins-extra = prev.wayfirePlugins.wayfire-plugins-extra.overrideAttrs (oldAttrs: rec {
            version = "0.10.0";
                    
            src = prev.fetchFromGitHub {
                owner = "WayfireWM";
                repo = "wayfire-plugins-extra";
                rev = "v0.10.0"; #${oldAttrs.version}";
                fetchSubmodules = true;
                hash = "sha256-C5dgs81R4XuPjIm7sj1Mtu4IMIRBEYU6izg2olymeVI=";  
            };

            buildInputs = oldAttrs.buildInputs ++ [
                final.boost
                final.libdrm
                final.vulkan-headers
            ];

            mesonFlags = [
                # plugins in submodule, packaged individually
                # (final.lib.mesonBool "enable_pixdecor" true)
                # (final.lib.mesonBool "enable_wayfire_shadows" true)
                # (lib.mesonBool "enable_focus_request" false)
             ];
        });

        focus-request = prev.wayfirePlugins.focus-request.overrideAttrs (oldAttrs: rec {
            buildInputs = oldAttrs.buildInputs ++ [
                # final.boost
                # final.libdrm
                final.vulkan-headers
            ];
        });

        pixdecor = prev.wayfirePlugins.windecor.overrideAttrs (oldAttrs: rec {
            version = "0.10.3";
                
            src = prev.fetchFromGitHub {
                owner = "cjlester41";
                repo = "pixdecor";
                rev = "12"; #${oldAttrs.version}";
                fetchSubmodules = false;
                hash = "sha256-tvtLvs3DTpyyjKTnnBa0JrI/XQEqaQ191+ohSbeok2k=";  
            };

            # nativeBuildInputs = oldAttrs.buildInputs ++ [
            #     final.wdisplays
            # ];

            buildInputs = oldAttrs.buildInputs ++ [
                # final.wayfire
                final.libxkbcommon
                final.libGL
                final.libinput
                # final.xcbutilwm
                final.libdrm
                final.vulkan-headers
            ];

            mesonFlags = []; 
        });

        # wf-shell = prev.wayfirePlugins.wf-shell.overrideAttrs (oldAttrs: rec {
        #     version = "0.10.0";
                
        #     src = prev.fetchFromGitHub {
        #         owner = "WayfireWM";
        #         repo = "wf-shell";
        #         rev = "v0.10.0"; #${oldAttrs.version}";
        #         fetchSubmodules = false;
        #         hash = "sha256-Lm94W5yUFyTNNs0+Q5lN39sNST6V1XF7FfU4o96vyJY=";  
        #     };

        #     nativeBuildInputs = oldAttrs.buildInputs ++ [
        #         final.wdisplays
        #     ];

        #     mesonFlags = []; 
        # });

        # wcm = prev.wayfirePlugins.wcm.overrideAttrs (oldAttrs: rec {
        #     version = "0.10.0";
                
        #     src = prev.fetchFromGitHub {
        #         owner = "WayfireWM";
        #         repo = "wcm";
        #         rev = "v0.10.0"; #${oldAttrs.version}";
        #         fetchSubmodules = false;
        #         hash = "sha256-O4BYwb+GOMZIn3I2B/WMJ5tUZlaegvwBuyNK9l/gxvQ=";  
        #     };

        #     nativeBuildInputs = oldAttrs.buildInputs ++ [
        #         final.wdisplays
        #     ];

        #     mesonFlags = []; 
        # });
    };
}
