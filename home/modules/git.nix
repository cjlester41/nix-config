{private, ... }:

{
  programs.git = {
    enable = true;
    settings = {
    user.name = private.git-name;
    user.email = private.git-mail;
    init.defaultBranch = "main";
      extraConfig.pull.rebase = false;
    };
  };
}