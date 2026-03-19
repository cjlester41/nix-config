{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./filesystems.nix
    
    ../../common
    # ../../modules
    
    ../../profiles/maximalgui.nix
    ../../profiles/development.nix
    ../../profiles/remotedev.nix 
    ../../profiles/gpu/intel.nix 
    # ../../profiles/home-manager.nix 
  ];
  
  environment.systemPackages = with pkgs; [
  
    # signal-desktop
  
  ];
  
  networking.hostName = "NixOS-AOC";
  system.stateVersion = "24.11";
  powerManagement.cpuFreqGovernor = "performance";

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "acpi_enforce_resources=lax" "loglevel=3" ];
  };
  
  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 64;
      "default.clock.min-quantum" = 64;
      "default.clock.max-quantum" = 64;
    };
  };
  
  hardware.cpu.intel.updateMicrocode = true;
  
}
