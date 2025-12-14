{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
    ];
    userSettings = {
      autosave.after_delay.milliseconds = 1000;
      minimap.show = "auto";
    };  
  };
}