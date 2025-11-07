{ lib, config, private, ... }:

{
#   fileSystems."/home/${private.username}/share" = {
#     device = "/dev/disk/by-uuid/7A50CDFB34EF3C22";
#     fsType = "ntfs";
#   };

  fileSystems."/home/${private.username}/Games" = {
    device = "/dev/disk/by-uuid/ea09c1ba-81f1-4050-9844-4ce86f68b47b";
    fsType = "ext4";
    options = [ "defaults" "nofail" ];
  };

  fileSystems."/home/${private.username}/win11" = {
    device = "/dev/disk/by-uuid/2480FA7A80FA5232";
    fsType = "ntfs";
  };

}