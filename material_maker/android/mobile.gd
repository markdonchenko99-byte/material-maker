class_name MMMobile
extends RefCounted

## Mobile (Android) overlay helper, ADR 0001. Upstream hooks call these
## functions; on desktop every function returns the upstream behaviour.

## Test injection: null = use the real OS, true/false = force mobile/desktop.
static var override_mobile = null

static func is_mobile() -> bool:
	if override_mobile != null:
		return override_mobile
	return OS.has_feature("mobile")

## Upstream `allow_undock` value -> value to use.
static func allow_undock(upstream : bool) -> bool:
	return false if is_mobile() else upstream

## Upstream `gui_embed_subwindows` value -> value to use.
static func embed_subwindows(upstream : bool) -> bool:
	return true if is_mobile() else upstream

## Whether the main window saves/restores its size, position and screen.
static func keep_window_state() -> bool:
	return not is_mobile()

## Called at the start of main_window._ready(), before panels are loaded.
static func setup_main_window(main_window : Control) -> void:
	if not is_mobile():
		return
	var window : Window = main_window.get_window()
	window.gui_embed_subwindows = embed_subwindows(window.gui_embed_subwindows)
	var flexible_layout = main_window.get_node("VBoxContainer/Layout/FlexibleLayout")
	flexible_layout.allow_undock = allow_undock(flexible_layout.allow_undock)
	main_window.get_share_button().visible = false
	print("MMMobile: embed_subwindows=%s allow_undock=%s window=%s" % [ window.gui_embed_subwindows, flexible_layout.allow_undock, window.size ])

## Help/Example projects on mobile: pick a packed example from res://.
static func open_examples(main_window : Control) -> void:
	var dialog = preload("res://material_maker/windows/file_dialog/file_dialog.tscn").instantiate()
	dialog.min_size = Vector2(500, 500)
	dialog.access = FileDialog.ACCESS_RESOURCES
	dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILES
	dialog.add_filter("*.ptex;Procedural Textures File")
	dialog.current_dir = "res://material_maker/examples"
	var files = await dialog.select_files()
	if files.size() > 0:
		main_window.do_load_projects(files)
