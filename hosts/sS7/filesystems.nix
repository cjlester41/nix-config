{ vars, ... }:

{
#   fileSystems."/home" = {
#     device = "/dev/disk/by-uuid/08190544-f406-4b58-be45-d717e3d7987b";
#     fsType = "ext4";
#     options = [ "nofail" ];
#   };

#   fileSystems."/boot" =
#     { device = "/dev/disk/by-uuid/EC36-4DE1";
#       fsType = "vfat";
#       options = [ "fmask=0077" "dmask=0077" ];
#     };

#   fileSystems."/home/${vars.username}/win11" = {
#     device = "/dev/disk/by-uuid/724A76E34A76A40F";
#     fsType = "ntfs";
#   };

#   fileSystems."/nix" = {
#     device = "/dev/disk/by-label/store";
#     fsType = "ext4";
#     neededForBoot = true;
#     options = [ "noatime" ];
#   };
}
