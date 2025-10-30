from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
import os, time, subprocess, ipc

sock = WayfireSocket()
wpe = WPE(sock)
sock.watch()

script_dir = os.path.dirname(os.path.abspath(__file__))

apps = [
    "firefox", 
    "code",   
    "kitty",
    "nemo",    
    ["ghostty", "-e", "btop"]
]

while True:
    msg = sock.read_next_event()
    if msg["event"] == "view-mapped":
        view = msg["view"]
        if view["app-id"] in {"egl_background", "shaderbg"}:
            hyprlock = subprocess.Popen(["hyprlock"])            
            break

subprocess.Popen(["wf-dock"])

while True:
    msg = sock.read_next_event()
    if msg["event"] == "view-mapped":
        view = msg["view"]
        if view["app-id"] in {"panel"}:
            sock.set_workspace(1,1)
            time.sleep(.4)
            panel = view["id"]
            # sock.set_view_always_on_top(view["id"], True)
            break

sock._option_valuesset({'animate': {'squeezimize_duration': '0ms linear'}})
sock._option_valuesset({'animate': {'open_animation': 'none'}})

for app in apps:

    subprocess.Popen(app)
    while True:
        msg = sock.read_next_event()

        if msg["event"] == "view-mapped":
            view = msg["view"]
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
            sock.set_view_minimized(view["id"], True)
            break   

while True:
    minimized = []
    views = sock.list_views(filter_mapped_toplevel=True)
    for view in views:
        if view["minimized"] == "False":
            minimized.append(False)

    if False not in minimized:
        time.sleep(.1); break   

hyprlock.wait()

sock._option_valuesset({'animate': {'squeezimize_duration': '3000ms linear'}})
sock._option_valuesset({'animate': {'open_animation': 'vortex'}})
sock._option_valuesset({'vswitch': {'duration': '0ms circle'}})
sock._option_valuesset({'expo': {'duration': '0ms linear'}})

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

time.sleep(.05)
sock.toggle_expo()
sock._option_valuesset({'animate': {'squeezimize_duration': '400ms linear'}})
sock._option_valuesset({'animate': {'open_animation': 'vortex'}})
sock._option_valuesset({'expo': {'duration': '300ms circle'}})
sock._option_valuesset({'vswitch': {'duration': '300ms circle'}})

subprocess.Popen(["steam", "-silent", "%U"])
time.sleep(3)
subprocess.Popen(["waybar"])
# sock.set_view_always_on_top(panel, True)

# sock.close()
ipc.run_ipc(sock=sock, wpe=wpe)


#########################################################

# host = socket.gethostname()

# if host == "NixOS-AOC":
#     start_shader = "start-shaderbg"
#     kill_shader = "shaderbg"
# else:
#     start_shader = "start-wayggle-bg"
#     kill_shader = "wayggle-bg"

# blacklisted = [
#     "egl_background",
#     "waybar",
#     "wf-dock",
#     "shaderbg"
# ]

# while True:

#     msg = sock.read_next_event()
    
#     try:
#         view = msg["view"]
#         print(msg["event"] + ": " + view["app-id"])
#     except:
#         print(msg["event"])

#     if "view-mapped" in msg["event"]:
#         view = msg["view"]

#         if "steam" in view["app-id"]: 
#             try:
#                 sock.set_workspace(0, 1, view["id"]) 
#             except:
#                 continue 
        
#             if view["app-id"] == "steam":
#                 try:
#                     sock.set_view_fullscreen(view["id"], True)
#                 except:
#                     continue

#         elif view["app-id"] not in blacklisted:            
#             wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
           
#     elif msg["event"] == "view-unmapped":
#         view = msg["view"]

#         if "steam_app" in view["app-id"]:
#             id, running = view["app-id"], []
#             views = sock.list_views(filter_mapped_toplevel=True)
#             for view in views:
#                 if id in view["app-id"]:
#                     running.append(True)

#             if True not in running:
#                 subprocess.run([start_shader])

#     elif msg["event"] == "view-fullscreen":
#         view = msg["view"]

#         if "steam_app" in view["app-id"] and view["fullscreen"] == True:
#             subprocess.run(["pkill", "-9", kill_shader]) 

#         elif view["app-id"] == "steam" and view["fullscreen"] == False:
#             sock.set_view_fullscreen(view["id"], True)