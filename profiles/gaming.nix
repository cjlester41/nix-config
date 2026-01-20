{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # steam-run  
    # bottles
    # lutris
    # protontricks
    # winetricks
    # seatd
    mangohud
    ntfsprogs

    # appimage-run
    # vulkan-tools
    # ananicy-cpp
    # ananicy-rules-cachyos 
    exfatprogs
  
  ];

  programs = {
    # gamescope.enable = true;
    # gamescope.capSysNice = true;
    # gamemode.enable = true;
    steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      # gamescopeSession.enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; 
    };

    # appimage = {
    #   enable = true;
    #   binfmt = true;
    #   package = pkgs.appimage-run.override {
    #     extraPkgs = pkgs: [
    #       pkgs.glibc
    #       pkgs.libGL
    #       pkgs.mesa
    #       pkgs.libffi
    #       pkgs.vulkan-loader
    #       pkgs.xdg-utils
    #       pkgs.wayland
    #     ];
    #   };
    # };   
  };

  # powerManagement.cpuFreqGovernor = "performance";

  # services.udev.extraRules = ''
  #   SUBSYSTEM=="usb", ATTRS{idVendor}=="3343", ATTRS{idProduct}=="0043", MODE="0664", GROUP="dialout"
  # '';

  # environment.variables = {
  #   WAYFIRE_PLUGIN_PATH="/home/cjlester/wayfire-plugins-extra/result/lib/wayfire";
  #   WAYFIRE_PLUGIN_XML_PATH="/home/cjlester/wayfire-plugins-extra/result/share/wayfire/metadata";
  # };
  
  # services.udev.extraRules = ''
    # ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="25a7", ATTRS{idProduct}=="fa34", ATTR{power/wakeup}="disabled"
  # '';
  # services.udev.extraRules = ''
    # KERNEL=="ttyACM0", MODE="0666"
  # '';
}
