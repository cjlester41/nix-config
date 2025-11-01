from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE

sock = WayfireSocket()
wpe = WPE(sock)
sock.watch()

views = sock.list_views(filter_mapped_toplevel=False)
print(views)

for view in views:
    if view["title"] != "nil":
        print(str(view["id"]) + ": " + view["app-id"] + ": " + view["title"])

while True:
    msg = sock.read_next_event()
    
    try:
        view = msg["view"]
        if view["title"] != "nil":
            print(msg["event"] + ": " + str(view["id"]) + ": " + view["app-id"] + ": " + view["title"])

    except:
        # print(msg["event"])
        continue

