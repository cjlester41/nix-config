{ pkgs, ...}:

{  
  boot.kernelParams = [
    # "quiet" 
    "systemd.show_status=false" 
    "boot.shell_on_fail" 
    "udev.log_priority=1" 
    "rd.systemd.show_status=auto" 
    "preempt=full" 
    "i915.enable_psr=1" 
  ];
  
  hardware.graphics = {
    enable = true;
    # driSupport = true;
    # driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # For modern Intel iGPUs
      # vaapi-intel-driver # Older systems
      libvdpau-va-gl # For VDPAU compatibility
    ];
  };
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD"; # Or "i965" for older GPUs
  };
  
  services.xserver.videoDrivers = [ "modesetting" ];
  # hardware.graphics = {
    # extraPackages = with pkgs; [
    #   intel-media-driver
    #   vaapiIntel
    #   vaapiVdpau
      # libvdpau-va-gl
    # ];
  # };
}
