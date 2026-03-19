{ pkgs, vars, ...}:

{
  environment.systemPackages = with pkgs; [ # is this necessary?
    zsh-powerlevel10k
    meslo-lgs-nf # Recommended font for p10k icons
  ];

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
    ohMyZsh = {
      enable = true;
      # plugins = [ "git" "sudo" "zoxide" ];
    };
    shellInit = ''
      dysk
    ''; # zsh-newuser-install() { :; }
    # interactiveShellInit = "source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh";
    shellAliases = {
      fr = "nh os switch /home/${vars.username}/nix-config";
      fu = "nh os switch /home/${vars.username}/nix-config --update";
      ns = "nix-shell --command zsh";
      np = "nix-shell --command zsh -p";
      nd = "nix develop -c $SHELL";
      nb = "nix build";
    };
  };
  fonts.packages = with pkgs; [
    meslo-lgs-nf
  ];
}