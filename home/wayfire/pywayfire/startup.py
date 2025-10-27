from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
import os, time, subprocess, socket

sock = WayfireSocket()
wpe = WPE(sock)
sock.watch(['view-mapped'])

script_dir = os.path.dirname(os.path.abspath(__file__))

apps = [
    ["ghostty", "-e", "btop"],
    "firefox",  
    # ["firefox", "--private-window"],      
    "kitty",
    "nemo",
    "code"
]

while True:
    msg = sock.read_next_event()
    if "event" in msg:
        view = msg["view"]
        if view["app-id"] in {"egl_background", "shaderbg"}:
            hyprlock = subprocess.Popen(["hyprlock"])
            break

subprocess.Popen(["wf-dock"])
sock.read_next_event()

sock._option_valuesset({'animate': {'squeezimize_duration': '1ms linear'}})

for app in apps:

    subprocess.Popen(app)
    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]
        wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
        sock.set_view_minimized(view["id"], True)

sock._option_valuesset({'animate': {'squeezimize_duration': '4000ms linear'}})
hyprlock.wait()

views = sock.list_views(filter_mapped_toplevel=True)

for view in views:

    if view["app-id"] == "firefox":
        sock.set_workspace(1,0, view["id"])
    elif view["app-id"] == "Code":
        sock.set_workspace(0,0, view["id"])
    elif view["app-id"] == "kitty":
        sock.set_workspace(0,1, view["id"])
    elif view["app-id"] == "nemo":
        sock.set_workspace(0,1, view["id"])
    elif view["app-id"] == "com.mitchellh.ghostty":
        sock.set_workspace(1,1, view["id"])

time.sleep(.34)
sock.toggle_expo()

sock._option_valuesset({'animate': {'squeezimize_duration': '400ms linear'}})
subprocess.Popen(["waybar"])

#########################################################

host = socket.gethostname()

if host == "NixOS-AOC":
    start_shader = "start-shaderbg"
    kill_shader = "shaderbg"
else:
    start_shader = "start-wayggle-bg"
    kill_shader = "wayggle-bg"

blacklisted = [
    "egl_background",
    "waybar",
    "wf-dock",
    "shaderbg"
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