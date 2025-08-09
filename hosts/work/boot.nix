{ config, pkgs, inputs, lib, chaotic, nix-gaming, ... }:

{ 
  stylix.targets.grub.enable = false;
  
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    kernelParams = [ "splash" "systemd.show_status=false" "boot.shell_on_fail" "udev.log_priority=3" "rd.systemd.show_status=auto" "preempt=full" ];
    initrd.systemd.enable = true;
  
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 1;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
    };   
  };
}
