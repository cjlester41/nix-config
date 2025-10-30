from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
import subprocess, os, socket

sock = WayfireSocket()
wpe = WPE(sock)
    
def run_ipc(sock, wpe):  

    script_dir = os.path.dirname(os.path.abspath(__file__))
    host = socket.gethostname()

    if host == "NixOS-AOC":
        start_shader = "start-shaderbg-lite"
        kill_shader = "shaderbg"
    else:
        start_shader = "start-shaderbg" #"start-wayggle-bg"
        kill_shader = "shaderbg" #"wayggle-bg"

    blacklisted = [
        "egl_background",
        "waybar",
        "wf-dock",
        "shaderbg"
    ]

    while True:

        msg = sock.read_next_event()
        
        try:
            view = msg["view"]
            print(msg["event"] + ": " + view["app-id"])
        except:
            print(msg["event"])

        if "view-mapped" in msg["event"]:
            view = msg["view"]

            if "steam" in view["app-id"]: 
                try:
                    sock.set_workspace(0, 1, view["id"]) 
                except:
                    continue 
            
                if view["app-id"] == "steam":
                    try:
                        sock.set_view_fullscreen(view["id"], True)
                    except:
                        continue

            elif view["app-id"] not in blacklisted:            
                wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
            
        elif msg["event"] == "view-unmapped":
            view = msg["view"]

            if "steam_app" in view["app-id"]:
                id, running = view["app-id"], []
                views = sock.list_views(filter_mapped_toplevel=True)
                for view in views:
                    if id in view["app-id"]:
                        running.append(True)

                if True not in running:
                    subprocess.run([start_shader])

        elif msg["event"] == "view-fullscreen":
            view = msg["view"]

            if "steam_app" in view["app-id"] and view["fullscreen"] == True:
                subprocess.run(["pkill", "-9", kill_shader]) 

            elif view["app-id"] == "steam" and view["fullscreen"] == False:
                sock.set_view_fullscreen(view["id"], True)

if __name__ == "__main__":

    sock.watch()
    run_ipc(sock, wpe)