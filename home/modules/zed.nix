{ config, pkgs, ... }:

with config.lib.stylix.colors.withHashtag;

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
    ];
    extraPackages = [ 
      pkgs.nixd 
      pkgs.nil
    ];
    userSettings = {
      autosave.after_delay.milliseconds = 1000;
      minimap.show = "auto";
      lsp.nix.binary.path_lookup = true;
      colorize_brackets = true;
      theme_overrides."Base16 untitled".syntax.variable.color = base0C;
      # icon_theme = {
        # mode = "dark";
        # dark = "Colored Zed Icons Theme Dark";
      # };
    };
    userKeymaps = [
      {
        context = "Editor && vim_mode == normal && !VimWaiting && !menu";
        bindings = {
          "ctrl-h" = "workspace::ActivatePaneLeft";
          "ctrl-l" = "workspace::ActivatePaneRight";
          "ctrl-k" = "workspace::ActivatePaneUp";
          "ctrl-j" = "workspace::ActivatePaneDown";
        };
      }
      {
        context = "Terminal";
        bindings = {
          "ctrl-h" = "workspace::ActivatePaneLeft";
          "ctrl-l" = "workspace::ActivatePaneRight";
          "ctrl-k" = "workspace::ActivatePaneUp";
          "ctrl-j" = "workspace::ActivatePaneDown";
        };
      }
      {
        context = "ProjectPanel && not_editing";
        bindings = {
          "ctrl-h" = "workspace::ActivatePaneLeft";
          "ctrl-l" = "workspace::ActivatePaneRight";
          "ctrl-k" = "workspace::ActivatePaneUp";
          "ctrl-j" = "workspace::ActivatePaneDown";
        };
      }
    ];
  };
}