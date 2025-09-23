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
            rev = "v0.10.1"; #${oldAttrs.version}";
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
                hash = "sha256-0cAPaj5PmGgX/Q0mkdsyjZTQ5JBPrnvB2EnLj89v13g=";  
            };

            buildInputs = oldAttrs.buildInputs ++ [
                final.boost
                final.libdrm
                final.vulkan-headers
            ];

            mesonFlags = []; 
        });

        wf-shell = prev.wayfirePlugins.wf-shell.overrideAttrs (oldAttrs: rec {
            version = "0.10.0";
                
            src = prev.fetchFromGitHub {
                owner = "WayfireWM";
                repo = "wf-shell";
                rev = "v0.10.0"; #${oldAttrs.version}";
                fetchSubmodules = false;
                hash = "sha256-Lm94W5yUFyTNNs0+Q5lN39sNST6V1XF7FfU4o96vyJY=";  
            };

            nativeBuildInputs = oldAttrs.buildInputs ++ [
                final.wdisplays
            ];

            mesonFlags = []; 
        });

        wcm = prev.wayfirePlugins.wcm.overrideAttrs (oldAttrs: rec {
            version = "0.10.0";
                
            src = prev.fetchFromGitHub {
                owner = "WayfireWM";
                repo = "wcm";
                rev = "v0.10.0"; #${oldAttrs.version}";
                fetchSubmodules = false;
                hash = "sha256-O4BYwb+GOMZIn3I2B/WMJ5tUZlaegvwBuyNK9l/gxvQ=";  
            };

            nativeBuildInputs = oldAttrs.buildInputs ++ [
                final.wdisplays
            ];

            mesonFlags = []; 
        });
    };
}
