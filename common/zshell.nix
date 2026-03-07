{ pkgs, vars, ...}:

{
  programs.zsh = {
    enable = true;
    ohMyZsh.enable = true;
    # enableCompletion = true;
    # autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    # dotDir = "${config.users.users.${vars.username}.home}/zsh";
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    # system.userActivationScripts.zshrc = "touch .zshrc";
    shellInit = ''
      fastfetch
      dysk
    ''; # zsh-newuser-install() { :; }
    shellAliases = {
      fr = "nh os switch /home/${vars.username}/nix-config";
      fu = "nh os switch /home/${vars.username}/nix-config --update";
      ns = "nix-shell --command zsh";
      np = "nix-shell --command zsh -p";
      nd = "nix develop -c $SHELL";
      nb = "nix build";
    };
  };
}