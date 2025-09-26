{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_6_16;

  imports = [ 
    
    ./hardware-configuration.nix
    ./nvidia-gpu.nix
    # ./filesystems.nix

  ];  
}
