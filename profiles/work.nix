{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # signal-desktop
    spotify-player
    # factorio
    gimp
    niri
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    
  ];  

  # nixpkgs.config.packageOverrides = pkgs: {
  #   factorio = pkgs.factorio.override {
  #     username = vars.git-name;
  #     token = "";
  #   };
  # };
}