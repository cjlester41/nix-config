{
  pkgs,
  inputs,
  config,
  user,
  ...
}:
let
  hostnm = config.networking.hostName;
in
{
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {inherit inputs user hostnm;};
    users.${user} = { 
      imports = [./home];
      home = {
        username = "${user}"; 
        homeDirectory = "/home/${user}";
        stateVersion = "24.11";
        # programs.home-manager.enable = true;
      };
    };
  };

  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
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

  nix.settings.allowed-users = ["${user}"]; 
  # nix.settings.trusted-users = ["${user}" "root"]; #devenv?
}
