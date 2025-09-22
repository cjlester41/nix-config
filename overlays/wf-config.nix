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
}