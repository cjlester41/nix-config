{ config, pkgs, inputs, lib, chaotic, nix-gaming, ... }:

{ 
  boot = {
    # kernel.sysctl."vm.swappiness" = 10;
    # kernelModules= ["nvidia" "nvidia_modeset" "nvidia-uvm" "nvidia-drm"];
    kernelPackages = pkgs.linuxPackages_cachyos;
    kernelParams = [ "quiet" "splash" "systemd.show_status=false" "boot.shell_on_fail" "udev.log_priority=3" "rd.systemd.show_status=auto" "nvidia_drm.modeset=1" "preempt=full" ];
    initrd.systemd.enable = true;
  
    loader.grub.enable = true;
    loader.grub.efiSupport = true;
    loader.grub.device = "nodev";
    loader.efi.canTouchEfiVariables = true;     
  };
}
