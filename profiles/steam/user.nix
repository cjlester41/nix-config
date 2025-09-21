{pkgs, inputs, config, private, ...}:

{
  users.users.${private.username} = {
    isNormalUser = true;
    description = "${private.username}";
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

  users.users.testing = {
    isNormalUser = true;
    description = "${private.username}";
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

  nix.settings.allowed-users = ["${private.username}" ]; 
}
