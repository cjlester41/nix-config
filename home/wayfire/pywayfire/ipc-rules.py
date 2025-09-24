from wayfire import WayfireSocket
import time, subprocess

sock = WayfireSocket()
sock.watch(['view-mapped'])

# output_data = sock.get_output(view["output-id"])
# subprocess.Popen(["kitty"])

while True:

    msg = sock.read_next_event()

    if "event" in msg:
        view = msg["view"]

        if view["app-id"] == "code":
            sock.set_workspace(0, 0, view["id"])        

        if view["app-id"] == "kitty":
            sock.set_workspace(0, 1, view["id"])

        if view["app-id"] == "nemo":
            sock.set_workspace(1, 1, view["id"])

        if view["app-id"] == "firefox":
            sock.set_workspace(1, 0, view["id"])

            time.sleep(1)
            sock.toggle_expo()
