{pkgs, inputs, config, usernm, ...}:

{
  users.users.${usernm} = {
    isNormalUser = true;
    description = "${usernm}";
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
}
