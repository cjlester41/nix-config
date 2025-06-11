{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    # userSettings = {
      # "files.autoSave" = "afterDelay";
      # "editor.fontSize" = 12.0;
      # "workbench.colorTheme" = "Dark High Contrast";
    # };
  };
}
