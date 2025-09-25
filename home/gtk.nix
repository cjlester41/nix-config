{ pkgs, private, ... }:

{
  gtk = {
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  stylix.targets.gtk.extraCss = ''
    headerbar,headerbar:backdrop {
      background-image: none;
      background-color: #110011;
    '';

#   home.file."gtk-3.0/gtk.css" = {
#     text = (builtins.readFile /home/${private.username}/.config/gtk-3.0/gtk.css) + ''
#         headerbar {
#             /* Set the background and foreground colors for the active header bar */
#             background-color: @theme_bg_color;
#             color: @theme_fg_color;
#         }
#         headerbar:backdrop {
#             /* Set the same colors for the inactive header bar */
#             background-color: @theme_bg_color;
#             color: @theme_fg_color;
#         }
#     '';
#     };

#   xdg.configFile."someapp/config.conf" = {
#   # You can use "text" to define the content directly.
#   # This will create or overwrite the file with this content.
#   # To truly "append", you would typically manage the full content within Nix.
#   # If you need to append to an *existing* file that's not fully managed by Nix,
#   # you might need to use a pre-existing file and then use `text` to add to it,
#   # or manage the file entirely within Nix.
#   text = ''
#       # Existing config content (if you're managing the whole file)
#       setting = value
#       # New content to append
#       new_setting = new_value
#   '';
#   };
}