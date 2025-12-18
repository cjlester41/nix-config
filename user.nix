{ pkgs, inputs, config, private, vars, ...}:

let
  hostnm = config.networking.hostName;
in
{
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    # useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {inherit inputs private vars hostnm;};
    users.${private.username} = { 
      # _module.args = {  };
      imports = [./home];
      home = {
        username = "${private.username}"; 
        homeDirectory = "/home/${private.username}";
        stateVersion = "25.05";
      };
    };
  };
  
  users.mutableUsers = true;
  users.users.${private.username} = {
    isNormalUser = true;
    description = "${private.username}";
    # linger = true;
    extraGroups = [ 
      "dialout"
      "networkmanager" 
      "wheel" 
      # "audio" 
      # "gamemode" 
      # "video" 
      "storage"  
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = false;
  };  
  # nix.settings.allowed-u

  # users.users.testing = {
  #   isNormalUser = true;
  #   description = "testing";
  #   linger = true;
  #   extraGroups = [ 
  #     "networkmanager" 
  #     "wheel" 
  #     "audio" 
  #     "gamemode" 
  #     "video" 
  #     "libvirtd"
  #     "storage"
  #     "dailout"
  #   ];
  #   shell = pkgs.zsh;
  #   ignoreShellProgramCheck = false;
  # };

  # nix.settings.allowed-users = ["${private.username}"]; 
  # nix.settings.trusted-users = ["${private.username}" "root"]; #devenv?
}
