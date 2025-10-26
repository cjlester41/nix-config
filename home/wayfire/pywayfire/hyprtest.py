from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
import time, subprocess, os, sys, socket

host = socket.gethostname()
sock = WayfireSocket()
wpe = WPE(sock)
sock.watch()
script_dir = os.path.dirname(os.path.abspath(__file__))

# sock.toggle_expo()
# sock.set_workspace(0,0, 11)
sock.set_view_minimized(11, True)
# time.sleep(.1)
# sock.set_workspace(0,1, 26)
sock.set_view_minimized(26, True)
# time.sleep(.1)
# sock.set_workspace(1,0, 28)
sock.set_view_minimized(28, True)
# time.sleep(.1)
sock.set_workspace(0,1, 30)
sock.set_view_minimized(30, True)
# pist = sock.list_views(filter_mapped_toplevel=True)
# for index in range(len(pist)):
#     msg = pist[index]
#     id = msg["id"]
#     app = msg["app-id"]
#     print(str(id) + " " + str(app))
time.sleep(.4)
sock.toggle_expo()
time.sleep(3)
sock.toggle_expo()
time.sleep(3)

sock.set_workspace(0,0, 11)
# time.sleep(.3)
sock.set_workspace(0,1, 26)
# time.sleep(.3)
sock.set_workspace(1,0, 28)
# time.sleep(.3)
sock.set_workspace(0,1, 30)

time.sleep(.34)
sock.toggle_expo()
# time.sleep(5)
# sock.set_view_minimized(11, False)
# sock.set_view_minimized(26, False)
# sock.set_view_minimized(28, False)
# sock.set_view_minimized(30, False)
# time.sleep(.1)

time.sleep(2)


# for i in range(20):
#     try:
#         # sock.send_view_to_workspace(i, 1, 1)
#         # time.sleep(1)
#         # sock.toggle_expo()
#         # sock.toggle_expo()
#         sock.set_view_minimized(i, True)
#         sock.set_view_minimized(i, True)
#         sock.set_view_minimized(i, False)
#     except:
#         continue