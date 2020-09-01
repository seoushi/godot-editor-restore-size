tool
extends EditorPlugin

const SAVE_PATH = "user://editor_window_settings.cfg"

func _enter_tree():
	
	var config_file = ConfigFile.new()
	var error = config_file.load(SAVE_PATH);
	
	if error != OK:
		print("settings not found")
		return
		
	var maximized = config_file.get_value("main", "window-maximized")
	var size : Vector2 = config_file.get_value("main", "window-size")
	var position : Vector2 = config_file.get_value("main", "window-position")
	
	
	OS.set_window_maximized(maximized)
	OS.set_window_size(size)
	OS.set_window_position(position)


func _exit_tree():
	save()


func save():
	var config_file = ConfigFile.new()
	
	config_file.set_value("main", "window-size", OS.window_size)
	config_file.set_value("main", "window-position", OS.window_position)
	config_file.set_value("main", "window-maximized", OS.window_maximized)
	
	if config_file.save(SAVE_PATH) != OK:
		print("failed to save settings")
