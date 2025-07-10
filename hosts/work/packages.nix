{ pkgs, config, inputs, lib, ... }:
{

environment.systemPackages = with pkgs; [

    cmatrix
    lolcat
    python312full

  ];
}
