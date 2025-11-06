{
  stylix.targets = {
    btop.enable = false;
  };
  programs.btop = {
    enable = true;
    settings = {    
      color_theme = "tokyo-night";
      theme_background = false;
    };
  };
  xdg.desktopEntries."btop" = {
    type="Application";
    name="btop++";
    genericName="System Monitor";
    comment="resource monitor that shows usage and stats for processor, memory, disks, network and processes";
    icon="btop";
    exec="foot -e btop";
    terminal=false;
    categories=["System" "Monitor" "ConsoleOnly"];
  };
}