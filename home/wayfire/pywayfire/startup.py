from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
from wayfire.extra.stipc import Stipc
import os, time, subprocess, ipc

sock = WayfireSocket()
wpe = WPE(sock)
sock.watch()

sock._option_valuesset({'animate': {'squeezimize_duration': '0ms linear'}})
sock._option_valuesset({'animate': {'open_animation': 'none'}})
sock._option_valuesset({'expo': {'duration': '2000ms linear'}})

time.sleep(.3)

script_dir = os.path.dirname(os.path.abspath(__file__))

apps = [
    "firefox", 
    "code",   
    "kitty",
    "nemo",    
    ["foot", "-e", "btop"]
]

while True:
    views = sock.list_views(filter_mapped_toplevel=True)
    for view in views:
        if "ghostty" in view["app-id"]:
            wpe.pin_view(view["id"], "background", True)                    
            ghostty = True
            
    if ghostty:
        # time.sleep(.5)
        hyprlock = subprocess.Popen(["hyprlock"]) 
        break
        
# while True:
#     msg = sock.read_next_event()
#     if msg["event"] == "view-mapped":
#         view = msg["view"]
#         if view["app-id"] in {"egl_background", "shaderbg"}:          
#             break
 
subprocess.Popen(["wf-dock"])

while True:
    msg = sock.read_next_event()
    if msg["event"] == "view-mapped":
        view = msg["view"]
        if view["app-id"] in {"panel"}:
            # sock.set_view_always_on_top(view["id"], True)
            time.sleep(.2)
            break

for app in apps:

    subprocess.Popen(app)
    while True:
        msg = sock.read_next_event()

        if msg["event"] == "view-mapped":
            view = msg["view"]
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
            sock.set_view_alpha(view["id"], .85)
            # sock.set_view_minimized(view["id"], True)
            break   
time.sleep(1) # the fix ??????????????

views = sock.list_views(filter_mapped_toplevel=True)
for view in views:
    sock.set_view_minimized(view["id"], True)
    #     if view["minimized"] == "False":
    #         minimized.append(False)

    # if False not in minimized:
    #     time.sleep(.1); break  
     
time.sleep(.1)

sock._option_valuesset({'animate': {'squeezimize_duration': '3000ms linear'}})
sock._option_valuesset({'vswitch': {'duration': '0ms circle'}})

hyprlock.wait()

for view in views:

    if view["app-id"] == "firefox":
        sock.set_workspace(1,0, view["id"])
    elif view["app-id"] == "Code":
        sock.set_workspace(0,0, view["id"])
    elif view["title"] == "~":
        sock.set_workspace(0,1, view["id"])
    elif view["app-id"] == "nemo":
        sock.set_workspace(0,1, view["id"])
    elif view["app-id"] == "foot":
        sock.set_workspace(1,1, view["id"])

# subprocess.Popen(["waybar"])
# while True:
#     msg = sock.read_next_event()
#     if msg["event"] == "view-mapped":
#         view = msg["view"]
#         if view["app-id"] in {"waybar"}:
#             # sock.set_workspace(1,1)
#             time.sleep(.4)
#             # panel = view["id"]
#             # sock.set_view_always_on_top(view["id"], True)
#             break
# while True:
#     views = sock.list_views(filter_mapped_toplevel=True)
#     minimized = []
#     for view in views:    
#         if view["minimized"] == "True":
#             minimized.append(True)

#     if True not in minimized:
#         time.sleep(.3); break         

time.sleep(.3)
sock.toggle_expo()
subprocess.Popen(["waybar"])
time.sleep(3)
sock._option_valuesset({'animate': {'squeezimize_duration': '400ms linear'}})
sock._option_valuesset({'animate': {'open_animation': 'vortex'}})
sock._option_valuesset({'expo': {'duration': '300ms circle'}})
sock._option_valuesset({'vswitch': {'duration': '300ms circle'}})

subprocess.Popen(["steam", "-silent", "%U"])
sock.set_workspace(0,0)

# sock.set_view_always_on_top(panel, True)

ipc.run_ipc(sock=sock, wpe=wpe)