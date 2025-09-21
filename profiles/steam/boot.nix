{ config, pkgs, inputs, lib, chaotic, nix-gaming, ... }:

{   
  boot = {
    
    kernelPackages = pkgs.linuxPackages_cachyos;
    initrd.systemd.enable = true;
    supportedFilesystems = ["ntfs"];
  
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };   
  };
}
