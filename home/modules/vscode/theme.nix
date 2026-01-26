{ config, ... }:

with config.lib.stylix.colors.withHashtag;

{
  stylix.targets = {
    vscode.enable = false;
  };

  programs.vscode.profiles.default.userSettings = {
    "workbench.colorCustomizations" = {

    #   "editorGroup.border" = base0C;
    #   "contrastBorder" = base0C;
    #   "contrastActiveBorder" = base0C;
    #   "panel.border" = base0C;
    #   "panelTitle.activeBorder" = base0C; 
    #   "sideBar.border" = base0C; 
    #   "titleBar.border" = base0C; 
      
      "activityBar.background" = base00;
    #   "activityBarBadge.foreground" = base00;
    #   "badge.background" = base00;
    #   "breadcrumb.background" = base00;
    #   "breadcrumbPicker.background" = base00;
    #   "button.foreground" = base00;
    #   "button.secondaryForeground" = base00;
    #   "chat.avatarForeground" = base00;
    #   "chat.requestBackground" = base00;
    #   "chat.slashCommandForeground" = base00;
    #   "checkbox.background" = base00;
    #   "commandCenter.activeBackground" = base00;
    #   "commandCenter.background" = base00;
    #   "debugExceptionWidget.background" = base00;
    #   "debugToolBar.background" = base00;
    #   "dropdown.background" = base00;
    #   "dropdown.listBackground" = base00;
      "editor.background" = base00;
    #   # "editor.findRangeHighlightBackground" = base00;
    #   "editor.lineHighlightBackground" = base00;
    #   # "editor.rangeHighlightBackground" = base00;
    #   # "editor.selectionHighlightBackground" = base00;
    #   "editorGroup.dropIntoPromptBackground" = base00;
    #   "editorGroup.emptyBackground" = base00;
    #   "editorGroupHeader.noTabsBackground" = base00;
    #   "editorGroupHeader.tabsBackground" = base00;
    #   "editorGutter.background" = base00;
    #   "editorHoverWidget.background" = base00;
    #   "editorHoverWidget.statusBarBackground" = base00;
    #   "editorInlayHint.background" = base00;
    #   "editorInlayHint.parameterBackground" = base00;
    #   "editorInlayHint.typeBackground" = base00;
    #   "editorMarkerNavigation.background" = base00;
    #   "editorPane.background" = base00;
    #   "editorStickyScroll.background" = base00;
    #   "editorStickyScrollHover.background" = base00;
    #   "editorSuggestWidget.background" = base00;
    #   "editorWidget.background" = base00;
    #   "extensionButton.foreground" = base00;
    #   "extensionButton.prominentForeground" = base00;
    #   "inlineChat.background" = base00;
    #   "inlineChatInput.background" = base00;
    #   "input.background" = base00;
    #   "inputOption.activeForeground" = base00;
    #   "keybindingTable.rowsBackground" = base00;
    #   "listFilterWidget.background" = base00;
    #   "menu.background" = base00;
    #   "minimap.background" = base00;
    #   "notebook.cellEditorBackground" = base00;
    #   "notebook.cellHoverBackground" = base00;
    #   "notebook.editorBackground" = base00;
    #   "notificationCenterHeader.background" = base00;
      "panel.background" = base00;
    #   "panel.dropBorder" = base00;
    #   "peekViewEditor.background" = base00;
    #   "peekViewEditorGutter.background" = base00;
    #   "peekViewResult.background" = base00;
    #   "profileBadge.background" = base00;
    #   "quickInput.background" = base00;
    #   "quickInputTitle.background" = base00;
    #   "settings.checkboxBackground" = base00;
    #   "settings.dropdownBackground" = base00;
    #   "settings.numberInputBackground" = base00;
    #   "settings.textInputBackground" = base00;
      "sideBar.background" = base00;
      "sideBarSectionHeader.background" = base00;
      "statusBar.background" = base00;
    #   "statusBar.debuggingForeground" = base00;
    #   "statusBar.noFolderBackground" = base00;
    #   "statusBarItem.errorForeground" = base00;
    #   "statusBarItem.errorHoverForeground" = base00;
    #   "statusBarItem.offlineForeground" = base00;
    #   "statusBarItem.offlineHoverForeground" = base00;
    #   "statusBarItem.prominentForeground" = base00;
    #   "statusBarItem.prominentHoverForeground" = base00;
    #   "statusBarItem.remoteBackground" = base00;
    #   "statusBarItem.warningForeground" = base00;
    #   "statusBarItem.warningHoverForeground" = base00;
      "tab.inactiveBackground" = base00;
    #   "tab.unfocusedInactiveBackground" = base00;
    #   "terminal.ansiBlack" = base00;
      "terminal.background" = base00;
    #   "testing.peekHeaderBackground" = base00;
    #   "textBlockQuote.background" = base00;
    #   "textCodeBlock.background" = base00;
      "titleBar.activeBackground" = base00;
      "titleBar.inactiveBackground" = base00;
    #   "walkThrough.embeddedEditorBackground" = base00;
    #   "welcomePage.background" = base00;
    #   "welcomePage.tileBackground" = base00;
    };
  };
}
