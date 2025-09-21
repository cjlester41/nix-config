{ lib, pkgs, config, ...}:

with lib; let
  cfg = config.drivers.intel;
in 
{
  options.drivers.intel = {
    enable = mkEnableOption "Enable Intel Graphics Drivers";
  };

  boot.kernelParams = [
    "quiet" 
    "systemd.show_status=false" 
    "boot.shell_on_fail" 
    "udev.log_priority=3" 
    "rd.systemd.show_status=auto" 
    "preempt=full" 
  ];

  config = mkIf cfg.enable {
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
