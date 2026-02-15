{ ... }:

{
  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/08190544-f406-4b58-be45-d717e3d7987b";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-label/store";
    fsType = "ext4";
    neededForBoot = true;
    options = [ "noatime" ];
  };
}