from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
import os, time, subprocess, ipc

sock = WayfireSocket()
wpe = WPE(sock)
sock._option_valuesset({'animate': {'squeezimize_duration': '0ms linear'}})
sock._option_valuesset({'animate': {'open_animation': 'none'}})
sock._option_valuesset({'expo': {'duration': '0ms linear'}})
sock.watch()
time.sleep(1)



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
            # sock.set_workspace(1,1)
            # time.sleep(1.4)
            # panel = view["id"]
            # sock.set_view_always_on_top(view["id"], True)
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

# time.sleep(2)

# while True:
#     minimized = []
views = sock.list_views(filter_mapped_toplevel=True)
for view in views:
    sock.set_view_minimized(view["id"], True)
        # if view["minimized"] == "False":
        #     minimized.append(False)

    # if False not in minimized:
    #     time.sleep(.1); break   

hyprlock.wait()

sock._option_valuesset({'animate': {'squeezimize_duration': '3000ms linear'}})
sock._option_valuesset({'vswitch': {'duration': '0ms circle'}})


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

    time.sleep(.1)

time.sleep(.2)
sock.toggle_expo()
sock._option_valuesset({'animate': {'squeezimize_duration': '400ms linear'}})
sock._option_valuesset({'animate': {'open_animation': 'vortex'}})
sock._option_valuesset({'expo': {'duration': '300ms circle'}})
sock._option_valuesset({'vswitch': {'duration': '300ms circle'}})

subprocess.Popen(["steam", "-silent", "%U"])
time.sleep(3)
subprocess.Popen(["waybar"])
# sock.set_view_always_on_top(panel, True)

ipc.run_ipc(sock=sock, wpe=wpe)