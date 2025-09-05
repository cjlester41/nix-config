{ pkgs, config, inputs, lib, ... }:
{

environment.systemPackages = with pkgs; [

    jdk11
    maven
    cmatrix
    lolcat
    signal-desktop
    factorio
    # python312full
  
  ];

nixpkgs.config.packageOverrides = pkgs: {
    factorio = pkgs.factorio.override {
      username = "cjlester41";
      token = "b100c02ff51800924f6b47271cc64c";
    };
  };
}

