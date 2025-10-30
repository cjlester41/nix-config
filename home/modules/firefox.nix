{ config, pkgs, inputs, private, ... }:

with config.lib.stylix.colors.withHashtag;

{  
  programs.firefox = {
    enable = true;
    profiles = {
      "${private.username}.default" = { # 7u6dfvp7.default
        id = 0;
        name = "${private.username}";
        isDefault = true;
        settings = {
          # "browser.startup.homepage" = "https://github.com";
          "browser.startup.page" = 3;
          "browser.search.defaultenginename" = "google";
          "browser.search.order.1" = "google";
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.display.document_color_use" = 2;
          "browser.display.background_color" = base00;
          "browser.display.foreground_color" = "#e4ccb3ff";
          "widget.gtk.global-menu.enabled" = true;
          "widget.gtk.global-menu.wayland.enabled" = true;
          "widget.gtk.libadwaita-colors.enabled" = false;
          "browser.anchor_color" = "#62a0ea";
          "browser.visited_color" = "#c061cb";
        };
        search = {
          force = true;
          default = "google";
          order = [ "google" "bing"];
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };              
            "bing".metaData.hidden = true;
            "google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
          };
        };

        userChrome = ''                         
          :root {
              --toolbar-bgcolor: ${base00} !important;
          }
          .tabbrowser-tab[selected="true"] .tab-background {
              border: 1px solid teal !important;
          }                              
        '';                                      

        extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          bitwarden
          ublock-origin
          tabliss
        ];
      };
    };
  };

  stylix.targets.firefox.profileNames = [ "${private.username}.default" ];
}
