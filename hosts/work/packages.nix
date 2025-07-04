{ pkgs, config, inputs, lib, ... }:
{

environment.systemPackages = with pkgs; [

    jdk11
    maven
    python312Full

  ];
}
