{ lib, pkgs, config, ... }:

{
  boot = {    
    # kernel.sysctl."vm.swappiness" = 10;
    # kernelModules= [
        # "-amdgpu"
    #   "nvidia" 
    #   "nvidia_modeset" 
    #   "nvidia-uvm" 
    #   "nvidia-drm"
    # ];
    kernelParams = [
      "quiet" 
      "systemd.show_status=false" 
      "boot.shell_on_fail" 
      "udev.log_priority=3" 
      "rd.systemd.show_status=auto" 
      "preempt=full" 
      "nvidia_drm.modeset=1"
      # "module_blacklist=amdgpu"
      # "amdgpu.sg_display=0"
    ];
    # blacklistedKernelModules = [ "nouveau" ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics = {
      enable = true;
      # enable32Bit = true;
      extraPackages = with pkgs; [
        # vulkan-loader
        # vulkan-validation-layers
        # vulkan-extension-layer
        # libvdpau  
        # vdpauinfo
        # libva-utils
        nvidia-vaapi-driver
      ];
    };
    
    nvidia = {
      modesetting.enable = lib.mkDefault true;
      # powerManagement.enable = true;
      # powerManagement.finegrained = false;
      open = true;
      # nvidiaSettings = false;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      #   version = "525.147.05";
      #   sha256_64bit = "sha256-Q1GD6lRcfhLjBE15htoHdYozab7+fuUZ6zsGPUrz/vE=";
      #   sha256_aarch64 = "";
      #   openSha256 = "sha256-FKy8xDfa1PRikG1/VmQqmrq37rTnV2bHZ3Rl7hyIm34=";
      #   settingsSha256 = "sha256-8RW/G70jr8IV5++Aw+dd5kyhiHMgYFWPWQfmhO7FFjM=";
      #   persistencedSha256 = "";
      # };
      # nvidiaPersistenced = true;
      # forceFullCompositionPipeline = true;
    };
    # cpu.amd.updateMicrocode = true;
    # nvidia-container-toolkit.enable = true;
    # enableAllFirmware = true;
    
    
  };

  # environment.variables = {
      # Required to run the correct GBM backend for nvidia GPUs on wayland
      # GBM_BACKEND = "nvidia-drm";
      # Apparently, without this nouveau may attempt to be used instead
      # (despite it being blacklisted)
      # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      # Hardware cursors are currently broken on wlroots
      # WLR_NO_HARDWARE_CURSORS = "1";
    # };
  # environment.variables = {
    # MOZ_DISABLE_RDD_SANDBOX = "1";
    # LIBVA_DRIVER_NAME = "nvidia";
    # GBM_BACKEND = "nvidia-drm";
    # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # NVD_BACKEND = "direct";
    # EGL_PLATFORM = "wayland";
    # WLR_NO_HARDWARE_CURSORS = "1";
    # ELECTRON_OZONE_PLATFORM_HINT = "auto";
    # NIXOS_OZONE_WL=1;
  # };
  
}