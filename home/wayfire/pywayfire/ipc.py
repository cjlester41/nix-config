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
        start_shader = "start-shaderbg-lite" #"start-wayggle-bg"
        kill_shader = "shaderbg" #"wayggle-bg"

    game_apps = ["steam", "Wine"]
    blacklist = ["waybar", "wf-dock", "shaderbg"]

    while True:

        msg = sock.read_next_event()
        
        try:
            view = msg["view"]
            if (msg["event"] == "view-unmapped" or msg["event"] == "view-fullscreen") and view["title"] != "nil":
                print(msg["event"] + ": " + str(view["id"]) + ": " + view["app-id"] + ": " + view["title"])
        except:
            continue

        if "view-mapped" in msg["event"]:
            view = msg["view"]

            if view["app-id"] in game_apps:             
                sock.set_workspace(0, 1, view["id"]) 
                # sock.set_focus(view["id"])
                if "Steam" in view["title"]:
                    sock.assign_slot(view["id"], "slot_c")
                    sock._option_valuesset({'follow-focus': {'change_view': 'false'}})

            elif view["app-id"] not in blacklist:            
                wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
                sock.set_view_alpha(view["id"], .85)        

        elif msg["event"] == "view-fullscreen":
            view = msg["view"]

            if view["app-id"] in game_apps and view["fullscreen"] == True:
                subprocess.run(["pkill", "-9", kill_shader]) 

            elif view["fullscreen"] == True:
                sock.set_view_alpha(view["id"], 1)
                wpe.unset_view_shader(view["id"])

            elif view["fullscreen"] == False:
                sock.set_view_alpha(view["id"], .85)
                wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
        
        elif msg["event"] == "view-unmapped":
            view = msg["view"]

            if view["app-id"] in game_apps:
                id, running, shader = view["app-id"], [], kill_shader
                views = sock.list_views(filter_mapped_toplevel=True)
                for view in views:
                    if id in view["app-id"]:
                        running.append(True)
                    elif shader in view["app-id"]:
                        running.append(True)

                if True not in running:
                    subprocess.run([start_shader])
            
            elif "Steam" in view["title"]:
                sock._option_valuesset({'follow-focus': {'change_view': 'true'}})

if __name__ == "__main__":

    sock.watch()
    run_ipc(sock, wpe)