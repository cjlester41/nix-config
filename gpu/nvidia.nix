{
  lib,
  pkgs,
  config,
  ...
}:
{
    boot.kernel.sysctl."vm.swappiness" = 10;
    boot.kernelModules= ["nvidia" "nvidia_modeset" "nvidia-uvm" "nvidia-drm"];

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
    hardware.cpu.amd.updateMicrocode = true;
    hardware.nvidia-container-toolkit.enable = true;
    hardware.enableAllFirmware = true;
    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.latest;
        #nvidiaPersistenced = true;
        #forceFullCompositionPipeline = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];
}