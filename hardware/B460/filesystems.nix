{ lib, config, private, ... }:

{
  fileSystems."/home/${private.username}/share" = {
    device = "/dev/disk/by-uuid/7A50CDFB34EF3C22";
    fsType = "ntfs";
  };

  fileSystems."/home/${private.username}/steam" = {
    device = "/dev/disk/by-uuid/7c63130c-adf0-48fe-94ab-cda7181379d1";
    fsType = "ext4";
    options = [ "exec" ];
  };
}