{ pkgs, inputs, vars, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
    ../hardware/${vars.hardware}
    ../common.nix
    ../stylix.nix
    ../packages.nix
    ../user.nix
    ../services.nix    
  ];

  networking.hostName = "NixOS-AOC";

  system.stateVersion = "24.11";

  environment.systemPackages = with pkgs; [

    # signal-desktop
    spotify-player
    # factorio
    minicom
    gimp
    arduino-ide
    kanata
    
  ];  

  # programs = {
  #   gamescope.enable = true;
  #   gamescope.capSysNice = true;
  #   gamemode.enable = true;
  #   steam = {
  #     enable = true;
  #     extraCompatPackages = [ pkgs.proton-ge-bin ];
  #     gamescopeSession.enable = true;
  #     remotePlay.openFirewall = true;
  #     dedicatedServer.openFirewall = true;
  #     localNetworkGameTransfers.openFirewall = true; 
  #   };
  # };

  # nixpkgs.config.packageOverrides = pkgs: {
  #   factorio = pkgs.factorio.override {
  #     username = private.git-name;
  #     token = "";
  #   };
  # };
  
  # environment.variables = {
  #   WAYFIRE_PLUGIN_PATH="/home/cjlester/wf-idle-expo/result/lib/wayfire";
  #   WAYFIRE_PLUGIN_XML_PATH="/home/cjlester/wf-idle-expo/result/share/wayfire/metadata";
  # };
  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2341", ATTRS{idProduct}=="0070", MODE:="0666"
  '';
  
  services.kanata = {
    enable = true;
    keyboards = {
      "logi".config = ''
        (defsrc
          esc tab caps lmet
        )
        
        (deflayer colemak
          tab esc lmet caps
        )
      '';
    };
  };
  
  # services.udev.extraHwdb = ''
  #   evdev:atkbd:*
  #     KEYBOARD_KEY_3a=esc
  #     KEYBOARD_KEY_01=capslock

  #   evdev:input:b*v*p*:
  #     KEYBOARD_KEY_3a=esc
  #     KEYBOARD_KEY_01=capslock
  # '';
  
  powerManagement.cpuFreqGovernor = "performance";
}