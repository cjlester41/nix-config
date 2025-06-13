{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;
    # userSettings = {
      # "files.autoSave" = "afterDelay";
      # "editor.fontSize" = 12.0;
      # "workbench.colorTheme" = "Dark High Contrast";
    # };
    # mutableExtensionsDir = false;
    #extensions = with pkgs.vscode-extensions; [
    #    jnoortheen.nix-ide
    #    ms-vscode-remote.remote-ssh
    #];
  };
}
