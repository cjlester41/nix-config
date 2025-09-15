{ pkgs, config, inputs, lib, ... }:

{
  environment.systemPackages = with pkgs; [

    swaybg

  ];
}
