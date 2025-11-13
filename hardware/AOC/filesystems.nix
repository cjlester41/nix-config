{ lib, config, private, ... }:

{
  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/08190544-f406-4b58-be45-d717e3d7987b";
    fsType = "ext4";
    options = [ "nofail" ];
  };

#   fileSystems."/home/${private.username}/steam" = {
#     device = "/dev/disk/by-uuid/7c63130c-adf0-48fe-94ab-cda7181379d1";
#     fsType = "ext4";
#     options = [ "exec" ];
#   };

#   fileSystems."/home/${private.username}/win11" = {
#     device = "/dev/disk/by-uuid/724A76E34A76A40F";
#     fsType = "ntfs";
#   };

  fileSystems."/nix" = {
    device = "/dev/disk/by-label/store";
    fsType = "ext4";
    neededForBoot = true;
    options = [ "noatime" ];
  };
}