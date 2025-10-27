from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
import time, subprocess, os, sys, socket

host = socket.gethostname()
sock = WayfireSocket()
wpe = WPE(sock)
sock.watch()

while True:
    msg = sock.read_next_event()
    
    try:
        view = msg["view"]
        # time.sleep(1)
        print(msg["event"] + ": " + view["app-id"])
    except:
        # time.sleep(1)
        print(msg["event"])

    # if msg["event"] == "view-mapped":
    #     view = msg["view"]

    #     if view["app-id"] == "kitty":            
    #         if host == "NixOS-AOC":
    #             subprocess.run(["pkill", "-9", "shaderbg"])
    #         else:
    #             subprocess.run(["pkill", "-9", "wayggle-bg"])
    #         sock.set_workspace(0, 1, view["id"])
    #         time.sleep(1)
    #         sock.set_view_fullscreen(view["id"], True)

    #     else:            
    #         wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
           
    # elif msg["event"] == "view-unmapped":
    #     view = msg["view"]

    #     if view["app-id"] == "kitty":
    #         if host == "NixOS-AOC":
    #             subprocess.run(["start-shaderbg"])
    #         else:
    #             subprocess.run(["start-wayggle-bg"])



