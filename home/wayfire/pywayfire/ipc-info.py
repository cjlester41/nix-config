from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE

sock = WayfireSocket()
wpe = WPE(sock)
sock.watch()

views = sock.list_views(filter_mapped_toplevel=False)
print(views)

for view in views:
    print(str(view["id"]) + ": " + view["app-id"])

while True:
    msg = sock.read_next_event()
    
    try:
        view = msg["view"]
        print(msg["event"] + ": " + view["app-id"])

    except:
        print(msg["event"])

