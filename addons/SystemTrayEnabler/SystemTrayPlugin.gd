@tool
extends EditorPlugin


func _enter_tree() -> void:
	var n = Node.new()
	n.set_script(load("res://addons/SystemTrayEnabler/SystemTray.gd"))
	Engine.register_singleton("SystemTray", n)
	print("System Tray registered")
	printerr("Set exename property in SystemTray.gd to your exported executable name.")
	printerr("Keep trayicon.png and TrayHandler.exe in the same directory as your exported executable.
	These are located in the neededFiles folder.")


func _exit_tree() -> void:
	Engine.unregister_singleton("SystemTray")
	print("System Tray unregistered")
