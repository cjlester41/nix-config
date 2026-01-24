{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # android-studio
    kanata
    starship
    caligula
    (pkgs.python3.withPackages (ppkgs: [
      ppkgs.pyserial
    ]))
    
  ];  
 
  # environment.variables = {
  #   WAYFIRE_PLUGIN_PATH="/home/cjlester/wf-idle-expo/result/lib/wayfire";
  #   WAYFIRE_PLUGIN_XML_PATH="/home/cjlester/wf-idle-expo/result/share/wayfire/metadata";
  # };
  
  services.kanata = {
    enable = true;
    keyboards = {
      "logi".config = ''
        (defsrc
          esc caps
        )
        
        (deflayer colemak
          caps esc
        )
      '';
    };
  };
}