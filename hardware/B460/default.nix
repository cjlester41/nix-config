{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    plymouth.enable = true;
    # plymouth.logo = "/home/cjlester/nix-config/files/nixos-dark-512.png";
  };
  
  imports = [ 
    
    ./hardware-configuration.nix
    ./amd-gpu.nix
    ./filesystems.nix

  ];
}
