{ pkgs, inputs, vars, ...}:

{
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    # useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {inherit inputs vars;};
    users.${vars.username} = { 
      # _module.args = {  };
      imports = [./home];
      home = {
        username = "${vars.username}"; 
        homeDirectory = "/home/${vars.username}";
        stateVersion = vars.state-version;
      };
    };
  };
  
  # users.mutableUsers = true;
  users.users.${vars.username} = {
    isNormalUser = true;
    description = "${vars.username}";
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
  #     "dialout"
  #   ];
  #   shell = pkgs.zsh;
  #   ignoreShellProgramCheck = false;
  # };

  # nix.settings.allowed-users = ["${private.username}"]; 
  # nix.settings.trusted-users = ["${private.username}" "root"]; #devenv?
}
