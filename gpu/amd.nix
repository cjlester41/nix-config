{
  lib,
  pkgs,
  config,
  ...
}:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
	hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "amdgpu" ];
}
