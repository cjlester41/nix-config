{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    plymouth.enable = true;
    # plymouth.logo = "/usr/share/nixos-dark-512.png";
  };

  imports = [ 
    
    ./hardware-configuration.nix
    ./intel-gpu.nix
    # ./filesystems.nix

  ];
}