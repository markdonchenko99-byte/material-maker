@tool
class_name MMPaths

const WEBSITE_ADDRESS : String = "https://www.materialmaker.org"
#const WEBSITE_ADDRESS : String = "http://localhost:3000"

const STD_GENDEF_PATH = "res://addons/material_maker/nodes"

static func get_resource_dir() -> String:
	if Engine.is_editor_hint():
		return ProjectSettings.globalize_path("res://material_maker")
	if MMMobile.is_mobile():
		return "res://material_maker"
	return OS.get_executable_path().get_base_dir()

## Directory the add-node popup reads .mmg files from.
static func get_mmg_dir() -> String:
	var nodes_path : String = OS.get_executable_path().get_base_dir() + "/nodes"
	if OS.has_feature("editor") or MMMobile.is_mobile():
		nodes_path = STD_GENDEF_PATH
	return nodes_path

static func get_nodes_paths() -> Array:
	return [ STD_GENDEF_PATH, get_resource_dir()+"/nodes", "user://shared_nodes" ]
