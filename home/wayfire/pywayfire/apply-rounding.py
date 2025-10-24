from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
import time, subprocess, os, sys

sock = WayfireSocket()
wpe = WPE(sock)
sock.watch(['view-mapped'])
script_dir = os.path.dirname(os.path.abspath(__file__))


while True:

    msg = sock.read_next_event()
    # event = sock.read_message()
    # print(event)

    if "event" in msg:
        view = msg["view"]
        print(view["app-id"])
        if view["app-id"] == "gamescope":
            sock.set_view_fullscreen(view["id"], True)
            subprocess.run(["pkill", "-9", "-f", "wayggle-bg"])            
        else:
            
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "rounded-corners.glsl"))
           

# quit()

