# { config, pkgs, inputs, lib, chaotic, nix-gaming, ... }:

# { 
  
#   boot = {
    
#     kernelPackages = pkgs.linuxPackages_cachyos;
#     # kernelParams = ["quiet"];#"quiet" "systemd.show_status=false" "boot.shell_on_fail" "udev.log_priority=3" "rd.systemd.show_status=auto" "preempt=full" ]; # "nvidia_drm.modeset=1"
#     initrd.systemd.enable = true;
#     supportedFilesystems = ["ntfs"];
  
#     loader = {
#       systemd-boot.enable = true;
#       efi.canTouchEfiVariables = true;
#       timeout = 1;
#     };   
#   };
# }
