from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
import time, subprocess, os, sys, socket

host = socket.gethostname()
sock = WayfireSocket()
wpe = WPE(sock)
sock.watch()
script_dir = os.path.dirname(os.path.abspath(__file__))


while True:
    msg = sock.read_next_event()
    print(msg["event"])

    if msg["event"] == "view-mapped":
        view = msg["view"]

        # if view["app-id"] == "kitty":            
        #     if host == "NixOS-AOC":
        #         subprocess.run(["pkill", "-9", "shaderbg"])
        #     else:
        #         subprocess.run(["pkill", "-9", "wayggle-bg"])
        #     sock.set_workspace(0, 1, view["id"])
        #     time.sleep(1)
        #     sock.set_view_fullscreen(view["id"], True)

        # else:            
        wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/roswirl.glsl"))
           
    # elif msg["event"] == "view-unmapped":
    #     view = msg["view"]

    #     if view["app-id"] == "kitty":
    #         if host == "NixOS-AOC":
    #             subprocess.run(["start-shaderbg"])
    #         else:
    #             subprocess.run(["start-wayggle-bg"])



