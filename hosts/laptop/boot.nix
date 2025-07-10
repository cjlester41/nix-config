{ config, pkgs, inputs, lib, chaotic, nix-gaming, ... }:

{ 
  stylix.targets.grub.enable = false;
  
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    kernelParams = [ "splash" "systemd.show_status=false" "boot.shell_on_fail" "udev.log_priority=3" "rd.systemd.show_status=auto" "preempt=full" ];
    # kernelModules = [ "wl" ];
    # extraModulePackages = with config.boot.kernelPackages; [ broadcom_sta ];
    # blacklistedKernelModules = [ "b43" "bcma" ]; 
    initrd.systemd.enable = true;
  
    loader = {
      timeout = 1;
      grub = {
        enable = true;
        device = "/dev/sda";
        useOSProber = true;
      };
    };   
  };
}
