{ pkgs, inputs, vars, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  
  home-manager = {
    # useUserPackages = true;
    # useGlobalPkgs = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {inherit inputs vars;};
    users.${vars.username} = { 
      # _module.args = {  };
      imports = [../home];
      home = {
        username = "${vars.username}"; 
        homeDirectory = "/home/${vars.username}";
        stateVersion = vars.state-version;
      };
    };
  };
}