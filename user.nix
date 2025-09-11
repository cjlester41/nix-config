{
  pkgs,
  inputs,
  config,
  ...
}:

{
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {hostnm = config.networking.hostName;};#inherit inputs username host profile;};
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
      "storage"
      "dailout"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = false;
  };

  nix.settings.allowed-users = ["cjlester"]; #["${username}"];
  # nix.settings.trusted-users = ["cjlester" "root"]; #devenv?
}
