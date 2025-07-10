{ pkgs, config, inputs, lib, ... }:
{

environment.systemPackages = with pkgs; [

    jdk11
    maven
    cmatrix
    lolcat
    # python312full

  ];
}
