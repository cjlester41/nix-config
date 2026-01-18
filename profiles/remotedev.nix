{ pkgs, inputs, vars, ... }:

{
  environment.systemPackages = with pkgs; [

    nmap
    minicom
    rpi-imager 
    # arduino-ide
    # platformio

    (writeShellScriptBin "findpi" ''
        
      LOCAL_IP=$(ip route get 1.1.1.1 | grep -oP 'src \K\S+')
      BASE_PREFIX=$(echo $LOCAL_IP | cut -d. -f1-2)
      THIRD_OCTET=$(echo $LOCAL_IP | cut -d. -f3)
      NMAP_OPTS="-n -p 22,41041 --open --max-retries 0 -T4" # --max-rtt-timeout 500ms,  maybe increase timeout?
      
      for i in 0 -1 1 -2 2 -3 3
      do
        SCAN_OCTET=$((THIRD_OCTET + i))
        if [ $SCAN_OCTET -lt 0 ] || [ $SCAN_OCTET -gt 254 ]; then
          continue
        fi
    
        TARGET_SUBNET="$BASE_PREFIX.$SCAN_OCTET.0/24"
        echo "Scanning in $TARGET_SUBNET"
    
        IP=$(sudo nmap $NMAP_OPTS $TARGET_SUBNET | awk '/Nmap scan report for/{ip=$NF} /Raspberry Pi/{print ip}')
    
        if [ -n "$PI_IP" ]; then
          echo "Pi found at $IP"
          break 
        fi
      done
    '')
    ];
  
  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2341", ATTRS{idProduct}=="0070", MODE:="0666"
  '';
  
  # services.udev.packages = with pkgs; [ platformio-core.udev ];
  
}