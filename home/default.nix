{ pkgs, lib, vars, ... }:

{
  imports = [ 
    
    ./modules/anyrun.nix
    ./modules/fastfetch  
    ./modules/waybar.nix
    # ./modules/ironbar.nix
    # ./modules/kitty.nix
    ./modules/hyprlock.nix
    # ./modules/cava.nix
    ./modules/firefox.nix
    # ./modules/niri.nix
    # ./modules/vscode
    # ./modules/scripts.nix
    # ./modules/swaync.nix
    # ./wayfire
    # ./modules/starship.nix
    ./modules/wlogout
    ./modules/zed.nix
    # ./modules/swayidle.nix
  ];
 
  # home.packges = with pkgs; [];
  
  programs = {

    alacritty = {
      enable = true;
      settings = {
        window.decorations = "None";
        window.padding = { x = 10; y = 10; };
        font.normal.family = "JetBrainsMono Nerd Font";
      };
    };
    btop = {
      enable = true;
      settings = {    
        color_theme = "tokyo-night";
        theme_background = false;
      };
    };
  };

  stylix.targets = {
    btop.enable = false;
    gtk.extraCss = ''
      headerbar,headerbar:backdrop {
        background-image: none;
        background-color: ${vars.basecolor};
      }
    '';
  };

  gtk = {
    enable = true;
    iconTheme = lib.mkForce {
      name = "Sweet-Rainbow";
      package = pkgs.sweet-folders;
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  
  # xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };  
}

#   home-manager = {
#     backupFileExtension = "bak";
#     useUserPackages = true;
#     useGlobalPkgs = true;
#     # extraSpecialArgs = { inherit inputs username host; };
#     # users.${usern} = {
#       # imports = [./modules/];
#         # if (host == "desktop") then
#           # [ ./modules/../modules/home/default.desktop.nix ]
#         # else
#           # [ ./modules/../modules/home ];
#       home.username = "${vars.username}"; 
#       home.homeDirectory = "/home/${vars.username}"; 
#       home.stateVersion = "24.11";
#       programs.home-manager.enable = true;
    
#   };

#   # Home Manager needs a bit of information about you and the paths it should
#   # manage.
#   home.username = "${vars.username}";
#   home.homeDirectory = "/home/${vars.username}";

#   # This value determines the Home Manager release that your configuration is
#   # compatible with. This helps avoid breakage when a new Home Manager release
#   # introduces backwards incompatible changes.
#   #
#   # You should not change this value, even if you update Home Manager. If you do
#   # want to update the value, then make sure to first check the Home Manager
#   # release notes.
#   home.stateVersion = "24.11"; # Please read the comment before changing.

#   # The home.packages option allows you to install Nix packages into your
#   # environment.
#   home.packages = [
#     pkgs.cava
#     pkgs.cavalier
#     # Adds the 'hello' command to your environment. It prints a friendly
#     # "Hello, world!" when run.
#     pkgs.hello

#     # It is sometimes useful to fine-tune packages, for example, by applying
#     # overrides. You can do that directly here, just don't forget the
#     # parentheses. Maybe you want to install Nerd s with a limited number of
#     # s?
#     (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

#     # You can also create simple shell scripts directly inside your
#     # configuration. For example, this adds a command 'my-hello' to your
#     # environment:
#     (pkgs.writeShellScriptBin "my-hello" ''
#       echo "Hello, ${config.home.username}!"
#     '')
#   ];

#   # Home Manager is pretty good at managing dotfiles. The primary way to manage
#   # plain files is through 'home.file'.
#   home.file = {
#     # Building this configuration will create a copy of 'dotfiles/screenrc' in
#     # the Nix store. Activating the configuration will then make '~/.screenrc' a
#     # symlink to the Nix store copy.
#     ".screenrc".source = dotfiles/screenrc;

#     # You can also set the file content immediately.
#     ".gradle/gradle.properties".text = ''
#       org.gradle.console=verbose
#       org.gradle.daemon.idletimeout=3600000
#     '';
#   };

#   Home Manager can also manage your environment variables through
#   'home.sessionVariables'. These will be explicitly sourced when using a
#   shell provided by Home Manager. If you don't want to manage your shell
#   through Home Manager then you have to manually source 'hm-session-vars.sh'
#   located at either
  
#    ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  
#   or
  
#    ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  
#   or
  
#    /etc/profiles/per-user/isolde/etc/profile.d/hm-session-vars.sh
  
#   home.sessionVariables = {
#     # EDITOR = "emacs";
#   };
# }
