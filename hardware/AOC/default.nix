{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  imports = [ 
    
    ./hardware-configuration.nix
    ./intel-gpu.nix
    # ./filesystems.nix

  ];
}