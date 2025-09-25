{ lib, pkgs, config, ...}:

{  
  boot.kernelParams = [
    "quiet" 
    "systemd.show_status=false" 
    "boot.shell_on_fail" 
    "udev.log_priority=3" 
    "rd.systemd.show_status=auto" 
    "preempt=full" 
  ];
  
  hardware.graphics = {
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
