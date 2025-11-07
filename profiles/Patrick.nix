{ config, pkgs, inputs, lib, chaotic, nix-gaming, private, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
    ../hardware/${private.hardware}
    ../common.nix
    ../stylix.nix
    ../packages.nix
    ../user.nix
    ../services.nix
  ];

  networking.hostName = "NixOS-Steam";

  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [

    steam-run 
    protontricks  
    freecad
    # bottles
    # lutris    
    # winetricks
    # seatd
    mangohud
    ntfsprogs
    gpu-viewer
    mesa-demos
    egl-wayland
    eglexternalplatform
    libGL

    appimage-run
    vulkan-tools
    ananicy-cpp
    ananicy-rules-cachyos 
    
  ];

  programs = {
    gamescope.enable = true;
    gamescope.capSysNice = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true; 
    };

    appimage = {
      enable = true;
      binfmt = true;
      package = pkgs.appimage-run.override {
        extraPkgs = pkgs: [
          pkgs.glibc
    #       pkgs.libGL
    #       pkgs.mesa
    #       pkgs.libffi
    #       pkgs.vulkan-loader
    #       pkgs.xdg-utils
    #       pkgs.wayland
        ];
      };
    };   
  };

  powerManagement.cpuFreqGovernor = "performance";

  environment.sessionVariables = {
    # WLR_RENDERER="vulkan";
  #   GTK_BACKEND = "x11";
  #   __GL_THREADED_OPTIMIZATIONS=0;
  # };
        # MOZ_ENABLE_WAYLAND=1;
        #QT_QPA_PLATFORM="wayland";
        #QT_WAYLAND_DISABLE_WINDOWDECORATION="1";
        #SDL_VIDEODRIVER="wayland";
        #XDG_CURRENT_DESKTOP="sway";
        #XDG_SESSION_TYPE="wayland";
        #_JAVA_AWT_WM_NONREPARENTING=1;
        # GBM_BACKEND="nvidia-drm";
        #GBM_BACKENDS_PATH="/etc/gbm";
        # __GLX_VENDOR_LIBRARY_NAME="nvidia";
        # WLR_NO_HARDWARE_CURSORS=1;
        # NVD_BACKEND = "direct";
        # LIBVA_DRIVER_NAME = "nvidia";
        # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        # LD_LIBRARY_PATH="/run/opengl-driver/lib:/run/opengl-driver-32/lib";
        # __EGL_VENDOR_LIBRARY_FILENAMES="/run/opengl-driver/share/glvnd/egl_vendor.d/10_nvidia.json";
        # SDL_VIDEODRIVER="wayland";
      
    };

    environment.variables = {
      # "GBM_BACKENDS_PATH" = "/run/opengl-driver/lib/gbm";
      # "GBM_BACKEND" = "nvidia-drm";
      # "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
      # "OCL_ICD_VENDORS" = "/run/opengl-driver/etc/OpenCL/vendors";
      # "__EGL_VENDOR_LIBRARY_FILENAMES=${mesa.drivers}/share/glvnd/egl_vendor.d/50_mesa.json"
    
    };
}
