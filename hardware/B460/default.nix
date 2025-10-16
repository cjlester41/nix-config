{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  imports = [ 
    
    ./hardware-configuration.nix
    ./amd-gpu.nix
    ./filesystems.nix

  ];
}
