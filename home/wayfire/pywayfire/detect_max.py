import wayfire.ipc as wf

def is_maximized(view):
    """
    Checks if a view's state indicates it is maximized.
    """
    # The 'configure' field contains geometry information.
    # A view is maximized if its size matches the screen geometry.
    # Note: A simple 'maximized' flag does not exist, so we check the dimensions.
    # This example is a robust check, but requires screen geometry.
    # A simpler approach is to get the `view_state` from ipc-rules.
    if 'geometry' in view and 'output' in view:
        # Get the output geometry to compare
        output_info = wf.get_output_info(view['output'])
        if output_info and 'geometry' in output_info:
            view_geom = view['geometry']
            output_geom = output_info['geometry']
            
            return (view_geom['x'] == output_geom['x'] and
                    view_geom['y'] == output_geom['y'] and
                    view_geom['width'] == output_geom['width'] and
                    view_geom['height'] == output_geom['height'])
    return False

try:
    socket = wf.WayfireSocket()
    # Get a list of all active views (windows)
    views = socket.list_views()

    found_maximized = False
    for view in views:
        # The `get_view_state` command is more direct for checking state
        view_state = socket.get_view_state(view['id'])
        if view_state and view_state.get('maximized'):
            print(f"Maximized window detected: {view['title']} (app_id: {view['app_id']})")
            found_maximized = True
    
    if not found_maximized:
        print("No maximized windows found.")

except Exception as e:
    print(f"Error: {e}")
    print("Ensure the Wayfire 'ipc' plugin is enabled and the WayfireSocket is running.")
