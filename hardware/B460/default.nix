{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_6_16;

  imports = [ 
    
    ./hardware-configuration.nix
    ./amd-gpu.nix
    ./filesystems.nix

  ];
}
