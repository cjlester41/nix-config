from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
import time, subprocess, os, sys

sock = WayfireSocket()
wpe = WPE(sock)
sock.watch(['view-mapped'])
script_dir = os.path.dirname(os.path.abspath(__file__))

# output_data = sock.get_output(view["output-id"])
subprocess.Popen(["code"])
while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]

        if view["app-id"] == "Code":
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "rounded-corners.glsl"))
            # time.sleep(1)
            break      
    
time.sleep(.4)
subprocess.Popen(["kitty", "-e", "btop"])
while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]        

        if view["app-id"] == "kitty":
            sock.set_workspace(1, 1, view["id"])
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "rounded-corners.glsl"))
            time.sleep(1)
            break

subprocess.Popen(["kitty"])
while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]

        if view["app-id"] == "kitty":
            sock.set_workspace(0, 1, view["id"])
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "rounded-corners.glsl"))
            time.sleep(.1)
            break

subprocess.Popen(["nemo"])
# time.sleep(.7)
while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]

        if view["app-id"] == "nemo":
            sock.set_workspace(0, 1, view["id"])
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "rounded-corners.glsl"))
            time.sleep(1)
            break

subprocess.Popen(["firefox"]) #, "--new-window", "https://wiki.nixos.org/wiki/NixOS_Wiki"])
while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]

        if view["app-id"] == "firefox":
            sock.set_workspace(1, 0, view["id"])
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "rounded-corners.glsl"))
            # subprocess.Popen(["firefox", "--new-window", "www.github.com"])
            time.sleep(.5)
            break

sock.toggle_expo()

while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]
        wpe.set_view_shader(view["id"], os.path.join(script_dir, "rounded-corners.glsl"))
           

# quit()

