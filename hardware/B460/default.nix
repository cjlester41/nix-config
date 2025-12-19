{ ... }:

{
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
  
  imports = [ 
    
    ./hardware-configuration.nix
    ./amd-gpu.nix
    ./filesystems.nix

  ];
}
