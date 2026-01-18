{ inputs, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
    # ${vars.hardware}
    ../../common.nix
    ../../stylix.nix
    ../../packages.nix
    ../../user.nix
    ../../services.nix   
   
    ./hardware-configuration.nix
    ./intel-gpu.nix
    ./filesystems.nix

    ../../profiles/development.nix
    ../../profiles/remotedev.nix 
    ../../profiles/gaming.nix 
  ];
  
  networking = {
    hostName = "NixOS-B460";
    networkmanager.dns = "none";
    # useDHCP = false;
    # dhcpcd.enable = false;
  };
  
  system.stateVersion = "25.05";
  powerManagement.cpuFreqGovernor = "performance";
  
  stylix.targets = {
    plymouth.enable = false;
  };  
  
  hardware.uinput.enable = true;
  
  boot = {
    kernelModules = [ "uinput" ];
    # kernelPackages = pkgs.linuxPackages_latest;
    # plymouth = {
    #   enable = true;
    #   theme = "rings";
    #   themePackages = with pkgs; [
    #     (adi1090x-plymouth-themes.override {
    #       selected_themes = [ "rings" ];
    #     })
    #   ];
    # };
  };
}
