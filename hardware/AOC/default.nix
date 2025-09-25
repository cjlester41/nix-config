{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  imports = [ 
    
    ./hardware-configuration.nix
    ./intel-gpu.nix
    # ./filesystems.nix

  ];
}