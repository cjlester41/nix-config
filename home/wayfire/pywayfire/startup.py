import os
import time
import subprocess
import ipc
import socket
import sys
from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE

sock = WayfireSocket()
wpe = WPE(sock)
sock.watch()

script_dir = os.path.dirname(os.path.abspath(__file__))
hostnm = socket.gethostname()

alpha = float(sys.argv[1])
grid = int(sys.argv[2])
editor = sys.argv[3]
border = sys.argv[4]

if editor == "zeditor":
    editor_id = "dev.zed.Zed"
else:
    editor_id = "code"

while True:
    msg = sock.read_next_event()
    if msg["event"] == "view-mapped" and msg["view"]["title"] == "Ghostty":
        bgid = msg["view"]["id"]
        wpe.pin_view(bgid, "overlay", True) 
        break

sock._option_valuesset({'animate': {'squeezimize_duration': '0ms linear'}})
sock._option_valuesset({'animate': {'open_animation': 'none'}})
sock._option_valuesset({'expo': {'duration': '2000ms linear'}})

apps = ["firefox", "kitty", editor, "nemo", ["kitty", "-e", "btop"]]
if grid == 3:
   apps.insert(2, ["kitty", "-e", "vim"]) 
   apps.remove("nemo")
   
subprocess.Popen(["wf-dock"])

while True:
    msg = sock.read_next_event()
    if msg["event"] == "view-mapped" and msg["view"]["app-id"] in {"panel"}:
        sock.set_view_alpha(msg["view"]["id"], 0)            
        break

for app in apps:
    subprocess.Popen(app)

    while True:
        msg = sock.read_next_event()

        if msg["event"] == "view-mapped":
            # sock.set_view_alpha(msg["view"]["id"], 0)
            if border == "True":
                wpe.set_view_shader(msg["view"]["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
            # print(msg["view"]["id"], msg["view"]["app-id"])
            sock.set_view_minimized(msg["view"]["id"], True)
            
            # if "Code" in msg["view"]["app-id"]:
            #     time.sleep(.2)
            # if "nemo" in msg["view"]["app-id"]:
            #     time.sleep(.3)
            # sock.set_view_minimized(msg["view"]["id"], True)
            break   

time.sleep(.5)
views = sock.list_views(filter_mapped_toplevel=True)
for view in views:
    sock.set_view_minimized(view["id"], True)
    if border == "True":
        wpe.set_view_shader(msg["view"]["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
    
wpe.pin_view(bgid, "background", True) 
time.sleep(.5)

sock._option_valuesset({'animate': {'squeezimize_duration': '3000ms linear'}})
sock._option_valuesset({'vswitch': {'duration': '0ms circle'}})

while True:

    try:
        subprocess.check_output(["pgrep", "hyprlock"])
        time.sleep(.1)
    except subprocess.CalledProcessError:
        break

views = sock.list_views(filter_mapped_toplevel=True)
if grid == 2:
    for view in views:
        
        sock.set_view_alpha(view["id"], alpha)
    
        if view["app-id"] == "firefox":
            sock.set_workspace(1,0, view["id"])
        elif view["app-id"] == editor_id: 
            sock.set_workspace(0,0, view["id"])
        elif view["title"] == "~":
            sock.set_workspace(0,1, view["id"])
        elif view["app-id"] == "nemo":
            sock.set_workspace(0,1, view["id"])
        elif view["title"] == "btop":
            sock.set_workspace(1,1, view["id"]) 

if grid == 3: # add views if not already open
    e_count = 0
    b_count = 0
    t_count = 0
    for view in views:
        sock.set_view_alpha(view["id"], alpha)
        if view["app-id"] == editor_id:
            sock.set_workspace(0,e_count, view["id"])
            e_count += 1
        if view["app-id"] == "firefox": 
            sock.set_workspace(1,b_count, view["id"])
            b_count += 1
        if view["app-id"] == "kitty":
            sock.set_workspace(2,t_count, view["id"])
            t_count += 1
        # elif view["app-id"] == "nemo":
        #     sock.set_workspace(0,1, view["id"])
        # elif view["title"] == "btop":
        #     sock.set_workspace(1,1, view["id"]) 

time.sleep(.2)
sock.toggle_expo()

subprocess.run(["pkill", "wf-dock"])
subprocess.Popen("wf-panel")
while True:
    msg = sock.read_next_event()
    if msg["event"] == "view-mapped" and msg["view"]["app-id"] in {"panel"}:
        sock.set_view_alpha(msg["view"]["id"], alpha)            
        break
# subprocess.popen(["waybar"])
# while true:
#     msg = sock.read_next_event()
#     if msg["event"] == "view-mapped" and msg["view"]["app-id"] == "waybar":
#         sock.set_view_alpha(view["id"], alpha)
#         break

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

ipc.run_ipc(sock=sock, wpe=wpe, alpha=alpha, border=border)