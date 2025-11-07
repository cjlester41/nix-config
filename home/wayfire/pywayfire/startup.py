from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
import os, time, subprocess, ipc, socket

sock = WayfireSocket()
wpe = WPE(sock)
sock.watch()

script_dir = os.path.dirname(os.path.abspath(__file__))
alpha = .8

if socket.gethostname() == "NixOS-AOC":
    delay = 3
else:
    delay = 2

while True:
    msg = sock.read_next_event()
    if msg["event"] == "view-mapped":
        view = msg["view"]
        if "ghostty" in view["app-id"]:
            wpe.pin_view(view["id"], "background", True) 
            time.sleep(.2)
            hyprlock = subprocess.Popen(["hyprlock"]) 
            break

sock._option_valuesset({'animate': {'squeezimize_duration': '0ms linear'}})
sock._option_valuesset({'animate': {'open_animation': 'none'}})
sock._option_valuesset({'expo': {'duration': '2000ms linear'}})

apps = ["firefox", "kitty", "code", "nemo", ["foot", "-e", "btop"]]
 
subprocess.Popen(["wf-dock"])

while True:
    msg = sock.read_next_event()
    if msg["event"] == "view-mapped":
        view = msg["view"]
        if view["app-id"] in {"panel"}:
            sock.set_view_alpha(view["id"], alpha)            
            break

for app in apps:
    subprocess.Popen(app)

    while True:
        msg = sock.read_next_event()

        if msg["event"] == "view-mapped":
            view = msg["view"]
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
            sock.set_view_alpha(view["id"], alpha)
            if view["app-id"] == "Code":
                time.sleep(.1)
            sock.set_view_minimized(view["id"], True)
            break   

sock._option_valuesset({'animate': {'squeezimize_duration': '3000ms linear'}})
sock._option_valuesset({'vswitch': {'duration': '0ms circle'}})

time.sleep(delay) 
hyprlock.wait()

views = sock.list_views(filter_mapped_toplevel=True)

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

time.sleep(.2)
sock.toggle_expo()

subprocess.Popen(["waybar"])
while True:
    msg = sock.read_next_event()
    if msg["event"] == "view-mapped":
        view = msg["view"]
        if view["app-id"] == "waybar":
            sock.set_view_alpha(view["id"], alpha)
            break

if socket.gethostname() != "NixOS-AOC":
    subprocess.Popen(["steam", "-silent", "%U"])

time.sleep(3)

sock._option_valuesset({'animate': {'squeezimize_duration': '400ms linear'}})
sock._option_valuesset({'animate': {'open_animation': 'vortex'}})
sock._option_valuesset({'expo': {'duration': '300ms circle'}})
sock._option_valuesset({'vswitch': {'duration': '300ms circle'}})

ipc.run_ipc(sock=sock, wpe=wpe)