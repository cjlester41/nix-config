{pkgs, inputs, config, user, ...}:

{
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
}
