{ config, pkgs, inputs, lib, chaotic, nix-gaming, user, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
    ./common.nix
    ./packages.nix
    ./user.nix
    ./services.nix
    ./hardware-configuration.nix
    ./boot.nix
  ];

  networking.hostName = "Steam";

  fileSystems."/home/${user}/share" = {
    device = "/dev/disk/by-uuid/7A50CDFB34EF3C22";
    fsType = "ntfs";
  };

  fileSystems."/home/${user}/steam" = {
    device = "/dev/disk/by-uuid/7c63130c-adf0-48fe-94ab-cda7181379d1";
    fsType = "ext4";
    options = [ "exec" ];
  };

  powerManagement.cpuFreqGovernor = "performance";

  environment.sessionVariables = {
      KWIN_LOW_LATENCY = "1";
      KWIN_TRIPLE_BUFFER = "1";
      KWIN_COMPOSE = "O2";
      KDE_NO_PRELOADING = "0";
      BALOO_DISABLE = "1";
  };
}
