{ pkgs, config, inputs, lib, ... }:
{

environment.systemPackages = lib.mkIf (config.networking.hostName == "NixOS_s7") [

    pkgs.swaybg

  ];
}
