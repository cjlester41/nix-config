import os
import json
from wayfire import WayfireSocket

# Connect to the Wayfire IPC socket
try:
    socket = WayfireSocket(os.environ.get('WAYFIRE_SOCKET'))
except Exception as e:
    print(f"Error: Failed to connect to Wayfire socket. Is the 'ipc' plugin enabled? {e}")
    exit(1)

# Get the initial list of open windows (views)
def get_open_views():
    views_json = socket.list_views()
    return views_json #{view['title']: view['id'] for view in json.loads(views_json)['views']}

print("Monitoring for closed applications. Press Ctrl+C to exit.")
print(get_open_views())

try:
    # Get the initial state of open applications
    previous_views = get_open_views()
    print("Initial open applications:", list(previous_views.keys()))

    while True:
        # Get the current list of views
        current_views = get_open_views()

        # Compare the current and previous lists
        closed_views = previous_views.keys() - current_views.keys()

        if closed_views:
            for title in closed_views:
                print(f"\n--- Detected closed application: '{title}' ---")
            print("Current open applications:", list(current_views.keys()))

        # Update the list for the next iteration
        previous_views = current_views
        
except KeyboardInterrupt:
    print("\nMonitoring stopped.")
except Exception as e:
    print(f"An error occurred: {e}")
