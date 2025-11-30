import os, time, subprocess, ipc, socket
from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE

sock = WayfireSocket()
wpe = WPE(sock)
sock.watch()

script_dir = os.path.dirname(os.path.abspath(__file__))
hostnm = socket.gethostname()

if hostnm == "NixOS-AOC":
    alpha = .9
else:
    alpha = .8

while True:
    msg = sock.read_next_event()
    if msg["event"] == "view-mapped" and msg["view"]["title"] == "Ghostty":
        bgid = msg["view"]["id"]
        wpe.pin_view(bgid, "background", True) 
        break

sock._option_valuesset({'animate': {'squeezimize_duration': '0ms linear'}})
sock._option_valuesset({'animate': {'open_animation': 'none'}})
sock._option_valuesset({'expo': {'duration': '2000ms linear'}})

apps = ["firefox", "kitty", "code", "nemo", ["foot", "-e", "btop"]]
 
subprocess.Popen(["wf-dock"])

while True:
    msg = sock.read_next_event()
    if msg["event"] == "view-mapped" and msg["view"]["app-id"] in {"panel"}:
        sock.set_view_alpha(msg["view"]["id"], alpha)            
        break

for app in apps:
    subprocess.Popen(app)

    while True:
        msg = sock.read_next_event()

        if msg["event"] == "view-mapped":
            sock.set_view_alpha(msg["view"]["id"], 0)
            wpe.set_view_shader(msg["view"]["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
            
            if msg["view"]["app-id"] == "Code":
                time.sleep(.1)
            sock.set_view_minimized(msg["view"]["id"], True)
            break   

sock._option_valuesset({'animate': {'squeezimize_duration': '3000ms linear'}})
sock._option_valuesset({'vswitch': {'duration': '0ms circle'}})

while True:

    try:
        subprocess.check_output(["pgrep", "hyprlock"])
        time.sleep(.1)
    except subprocess.CalledProcessError:
        break

views = sock.list_views(filter_mapped_toplevel=True)

for view in views:
    
    sock.set_view_alpha(view["id"], alpha)

    if view["app-id"] == "firefox":
        sock.set_workspace(1,0, view["id"])
    elif view["app-id"] == "Code":
        sock.set_workspace(0,0, view["id"])
    elif view["app-id"] == "kitty":
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
    if msg["event"] == "view-mapped" and msg["view"]["app-id"] == "waybar":
        sock.set_view_alpha(view["id"], alpha)
        break

if hostnm == "NixOS-AOC":
    for i in range(20):
        sock.set_view_alpha(bgid, (1 - i * .05))
        time.sleep(.1)
    subprocess.run(["pkill", "ghostty"])

else:
    subprocess.Popen(["steam", "-silent", "%U"])

time.sleep(3)

subprocess.Popen(["blueman-applet"])

sock._option_valuesset({'animate': {'squeezimize_duration': '400ms linear'}})
sock._option_valuesset({'animate': {'open_animation': 'vortex'}})
sock._option_valuesset({'expo': {'duration': '300ms circle'}})
sock._option_valuesset({'vswitch': {'duration': '300ms circle'}})

ipc.run_ipc(sock=sock, wpe=wpe)