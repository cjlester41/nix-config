final: prev: {

    wayfire-plugins-extra = prev.wayfire-plugins-extra.overrideAttrs (oldAttrs: rec {
        version = "0.10.0";
        
        src = prev.fetchFromGitHub {
            owner = "WayfireWM";
            repo = "wayfire-plugins-extra";
            rev = "v0.10.0"; #${oldAttrs.version}";
            # fetchSubmodules = true;
            hash = "";  
        };
    });
}