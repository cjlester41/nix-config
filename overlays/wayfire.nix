final: prev: {

    # shaderbg = prev.shaderbg.overrideAttrs (oldAttrs: rec {
    # 	version = "v0.10.5";
        
    #     src = prev.fetchFromGitHub {
    #         owner = "cjlester41";
    #         repo = "shaderbg";
    #         rev = "v0.10.5"; #"${oldAttrs.version}";
    #         # fetchSubmodules = true;
    #         hash = "sha256-W766BrH5IRViSO8/sYHqIkhlanvm0t6u/vwW3V/upZQ=";  
    #     };
    # });

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
                # (final.lib.mesonBool "enable_pixdecor" true)
             ];
        });

        filters = prev.wayfirePlugins.focus-request.overrideAttrs (oldAttrs: rec {

            version = "0.10.0";
            src = prev.fetchFromGitHub {
                owner = "cjlester41";
                repo = "filters";
                rev = "v0.10.0"; #${oldAttrs.version}";
                fetchSubmodules = false;
                hash = "sha256-Dfl3yQo+gbI9+bGQyAyA2+gkz+2DR7zd0AenwJUvxuI=";  
            };

            buildInputs = oldAttrs.buildInputs ++ [
                final.libdrm
                final.vulkan-headers
            ];
        });

        wf-info = prev.wayfirePlugins.wwp-switcher.overrideAttrs (oldAttrs: rec {

            version = "1";
            src = ./wf-info/.; 

            buildInputs = oldAttrs.buildInputs ++ [
                final.libdrm
                final.vulkan-headers
                final.wayland-scanner
            ];
        });

        pixdecor = prev.wayfirePlugins.windecor.overrideAttrs (oldAttrs: rec { #prev.callPackage ./pixdecor.nix {};
        
            version = "1";                
            src = ./pixdecor/.; 

            buildInputs = oldAttrs.buildInputs ++ [
                final.libxkbcommon
                final.libGL
                final.libinput
                final.libdrm
                final.vulkan-headers
            ];

            mesonFlags = []; 
        });

        wf-shell = prev.wayfirePlugins.wf-shell.overrideAttrs (oldAttrs: rec {
            # mesonFlags = [ ''icon_dir = "/run/current-system/sw/share/icons/candy-icons/apps/scalable"'' ];
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
