from wayfire import WayfireSocket
import time

sock = WayfireSocket()
sock.watch(['view-mapped'])

# time.sleep(1)

sock.toggle_expo()

while True:
    msg = sock.read_next_event()
    if "event" in msg:
        view = msg["view"]
        if view["app-id"] == "kitty":
            output_data = sock.get_output(view["output-id"])
            print(output_data)
            workarea = output_data["workarea"]

            # We want gedit to take a certain position (200,200) and a quarter of the output
            # x = 200
            # y = 200
            # w = workarea['width'] // 2
            # h = workarea['height'] // 2

            # sock.configure_view(view["id"], x, y, w, h)
            # sock.assign_slot(view["id"], "slot_br")
            # sock.set_view_always_on_top(view["id"], True)
            sock.set_view_alpha(view["id"], 1.0)
