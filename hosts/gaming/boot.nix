{ config, pkgs, inputs, lib, chaotic, nix-gaming, ... }:

{ 
  boot = {
    
    kernelPackages = pkgs.linuxPackages_cachyos;
    kernelParams = [ "quiet" "splash" "systemd.show_status=false" "boot.shell_on_fail" "udev.log_priority=3" "rd.systemd.show_status=auto" "nvidia_drm.modeset=1" "preempt=full" ];
    initrd.systemd.enable = true;
    supportedFilesystems = ["ntfs"];
  
    loader.grub.enable = true;
    loader.grub.efiSupport = true;
    loader.grub.device = "nodev";
    loader.efi.canTouchEfiVariables = true;     
  };
}
