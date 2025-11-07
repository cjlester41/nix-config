{ config, pkgs, lib, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    plymouth.enable = true;
    # plymouth.logo = "~/home/cjlester/nix-config/files/nixos-dark-512.png";
  };


  imports = [ 
    
    ./hardware-configuration.nix
    ./nvidia-gpu.nix
    ./filesystems.nix

  ];  
}
