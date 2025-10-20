{ config, pkgs, lib, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  # # nixpkgs.overlays = [
  # #   (_: _: {
  # #     inherit (flake-inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}) nvidia-vaapi-driver;
  # #   })
  # # ];
  # easyNvidia = {
  #   enable = true;
  #   withIntegratedGPU = false;
  #   vaapi = {
  #     enable = true;
  #     firefox.av1Support = true;
  #   };
  # };

  # easyNvidia = {
  #   # Apparently xanmod isn't available for LTS at the moment, oh well
  #   # advanced.forceKernel = true;
  #   desktopEnvironment = "wlroots";
  # };

  # hardware.nvidia = {
  #   # let
  #   #   inherit (flake-inputs.self.packages.${pkgs.system}) nvidia;
  #   # in
  #   # {
  #   #   package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
  #   #     inherit (nvidia) version;
  #   #     sha256_64bit = nvidia.src.outputHash;
  #   #     openSha256 = nvidia.open.src.outputHash;
  #   #     useSettings = false;
  #   #     usePersistenced = false;
  #   #   };

  #     # Disabled because I don't use it and I can't be bothered to
  #     # figure out how to get a hash for something nvidia don't seem to
  #     # publish consistently.
  #     nvidiaSettings = false;
  #   };

  imports = [ 
    
    ./hardware-configuration.nix
    ./nvidia-recent.nix
    # ./filesystems.nix

  ];  
}
