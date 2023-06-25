extends Node

## Name of your exported executable
var exename: String = "CodeGame.exe" # Include .exe in name
## Window title to control the right application from tray
@onready var apptitle: String = get_window().title
## Organized data to save for use in the system tray
var arguments: String
## Path to your application location
var path = OS.get_executable_path().get_base_dir()


func _ready() -> void:
	arguments = "%s,%s" %[exename,apptitle]
	passData()
	launchSystemTray()


## If a windows export, exename, apptitle, and trayicon will be stored for the system tray
func passData() -> void:
	if OS.has_feature("release") and OS.has_feature("windows"):
		var file = FileAccess.open(path.path_join("data.txt"), FileAccess.WRITE)
		file.store_line(arguments)


## Launches the system tray functionality
func launchSystemTray() -> void:
	if OS.has_feature("release") and OS.has_feature("windows"):
		var SystemTrayLauncher = path.path_join("TrayHandler.exe")
		OS.shell_open(SystemTrayLauncher)

