extends GutTest

# P3 port tests (pure logic, headless). See android-port/tasks/P3-first-apk.md.

const OUT_OF_SCOPE_MENU : Array[String] = [
	"File/New paint project (Experimental)",
	"File/Load material from website",
	"Help/User manual",
	"Help/Show selected library item documentation",
]
const KEPT_MENU : Array[String] = [
	"File/New material",
	"File/Load",
	"File/Save",
	"Help/Example projects",
]

func after_each():
	MMMobile.override_mobile = null

# Same rule as globals_menu_manager.gd create_menu() (not_in_ports vs OS name).
func _hidden_in_port(item : Dictionary, os_name : String) -> bool:
	return item.has("not_in_ports") and item.not_in_ports.find(os_name) != -1

func _menu_item(menu : Array, path : String) -> Dictionary:
	for item in menu:
		if item.menu == path:
			return item
	return {}

# --- paths ---

func test_mobile_resource_dir_is_existing_res_dir():
	MMMobile.override_mobile = true
	var d : String = MMPaths.get_resource_dir()
	assert_true(d.begins_with("res://"), "resource dir on mobile: " + d)
	assert_true(DirAccess.dir_exists_absolute(d), "exists: " + d)

func test_mobile_nodes_paths_are_res_or_user():
	MMMobile.override_mobile = true
	for p in MMPaths.get_nodes_paths():
		assert_true(p.begins_with("res://") or p.begins_with("user://"), "nodes path: " + p)
	assert_true(DirAccess.dir_exists_absolute(MMPaths.get_nodes_paths()[0]))

func test_mobile_mmg_dir_opens_mmg():
	MMMobile.override_mobile = true
	var d : String = MMPaths.get_mmg_dir()
	assert_eq(d, MMPaths.STD_GENDEF_PATH)
	assert_not_null(FileAccess.open(d + "/uniform.mmg", FileAccess.READ), "open uniform.mmg in " + d)

func test_desktop_resource_dir_unchanged():
	MMMobile.override_mobile = false
	assert_eq(MMPaths.get_resource_dir(), OS.get_executable_path().get_base_dir())

# --- menu filter ---

func test_menu_out_of_scope_hidden_on_android_kept_on_windows():
	var menu : Array = load("res://material_maker/main_window.gd").get_script_constant_map()["MENU"]
	for path in OUT_OF_SCOPE_MENU:
		var item : Dictionary = _menu_item(menu, path)
		assert_false(item.is_empty(), "menu item exists: " + path)
		assert_true(_hidden_in_port(item, "Android"), "hidden on Android: " + path)
		assert_false(_hidden_in_port(item, "Windows"), "kept on Windows: " + path)
	for path in KEPT_MENU:
		var item : Dictionary = _menu_item(menu, path)
		assert_false(item.is_empty(), "menu item exists: " + path)
		assert_false(_hidden_in_port(item, "Android"), "kept on Android: " + path)

# --- feature gating ---

func test_gating_mobile():
	MMMobile.override_mobile = true
	assert_true(MMMobile.is_mobile())
	assert_false(MMMobile.allow_undock(true), "no undock on mobile")
	assert_true(MMMobile.embed_subwindows(false), "embedded subwindows on mobile")
	assert_false(MMMobile.keep_window_state(), "no window state on mobile")

func test_gating_desktop_unchanged():
	MMMobile.override_mobile = false
	assert_false(MMMobile.is_mobile())
	assert_true(MMMobile.allow_undock(true))
	assert_false(MMMobile.allow_undock(false))
	assert_false(MMMobile.embed_subwindows(false))
	assert_true(MMMobile.embed_subwindows(true))
	assert_true(MMMobile.keep_window_state())

func test_project_embed_subwindows_mobile_override():
	var cfg := ConfigFile.new()
	assert_eq(cfg.load("res://project.godot"), OK)
	assert_eq(cfg.get_value("display", "window/subwindows/embed_subwindows", true), false, "desktop setting unchanged")
	assert_eq(cfg.get_value("display", "window/subwindows/embed_subwindows.mobile", false), true)

# --- export preset ---

func _android_preset(cfg : ConfigFile) -> String:
	for s in cfg.get_sections():
		if s.begins_with("preset.") and not s.ends_with(".options") and cfg.get_value(s, "platform", "") == "Android":
			return s
	return ""

func test_android_export_preset():
	var cfg := ConfigFile.new()
	assert_eq(cfg.load("res://export_presets.cfg"), OK)
	var s : String = _android_preset(cfg)
	assert_ne(s, "", "Android preset exists")
	if s == "":
		return
	var o : String = s + ".options"
	assert_eq(cfg.get_value(o, "architectures/arm64-v8a"), true)
	for a in [ "armeabi-v7a", "x86", "x86_64" ]:
		assert_eq(cfg.get_value(o, "architectures/" + a), false, "arch off: " + a)
	assert_eq(cfg.get_value(o, "package/unique_name"), "com.markdonchenko.materialmaker")
	assert_eq(cfg.get_value(o, "package/name"), "Material Maker")
	assert_eq(cfg.get_value(o, "version/name"), "1.8-android")
	var inc : PackedStringArray = str(cfg.get_value(s, "include_filter", "")).split(",")
	for f in [ "*.ptex", "material_maker/environments/hdris/*.hdr" ]:
		assert_has(inc, f, "include_filter has " + f)
	var exc : PackedStringArray = str(cfg.get_value(s, "exclude_filter", "")).split(",")
	for f in [ "addons/godotsteam/*", "addons/gut/*", "test/*" ]:
		assert_has(exc, f, "exclude_filter has " + f)
