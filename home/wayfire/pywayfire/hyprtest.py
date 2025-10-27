from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
import time, subprocess, os, sys, socket, datetime

sock = WayfireSocket()
wpe = WPE(sock)
sock.watch()

script_dir = os.path.dirname(os.path.abspath(__file__))
views = sock.list_views(filter_mapped_toplevel=True)
host = socket.gethostname()

if host == "NixOS-AOC":
    start_shader = "start-shaderbg"
    kill_shader = "shaderbg"
else:
    start_shader = "start-wayggle-bg"
    kill_shader = "wayggle-bg"

# for view in views:
#     print(str(view["id"]) + " " + str(view["app-id"]))
#     sock.set_view_minimized(view["id"], True)

time.sleep(3)

for view in views:

    if view["app-id"] == "firefox":
        sock.set_workspace(1,0, view["id"])
    elif view["app-id"] == "Code":
        sock.set_workspace(0,0, view["id"])
    elif view["app-id"] == "kitty":
        sock.set_workspace(1,1, view["id"])
    elif view["app-id"] == "nemo":
        sock.set_workspace(0,1, view["id"])

time.sleep(.4)
sock.toggle_expo()

blacklisted = [
    "egl_background",
    "waybar",
    "wf-dock"
]
game = "steam_app"
running = "0"

while True:

    msg = sock.read_next_event()
    # print(datetime.datetime.now())
    # try:
    #     view = msg["view"]
    #     print(msg["event"] + ": " + view["app-id"])
    # except:
    #     print(msg["event"])

    if msg["event"] == "view-mapped":
        view = msg["view"]
        try:
            print(msg["event"] + ": " + view["app-id"])
        except:
            print(msg["event"])

        if game in view["app-id"]: # and running != view["app-id"]: 
            try:     
                # subprocess.run(["pkill", "-9", kill_shader]) 
                running = view["app-id"]
                # print(running)
                sock.set_workspace(0, 1, view["id"])   
                time.sleep(1)
                sock.set_view_fullscreen(view["id"], True)
            except:
                continue
        
        elif view["app-id"] == "steam":
            try:
                sock.set_workspace(0, 1, view["id"], )   
                time.sleep(1)
                sock.set_view_fullscreen(view["id"], True)
            except:
                continue

        elif view["app-id"] not in blacklisted:            
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
           
    elif msg["event"] == "view-unmapped":
        view = msg["view"]

        try:
            print(msg["event"] + ": " + view["app-id"])
        except:
            print(msg["event"])

        if game in view["app-id"]:
            if running != view["app-id"]:
            # views = sock.list_views(filter_mapped_toplevel=True)
                running = view["app-id"]
            # print(running)
            # for view in views:
            #     if view["app-id"] == "egl_background":
            #         break
        #     #     else:
        #     time.sleep(3)
            subprocess.run([start_shader])

    elif msg["event"] == "view-geometry-changed":
        view = msg["view"]

        if "steam" in view["app-id"]:
            sock.set_view_fullscreen(view["id"], True)