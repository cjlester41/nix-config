{ pkgs, inputs, config, usernm, ...}:

let
  hostnm = config.networking.hostName;
in
{
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {inherit inputs usernm hostnm;};
    users.${usernm} = { 
      imports = [./home];
      home = {
        username = "${usernm}"; 
        homeDirectory = "/home/${usernm}";
        stateVersion = "24.11";
      };
    };
  };

  users.users.${usernm} = {
    isNormalUser = true;
    description = "${usernm}";
    linger = true;
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

  nix.settings.allowed-users = ["${usernm}"]; 
  # nix.settings.trusted-users = ["${usernm}" "root"]; #devenv?
}
