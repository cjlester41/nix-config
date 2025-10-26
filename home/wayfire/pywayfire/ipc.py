from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
import time, subprocess, os, sys, socket

host = socket.gethostname()
sock = WayfireSocket()
wpe = WPE(sock)
sock.watch(['view-mapped'])

script_dir = os.path.dirname(os.path.abspath(__file__))

subprocess.Popen(["firefox"]) #, "--new-window", "https://wiki.nixos.org/wiki/NixOS_Wiki"])
while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]

        if view["app-id"] == "firefox":
            sock.set_workspace(1, 0, view["id"])
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
            sock.set_view_minimized(view["id"], True)
            break

subprocess.Popen(["code"])
while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]

        if view["app-id"] == "Code":
            sock.set_workspace(0, 0, view["id"])
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
            sock.set_view_minimized(view["id"], True)
            break

subprocess.Popen(["kitty", "-e", "btop"])
while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]        

        if view["app-id"] == "kitty":
            sock.set_workspace(1, 1, view["id"])
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
            sock.set_view_minimized(view["id"], True)
            break

subprocess.Popen(["kitty"])
while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]

        if view["app-id"] == "kitty":
            sock.set_workspace(0, 1, view["id"])
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
            sock.set_view_minimized(view["id"], True)
            break

subprocess.Popen(["nemo"])
while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]

        if view["app-id"] == "nemo":
            sock.set_workspace(0, 1, view["id"])
            wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
            sock.set_view_minimized(view["id"], True)
            break



# sock.toggle_expo()

# while True:
#     msg = sock.read_next_event()
#     print(msg["event"])

#     if msg["event"] == "view-mapped":
#         view = msg["view"]

#         if view["app-id"] == "gamescope":            
#             if host == "NixOS-AOC":
#                 subprocess.run(["pkill", "-9", "shaderbg"])
#             else:
#                 subprocess.run(["pkill", "-9", "wayggle-bg"])
#             sock.set_workspace(0, 1, view["id"])
#             time.sleep(1)
#             sock.set_view_fullscreen(view["id"], True)

#         else:            
#             wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
           
#     elif msg["event"] == "view-unmapped":
#         view = msg["view"]

#         if view["app-id"] == "gamescope":
#             if host == "NixOS-AOC":
#                 subprocess.run(["start-shaderbg"])
#             else:
#                 subprocess.run(["start-wayggle-bg"])

