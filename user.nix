{
  pkgs,
  inputs,
  ...
}:

{
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "bak";
    # extraSpecialArgs = {inherit inputs username host profile;};
    users.cjlester = { #${username} = {
      imports = [./home];
      home = {
        username = "cjlester"; #"${username}";
        homeDirectory = "/home/cjlester"; #${username}";
        stateVersion = "24.11";
        # programs.home-manager.enable = true;
      };
    };
  };

  users.users.cjlester = {
    isNormalUser = true;
    description = "cjlester";
    extraGroups = [ 
      "networkmanager" 
      "wheel" 
      "audio" 
      "gamemode" 
      "video" 
      "libvirtd"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  nix.settings.allowed-users = ["cjlester"]; #["${username}"];
}
