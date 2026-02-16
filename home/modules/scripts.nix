{ pkgs, vars, ... }:

{ 
  home.packages = with pkgs; [ 
    
    # (writeShellScriptBin "findpi" ''
    #   for x in {4..0}
    #   do
    #     echo "Scanning in:  192.168.10$x..."
    #     IP=$(sudo nmap -n -p 22,41041 --open -T4 192.168.10$x.0/24 | awk '/Nmap scan report for/{ip=$NF} /Raspberry Pi/{print ip}')
    #     if [ -n "$IP" ]; then
    #       echo "Pi found at:  $IP"
    #       break 
    #     fi
    #   done   
    # '')
    
    (writeShellScriptBin "restart-bg" ''
      pkill ghostty
      ghostty --custom-shader-animation=always --custom-shader=~/nix-config/files/shaders/${vars.shader} & disown
    '')
  
    (writeShellScriptBin "start-bg" ''
      pkill ghostty
      ghostty --custom-shader-animation=always --custom-shader=~/nix-config/files/shaders/smoke.glsl & disown
    '')
  
    (writeShellScriptBin "glitchy-bg" ''
      pkill ghostty
      ghostty --custom-shader-animation=always --custom-shader=~/nix-config/files/shaders/glitchy.glsl -e btop & disown
    '')
  
    # (writeShellScriptBin "start-shaderbg" ''
    #   MANGOHUD_CONFIG=fps_limit=24,no_display mangohud shaderbg -l background HDMI-A-1 ~/nix-config/files/shaders/sunset.glsl & disown
    # '')
  
    # (writeShellScriptBin "start-shaderbg-lite" ''
    #   shaderbg -l background -f 30 HDMI-A-1 ~/nix-config/files/shaders/planet.glsl & disown
    # '')
  
    (writeShellScriptBin "restart-ipc" ''
      pkill python
      python ~/nix-config/home/wayfire/pywayfire/ipc.py ${vars.alpha} ${vars.borders} >/dev/null 2>&1 &  
    '')
  
    (writeShellScriptBin "expo" ''
      python ~/nix-config/home/wayfire/pywayfire/expo.py >/dev/null 2>&1 &  
    '')
  
    (writeShellScriptBin "list-keybinds" ''
      notify-send "keybinds" "$(cat ~/nix-config/files/bindings.txt)"  
    '')
  
    (writeShellScriptBin "sphere" ''
      ~/shader-desk/run.sh start
    '')
    # xdg-user-dirs
  
  ];
}