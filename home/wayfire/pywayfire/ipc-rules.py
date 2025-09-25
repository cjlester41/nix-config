from wayfire import WayfireSocket
import time, subprocess

sock = WayfireSocket()
sock.watch(['view-mapped'])

# output_data = sock.get_output(view["output-id"])
# subprocess.Popen(["kitty"])
# while True:

#     msg = sock.read_next_event()

#     if "event" in msg:
#         view = msg["view"]

#         if view["app-id"] == "code":
#             sock.set_workspace(0, 1, view["id"])  
#             time.sleep(1)
#             break      
    
time.sleep(1.4)
subprocess.Popen(["kitty", "-e", "btop"])
while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]

        if view["app-id"] == "kitty":
            sock.set_workspace(1, 1, view["id"])
            time.sleep(1)
            break

subprocess.Popen(["kitty"])
while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]

        if view["app-id"] == "kitty":
            sock.set_workspace(0, 1, view["id"])
            time.sleep(.2)
            break

subprocess.Popen(["nemo"])
time.sleep(.7)
# while True:

#     msg = sock.read_next_event()

#     if "event" in msg:
#         view = msg["view"]

#         if view["app-id"] == "nemo":
#             sock.set_workspace(0, 1, view["id"])
#             time.sleep(1)
#             break

subprocess.Popen(["firefox", "--new-window", "https://wiki.nixos.org/wiki/NixOS_Wiki"])
while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]

        if view["app-id"] == "firefox":
            sock.set_workspace(1, 0, view["id"])
            subprocess.Popen(["firefox", "--new-window", "www.github.com"])
            time.sleep(.5)
            break

sock.toggle_expo()
quit()

