{private, ... }:

{
    programs.git = {
      enable = true;
    #   config = {
        userName = private.git-name;
        userEmail = private.git-mail;
        # init.defaultBranch = "main";
        extraConfig.pull.rebase = false;
    #   };
    };
}