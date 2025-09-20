{ lib, pkgs, config, ... }:

{
  boot = {
    kernel.sysctl."vm.swappiness" = 10;
    kernelModules= ["nvidia" "nvidia_modeset" "nvidia-uvm" "nvidia-drm"];
    kernelParams = ["quiet" "systemd.show_status=false" "boot.shell_on_fail" "udev.log_priority=3" "rd.systemd.show_status=auto" "preempt=full" "nvidia_drm.modeset=1"];
  };

  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;
    cpu.amd.updateMicrocode = true;
    nvidia-container-toolkit.enable = true;
    enableAllFirmware = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      #nvidiaPersistenced = true;
      #forceFullCompositionPipeline = true;
    };
  };

    services.xserver.videoDrivers = [ "nvidia" ];
}