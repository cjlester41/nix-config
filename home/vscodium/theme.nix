{ config, ... }:

with config.lib.stylix.colors.withHashtag;

{
  stylix.targets = {
    vscode.enable = false;
  };

  programs.vscode.profiles.default.userSettings = {
    "workbench.colorCustomizations" = {

      "editorGroup.border" = base0C;
      "contrastBorder" = base0C;
      "contrastActiveBorder" = base0C;
      "panel.border" = base0C;
      "panelTitle.activeBorder" = base0C; 
      "sideBar.border" = base0C; 
      "titleBar.border" = base0C; 
      
      "activityBar.background" = base00;
      "activityBarBadge.foreground" = base00;
      "badge.background" = base00;
      "breadcrumb.background" = base00;
      "breadcrumbPicker.background" = base00;
      "button.foreground" = base00;
      "button.secondaryForeground" = base00;
      "chat.avatarForeground" = base00;
      "chat.requestBackground" = base00;
      "chat.slashCommandForeground" = base00;
      "checkbox.background" = base00;
      "commandCenter.activeBackground" = base00;
      "commandCenter.background" = base00;
      "debugExceptionWidget.background" = base00;
      "debugToolBar.background" = base00;
      "dropdown.background" = base00;
      "dropdown.listBackground" = base00;
      "editor.background" = base00;
      "editor.findRangeHighlightBackground" = base00;
      "editor.lineHighlightBackground" = base00;
      "editor.rangeHighlightBackground" = base00;
      "editor.selectionHighlightBackground" = base00;
      "editorGroup.dropIntoPromptBackground" = base00;
      "editorGroup.emptyBackground" = base00;
      "editorGroupHeader.noTabsBackground" = base00;
      "editorGroupHeader.tabsBackground" = base00;
      "editorGutter.background" = base00;
      "editorHoverWidget.background" = base00;
      "editorHoverWidget.statusBarBackground" = base00;
      "editorInlayHint.background" = base00;
      "editorInlayHint.parameterBackground" = base00;
      "editorInlayHint.typeBackground" = base00;
      "editorMarkerNavigation.background" = base00;
      "editorPane.background" = base00;
      "editorStickyScroll.background" = base00;
      "editorStickyScrollHover.background" = base00;
      "editorSuggestWidget.background" = base00;
      "editorWidget.background" = base00;
      "extensionButton.foreground" = base00;
      "extensionButton.prominentForeground" = base00;
      "inlineChat.background" = base00;
      "inlineChatInput.background" = base00;
      "input.background" = base00;
      "inputOption.activeForeground" = base00;
      "keybindingTable.rowsBackground" = base00;
      "listFilterWidget.background" = base00;
      "menu.background" = base00;
      "minimap.background" = base00;
      "notebook.cellEditorBackground" = base00;
      "notebook.cellHoverBackground" = base00;
      "notebook.editorBackground" = base00;
      "notificationCenterHeader.background" = base00;
      "panel.background" = base00;
      "panel.dropBorder" = base00;
      "peekViewEditor.background" = base00;
      "peekViewEditorGutter.background" = base00;
      "peekViewResult.background" = base00;
      "profileBadge.background" = base00;
      "quickInput.background" = base00;
      "quickInputTitle.background" = base00;
      "settings.checkboxBackground" = base00;
      "settings.dropdownBackground" = base00;
      "settings.numberInputBackground" = base00;
      "settings.textInputBackground" = base00;
      "sideBar.background" = base00;
      "sideBarSectionHeader.background" = base00;
      "statusBar.background" = base00;
      "statusBar.debuggingForeground" = base00;
      "statusBar.noFolderBackground" = base00;
      "statusBarItem.errorForeground" = base00;
      "statusBarItem.errorHoverForeground" = base00;
      "statusBarItem.offlineForeground" = base00;
      "statusBarItem.offlineHoverForeground" = base00;
      "statusBarItem.prominentForeground" = base00;
      "statusBarItem.prominentHoverForeground" = base00;
      "statusBarItem.remoteBackground" = base00;
      "statusBarItem.warningForeground" = base00;
      "statusBarItem.warningHoverForeground" = base00;
      "tab.inactiveBackground" = base00;
      "tab.unfocusedInactiveBackground" = base00;
      "terminal.ansiBlack" = base00;
      "terminal.background" = base00;
      "testing.peekHeaderBackground" = base00;
      "textBlockQuote.background" = base00;
      "textCodeBlock.background" = base00;
      "titleBar.activeBackground" = base00;
      "titleBar.inactiveBackground" = base00;
      "walkThrough.embeddedEditorBackground" = base00;
      "welcomePage.background" = base00;
      "welcomePage.tileBackground" = base00;
    };
    # tokenColors = [
    #   {
    #     name = "Comment";
    #     scope = [
    #       "comment"
    #       "punctuation.definition.comment"
    #     ];
    #     settings = {
    #       fontStyle = "italic";
    #       foreground = base03;
    #     };
    #   }
    #   {
    #     name = "Variables, Parameters";
    #     scope = [
    #       "variable"
    #       "string constant.other.placeholder"
    #       "entity.name.variable.parameter"
    #       "entity.name.variable.local"
    #       "variable.parameter"
    #     ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "Properties";
    #     scope = [ "variable.other.object.property" ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "Colors";
    #     scope = [ "constant.other.color" ];
    #     settings.foreground = base0B;
    #   }
    #   {
    #     name = "Invalid";
    #     scope = [
    #       "invalid"
    #       "invalid.illegal"
    #     ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "Invalid - Deprecated";
    #     scope = [ "invalid.deprecated" ];
    #     settings.foreground = base0F;
    #   }
    #   {
    #     name = "Keyword, Storage";
    #     scope = [
    #       "keyword"
    #       "keyword.other"
    #       "keyword.other.using"
    #       "keyword.other.namespace"
    #       "keyword.other.class"
    #       "keyword.other.new"
    #       "keyword.other.event"
    #       "keyword.other.this"
    #       "keyword.other.await"
    #       "keyword.other.var"
    #       "keyword.other.package"
    #       "keyword.other.import"
    #       "variable.language.this"
    #       "storage.type.ts"
    #       "storage.modifier"
    #     ];
    #     settings.foreground = base0E;
    #   }
    #   {
    #     name = "Keyword Control";
    #     scope = [
    #       "keyword.control"
    #       "keyword.control.flow"
    #       "keyword.control.from"
    #       "keyword.control.import"
    #       "keyword.control.as"
    #     ];
    #     settings.foreground = base0E;
    #   }
    #   {
    #     name = "Types, Primitives";
    #     scope = [
    #       "keyword.type"
    #       "storage.type.primitive"
    #     ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "Function";
    #     scope = [ "storage.type.function" ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "Operator, Misc";
    #     scope = [
    #       "constant.other.color"
    #       "punctuation"
    #       "punctuation.section.class.end"
    #       "meta.tag"
    #       "punctuation.definition.tag"
    #       "punctuation.separator.inheritance.php"
    #       "punctuation.definition.tag.html"
    #       "punctuation.definition.tag.begin.html"
    #       "punctuation.definition.tag.end.html"
    #       "keyword.other.template"
    #       "keyword.other.substitution"
    #     ];
    #     settings.foreground = base05;
    #   }
    #   {
    #     name = "Embedded";
    #     scope = [
    #       "punctuation.section.embedded"
    #       "variable.interpolation"
    #     ];
    #     settings.foreground = base0F;
    #   }
    #   {
    #     name = "Tag";
    #     scope = [
    #       "entity.name.tag"
    #       "meta.tag.sgml"
    #       "markup.deleted.git_gutter"
    #     ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "Function, Special Method";
    #     scope = [
    #       "entity.name.function"
    #       "meta.function-call"
    #       "variable.function"
    #       "support.function"
    #       "keyword.other.special-method"
    #     ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "Block Level Variables";
    #     scope = [
    #       "meta.block variable.other"
    #     ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "Other Variable, String Link";
    #     scope = [
    #       "support.other.variable"
    #       "string.other.link"
    #     ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "Number, Constant, Function Argument, Tag Attribute, Embedded";
    #     scope = [
    #       "constant.numeric"
    #       "constant.language"
    #       "support.constant"
    #       "constant.character"
    #       "constant.escape"
    #       "keyword.other.unit"
    #     ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "String, Symbols, Inherited Class, Markup Heading";
    #     scope = [
    #       "string"
    #       "constant.other.symbol"
    #       "constant.other.key"
    #       "entity.other.inherited-class"
    #       "markup.heading"
    #       "markup.inserted.git_gutter"
    #       "meta.group.braces.curly constant.other.object.key.js string.unquoted.label.js"
    #     ];
    #     settings = {
    #       fontStyle = "";
    #       foreground = base0B;
    #     };
    #   }
    #   {
    #     name = "Class, Support";
    #     scope = [
    #       "entity.name"
    #       "support.type"
    #       "support.class"
    #       "support.other.namespace.use.php"
    #       "meta.use.php"
    #       "support.other.namespace.php"
    #       "markup.changed.git_gutter"
    #       "support.type.sys-types"
    #     ];
    #     settings.foreground = base0A;
    #   }
    #   {
    #     name = "Storage Type, Import Class";
    #     scope = [
    #       "storage.type"
    #       "storage.modifier.package"
    #       "storage.modifier.import"
    #     ];
    #     settings.foreground = base0A;
    #   }
    #   {
    #     name = "Fields";
    #     scope = [ "entity.name.variable.field" ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "Entity Types";
    #     scope = [ "support.type" ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "CSS Class and Support";
    #     scope = [
    #       "source.css support.type.property-name"
    #       "source.sass support.type.property-name"
    #       "source.scss support.type.property-name"
    #       "source.less support.type.property-name"
    #       "source.stylus support.type.property-name"
    #       "source.postcss support.type.property-name"
    #     ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "Sub-methods";
    #     scope = [
    #       "entity.name.module.js"
    #       "variable.import.parameter.js"
    #       "variable.other.class.js"
    #     ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "Language methods";
    #     scope = [
    #       "variable.language"
    #     ];
    #     settings = {
    #       fontStyle = "italic";
    #       foreground = base0C;
    #     };
    #   }
    #   {
    #     name = "entity.name.method.js";
    #     scope = [
    #       "entity.name.method.js"
    #     ];
    #     settings = {
    #       fontStyle = "italic";
    #       foreground = base0D;
    #     };
    #   }
    #   {
    #     name = "meta.method.js";
    #     scope = [
    #       "meta.class-method.js entity.name.function.js"
    #       "variable.function.constructor"
    #     ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "Attributes";
    #     scope = [ "entity.other.attribute-name" ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "HTML Attributes";
    #     scope = [
    #       "text.html.basic entity.other.attribute-name.html"
    #       "text.html.basic entity.other.attribute-name"
    #     ];
    #     settings = {
    #       fontStyle = "italic";
    #       foreground = base0A;
    #     };
    #   }
    #   {
    #     name = "CSS Classes";
    #     scope = [ "entity.other.attribute-name.class" ];
    #     settings.foreground = base0A;
    #   }
    #   {
    #     name = "CSS ID's";
    #     scope = [ "source.sass keyword.control" ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "Inserted";
    #     scope = [ "markup.inserted" ];
    #     settings.foreground = base0B;
    #   }
    #   {
    #     name = "Deleted";
    #     scope = [ "markup.deleted" ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "Changed";
    #     scope = [ "markup.changed" ];
    #     settings.foreground = base0E;
    #   }
    #   {
    #     name = "Regular Expressions";
    #     scope = [ "string.regexp" ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "Escape Characters";
    #     scope = [ "constant.character.escape" ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "URL";
    #     scope = [
    #       "*url*"
    #       "*link*"
    #       "*uri*"
    #     ];
    #     settings.fontStyle = "underline";
    #   }
    #   {
    #     name = "Decorators";
    #     scope = [
    #       "tag.decorator.js entity.name.tag.js"
    #       "tag.decorator.js punctuation.definition.tag.js"
    #     ];
    #     settings = {
    #       fontStyle = "italic";
    #       foreground = base0D;
    #     };
    #   }
    #   {
    #     name = "ES7 Bind Operator";
    #     scope = [
    #       "source.js constant.other.object.key.js string.unquoted.label.js"
    #     ];
    #     settings = {
    #       fontStyle = "italic";
    #       foreground = base0E;
    #     };
    #   }
    #   {
    #     name = "JSON Key - Level 0";
    #     scope = [
    #       "source.json meta.structure.dictionary.json support.type.property-name.json"
    #     ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "JSON Key - Level 1";
    #     scope = [
    #       "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
    #     ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "JSON Key - Level 2";
    #     scope = [
    #       "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
    #     ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "JSON Key - Level 3";
    #     scope = [
    #       "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
    #     ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "JSON Key - Level 4";
    #     scope = [
    #       "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
    #     ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "JSON Key - Level 5";
    #     scope = [
    #       "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
    #     ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "JSON Key - Level 6";
    #     scope = [
    #       "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
    #     ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "JSON Key - Level 7";
    #     scope = [
    #       "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
    #     ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "JSON Key - Level 8";
    #     scope = [
    #       "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
    #     ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "Markdown - Plain";
    #     scope = [
    #       "text.html.markdown"
    #       "punctuation.definition.list_item.markdown"
    #     ];
    #     settings.foreground = base05;
    #   }
    #   {
    #     name = "Markdown - Markup Raw Inline";
    #     scope = [ "text.html.markdown markup.inline.raw.markdown" ];
    #     settings.foreground = base0E;
    #   }
    #   {
    #     name = "Markdown - Markup Raw Inline Punctuation";
    #     scope = [
    #       "text.html.markdown markup.inline.raw.markdown punctuation.definition.raw.markdown"
    #     ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "Markdown - Line Break";
    #     scope = [ "text.html.markdown meta.dummy.line-break" ];
    #     settings.foreground = base03;
    #   }
    #   {
    #     name = "Markdown - Heading";
    #     scope = [
    #       "markdown.heading"
    #       "markup.heading | markup.heading entity.name"
    #       "markup.heading.markdown punctuation.definition.heading.markdown"
    #     ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "Markup - Italic";
    #     scope = [
    #       "markup.italic"
    #     ];
    #     settings = {
    #       fontStyle = "italic";
    #       foreground = base0C;
    #     };
    #   }
    #   {
    #     name = "Markup - Bold";
    #     scope = [
    #       "markup.bold"
    #       "markup.bold string"
    #     ];
    #     settings = {
    #       fontStyle = "bold";
    #       foreground = base0C;
    #     };
    #   }
    #   {
    #     name = "Markup - Bold-Italic";
    #     scope = [
    #       "markup.bold markup.italic"
    #       "markup.italic markup.bold"
    #       "markup.quote markup.bold"
    #       "markup.bold markup.italic string"
    #       "markup.italic markup.bold string"
    #       "markup.quote markup.bold string"
    #     ];
    #     settings = {
    #       fontStyle = "bold";
    #       foreground = base0C;
    #     };
    #   }
    #   {
    #     name = "Markup - Underline";
    #     scope = [ "markup.underline" ];
    #     settings = {
    #       fontStyle = "underline";
    #       foreground = base0C;
    #     };
    #   }
    #   {
    #     name = "Markdown - Blockquote";
    #     scope = [ "markup.quote punctuation.definition.blockquote.markdown" ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "Markup - Quote";
    #     scope = [ "markup.quote" ];
    #     settings.fontStyle = "italic";
    #   }
    #   {
    #     name = "Markdown - Link";
    #     scope = [ "string.other.link.title.markdown" ];
    #     settings.foreground = base0D;
    #   }
    #   {
    #     name = "Markdown - Link Description";
    #     scope = [ "string.other.link.description.title.markdown" ];
    #     settings.foreground = base0E;
    #   }
    #   {
    #     name = "Markdown - Link Anchor";
    #     scope = [ "constant.other.reference.link.markdown" ];
    #     settings.foreground = base0A;
    #   }
    #   {
    #     name = "Markup - Raw Block";
    #     scope = [ "markup.raw.block" ];
    #     settings.foreground = base0E;
    #   }
    #   {
    #     name = "Markdown - Raw Block Fenced";
    #     scope = [ "markup.raw.block.fenced.markdown" ];
    #     settings.foreground = "#00000050";
    #   }
    #   {
    #     name = "Markdown - Fenced Bode Block";
    #     scope = [
    #       "punctuation.definition.fenced.markdown"
    #     ];
    #     settings.foreground = "#00000050";
    #   }
    #   {
    #     name = "Markdown - Fenced Code Block Variable";
    #     scope = [
    #       "markup.raw.block.fenced.markdown"
    #       "variable.language.fenced.markdown"
    #     ];
    #     settings.foreground = base0E;
    #   }
    #   {
    #     name = "Markdown - Fenced Language";
    #     scope = [ "variable.language.fenced.markdown" ];
    #     settings.foreground = base0C;
    #   }
    #   {
    #     name = "Markdown - Separator";
    #     scope = [ "meta.separator" ];
    #     settings = {
    #       fontStyle = "bold";
    #       foreground = base0C;
    #     };
    #   }
    #   {
    #     name = "Markup - Table";
    #     scope = [ "markup.table" ];
    #     settings.foreground = base0E;
    #   }
    #   {
    #     scope = "token.info-token";
    #     settings.foreground = base0D;
    #   }
    #   {
    #     scope = "token.warn-token";
    #     settings.foreground = base0A;
    #   }
    #   {
    #     scope = "token.error-token";
    #     settings.foreground = base0C;
    #   }
    #   {
    #     scope = "token.debug-token";
    #     settings.foreground = base0E;
    #   }
    # ];
  };
}
