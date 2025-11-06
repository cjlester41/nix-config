from wayfire import WayfireSocket
from wayfire.extra.wpe import WPE
import subprocess, os

sock = WayfireSocket()
wpe = WPE(sock)
    
def run_ipc(sock, wpe):  

    script_dir = os.path.dirname(os.path.abspath(__file__))
    launchers = {"EA"}  

    while True:

        msg = sock.read_next_event()

        if (msg["event"] in {"view-mapped", "view-unmapped", "view-fullscreen"}) and msg["view"]["title"] != "nil":
            print(msg["event"] + ": " + str(msg["view"]["id"]) + ": " + msg["view"]["app-id"] + ": " + msg["view"]["title"])

        if "view-mapped" in msg["event"]:
            view = msg["view"]

            if "Ghostty" in view["title"]:
                wpe.pin_view(view["id"], "background", True) 

            elif "Steam" in view["title"]:
                sock.set_workspace(0, 1, view["id"]) 
                sock.assign_slot(view["id"], "slot_c")

            elif "steam_app" in view["app-id"]:             
                try:
                    sock.set_workspace(0, 1, view["id"]) 
                    sock._option_valuesset({'follow-focus': {'change_view': 'false'}})
                    if view["geometry"]["x"] == 0 and view["title"] not in launchers:
                        subprocess.run(["pkill", "ghostty"]) 
                except: subprocess.run(["pkill", "ghostty"]) 

            elif view["type"] == "toplevel":            
                wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
                sock.set_view_alpha(view["id"], .85)        

        elif msg["event"] == "view-fullscreen":

            if msg["view"]["fullscreen"] == True:
                if "steam_app" in view["app-id"] and msg["view"]["title"] not in launchers: 
                    subprocess.run(["pkill", "ghostty"]) 
                try:
                    sock.set_view_alpha(view["id"], 1)
                    wpe.unset_view_shader(view["id"])
                except: continue

            elif msg["view"]["fullscreen"] == False:
                sock.set_view_alpha(view["id"], .85)
                wpe.set_view_shader(view["id"], os.path.join(script_dir, "wayfire/rounded-corners.glsl"))
        
        elif msg["event"] == "view-unmapped" and "steam_app" in msg["view"]["app-id"]:            

            if msg["view"]["fullscreen"] == True and msg["view"]["title"] not in launchers:
                subprocess.run(["start-shader"])                            
                sock._option_valuesset({'follow-focus': {'change_view': 'true'}})

if __name__ == "__main__":

    sock.watch()
    run_ipc(sock, wpe)