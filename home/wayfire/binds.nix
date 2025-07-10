{ config, hostnm, lib, ... }:

let term = "kitty";  
in
{
  wayland.windowManager.wayfire.settings = {
    command = {
      binding_editor = "<super> KEY_C";
      binding_browser = "<super> KEY_W";
      binding_clipman = "<super> KEY_H";
      binding_launcher = "<super> KEY_D";
      binding_lock = "<super> <shift> KEY_ESC";
      binding_logout = "<super> KEY_ESC";
      binding_media-play-pause = "KEY_PLAYPAUSE";
      binding_media-stop = "KEY_STOPCD";
      binding_mute = "KEY_MUTE";
      binding_screenshot = "KEY_SYSRQ | KEY_PRINT";
      binding_screenshot_interactive = "<shift> KEY_SYSRQ | <shift> KEY_PRINT | <super> <shift> KEY_P";
      binding_terminal = "<super> KEY_Z";
      command_editor = "code";
      command_brightness_down = "brightnessctl s 5%-";
      command_brightness_up = "brightnessctl s +5%";
      command_browser = "firefox";
      command_clipman = "clipman pick -t wofi";
      command_launcher = "rofi -show drun";
      command_lock = "swaylock -e -K";
      command_logout = "wlogout";
      command_media-next = "playerctl next";
      command_media-play-pause = "playerctl play-pause";
      command_media-prev = "playerctl previous";
      command_media-stop = "playerctl stop";
      command_mute = "amixer sset Master toggle | sed -En '/\\[on\\]/ s/.*(\\[([0-9]+)%\\]).*/\\1/ p; /\\[off\\]/ s/.*/0/p' | head -1 > $SWAYSOCK.wob";
      command_screenshot = "grim $HOME/Pictures/screenshot-$(date \"+%Y-%m-%d-%H:%M:%S\").png && notify-send -i \"camera\" 'screenshot' 'saved in ~/Pictures'";
      command_screenshot_interactive = "slurp | grim -g - $HOME/Pictures/slurped-$(date \"+%Y-%m-%d-%H:%M:%S\").png && notify-send -i \"camera\" 'screenshot' 'saved in ~/Pictures'";
      command_terminal = term; #"kitty --hold zsh -c \"fastfetch\"";
      command_volume_down = "bash -c \"pamixer -ud 3 && pamixer --get-volume > $SWAYSOCK.wob\"";
      command_volume_up = "bash -c \"pamixer -ui 3 && pamixer --get-volume > $SWAYSOCK.wob\"";
      repeatable_binding_brightness_down = "KEY_BRIGHTNESSDOWN";
      repeatable_binding_brightness_up = "KEY_BRIGHTNESSUP";
      repeatable_binding_media-next = "KEY_NEXTSONG";
      repeatable_binding_media-prev = "KEY_PREVIOUSSONG";
      repeatable_binding_volume_down = "KEY_VOLUMEDOWN";
      repeatable_binding_volume_up = "KEY_VOLUMEUP";
    };
  };
}