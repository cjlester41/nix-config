{ lib, pkgs, config, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_6_16;
    initrd.kernelModules = [ "amdgpu" ];
    kernelParams = [
      "quiet" 
      "systemd.show_status=false" 
      "boot.shell_on_fail" 
      "udev.log_priority=3" 
      "rd.systemd.show_status=auto" 
      "preempt=full" 
    ];
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vulkan-loader
        vulkan-validation-layers
        vulkan-extension-layer
      ];
    };
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
}
