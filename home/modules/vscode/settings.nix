{ lib, ... }:
{
  programs.vscode.profiles.default = {
    userSettings = {
      "terminal.integrated.env.linux" = {
        "OZONE" = "wayland";
        "PYTHONDONTWRITEBYTECODE" = "1";
      }; 
      "terminal.integrated.suggest.enabled" = false;
      "git.autofetch" = true;
      "git.enableSmartCommit" = true;
      "git.confirmSync" = false;
      "git.mergeEditor" = true;
      "files.autoSave" = "afterDelay";
      "merge-conflict.autoNavigateNextConflict.enabled" = true;
      "git.rebaseWhenSync" = false;
      "explorer.confirmDelete" = true;
      "update.mode" = "none";
      "extensions.autoUpdate" = false; # This stuff fixes vscode freaking out when theres an update
      "window.titleBarStyle" = "native"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509
      "platformio-ide.showEditorTitleShortcuts" = true;
      "files.exclude" = {
        "**/.git" = true;
        "**/.lock" = true;
        "**/target" = true;
        "**/dist" = true;
        "**/build" = true;
        "**/out" = true;
        "**/bin" = true;
      };
      # # "window.menuBarVisibility" = "toggle";
      # # "editor.fontFamily" = "'Maple Mono', 'SymbolsNerdFont', 'monospace', monospace";
      # # "terminal.integrated.fontFamily" = "'Maple Mono', 'SymbolsNerdFont'";
      # # "editor.fontSize" = lib.mkDefault 12;
      # # "workbench.colorTheme" = "Gruvbox Dark Hard";
      # # "workbench.iconTheme" = "gruvbox-material-icon-theme";
      # "material-icon-theme.folders.theme" = "classic";
      # "vsicons.dontShowNewVersionMessage" = true;
      # "explorer.confirmDragAndDrop" = false;
      # "editor.fontLigatures" = true;
      # # "editor.minimap.enabled" = false;
      # "workbench.startupEditor" = "none";

      # # "editor.formatOnSave" = true;
      # "editor.formatOnType" = true;
      # "editor.formatOnPaste" = true;
      # "editor.inlayHints.enabled" = "off";

      # "workbench.layoutControl.type" = "menu";
      # "workbench.editor.limit.enabled" = true;
      # "workbench.editor.limit.value" = 10;
      # "workbench.editor.limit.perEditorGroup" = true;
      # # "workbench.editor.showTabs" = "none";
      # "files.autoSave" = "afterDelay";
      # "explorer.openEditors.visible" = 0;
      # "breadcrumbs.enabled" = false;
      # "editor.renderControlCharacters" = false;
      # # "workbench.activityBar.location" = "hidden";
      # # "workbench.statusBar.visible" = false;
      # # "editor.scrollbar.verticalScrollbarSize" = 2;
      # # "editor.scrollbar.horizontalScrollbarSize" = 2;
      # # "editor.scrollbar.vertical" = "hidden";
      # # "editor.scrollbar.horizontal" = "hidden";
      # # "workbench.layoutControl.enabled" = false;

      # # "editor.mouseWheelZoom" = true;


      
    };
  };
}
