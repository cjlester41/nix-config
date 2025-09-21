{ lib, pkgs, config, ...}:

with lib; let
  cfg = config.drivers.intel;
in 
{
  options.drivers.intel = {
    enable = mkEnableOption "Enable Intel Graphics Drivers";
  };  

  config = mkIf cfg.enable {
    boot.kernelParams = [
      "quiet" 
      "systemd.show_status=false" 
      "boot.shell_on_fail" 
      "udev.log_priority=3" 
      "rd.systemd.show_status=auto" 
      "preempt=full" 
    ];
    # OpenGL
    hardware.graphics = {
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
}
