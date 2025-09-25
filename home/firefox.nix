{ config, pkgs, inputs, ... }:

with config.lib.stylix.colors.withHashtag;

{  
  programs.firefox = {
    enable = true;
    profiles = {
      "7u6dfvp7.default" = {
        id = 0;
        name = "7u6dfvp7";
        isDefault = true;
        settings = {
          # "browser.startup.homepage" = "https://github.com";
          "browser.search.defaultenginename" = "google";
          "browser.search.order.1" = "google";
          "browser.display.document_color_use" = "2";
          "browser.display.background_color" = base00;
          "browser.display.foreground_color" = "#e4ccb3ff";
          "widget.gtk.global-menu.enabled" = "true";
          "widget.gtk.global-menu.wayland.enabled" = "true";
          "widget.gtk.libadwaita-colors.enabled" = "false";
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
                  --toolbar-bgcolor: #110011 !important;
              }
              .tabbrowser-tab[selected="true"] .tab-background {
                  border: 1px solid teal !important;
              }   
              @media (prefers-contrast: more) {
              body {
                background-color: black;
                color: white;
              }
            }                  
          '';                                      

        extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
            bitwarden
            ublock-origin
        ];
      };
    };
  };
}
