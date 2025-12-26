{ ... }:

{
  programs.vscode = {

    enable = true;
    profiles.default.userSettings = {
      "terminal.integrated.env.linux" = {
        "OZONE" = "wayland";
        "PYTHONDONTWRITEBYTECODE" = "1";
      }; 
      "git.autofetch" = true;
      "git.enableSmartCommit" = true;
      "git.confirmSync" = false;
      "git.mergeEditor" = true;
      "git.rebaseWhenSync" = false;
      "files.autoSave" = "afterDelay";
      "merge-conflict.autoNavigateNextConflict.enabled" = true;      
      "explorer.confirmDelete" = true;
      "update.mode" = "none";
      "extensions.autoUpdate" = false; # This stuff fixes vscode freaking out when theres an update
      "window.titleBarStyle" = "native"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509
      "files.exclude" = {
        "**/.lock" = true;
        "**/target" = true;
        "**/dist" = true;
        "**/build" = true;
        "**/out" = true;
        "**/bin" = true;
      };
    };
  };

  imports = [
    ./theme.nix
  ];
}
