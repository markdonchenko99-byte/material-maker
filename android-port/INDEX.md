# Index — where things are

Format: `path` — purpose. `[planned: Px]` = not created yet. Keep current (AGENTS rule 9).

## Agent docs
- `AGENTS.md` — rules for agents (entry point)
- `CLAUDE.md` — imports AGENTS.md for Claude Code
- `android-port/PROJECT.md` — goal, scope, device
- `android-port/ROADMAP.md` — phases and done criteria
- `android-port/STATE.md` — current state, decisions, open questions
- `android-port/UPSTREAM_TOUCHES.md` — every upstream file modified, with reason
- `android-port/adr/` — decisions
- `android-port/tasks/` — one file per phase
- `android-port/tasks/P3-first-apk.md` — P3 task: first debug APK
- `android-port/reports/` — one report per phase
- `.claude/agents/code-explorer.md` — read-only search subagent
- `.claude/agents/device-runner.md` — adb install/launch/logcat subagent
- `tools/check_index.py` — fails if a listed path does not exist

## Upstream code (filled in P1, master 7d6daae3)
- `project.godot` — engine config (Godot 4.7, MM 1.8), autoloads, input map, renderer defaults
- `export_presets.cfg` — presets; Android = preset.7 (arm64, D6 id, P3)
- `parse_args.gd` — main scene: cmdline export or splash → main window
- `splash_screen/splash_screen.gd` — splash, window sizing, threaded main_window load
- `material_maker/main_window.gd` — MENU table, load/save/export, window state
- `material_maker/main_window.tscn` — main window scene (layout `allow_undock`, Share button)
- `material_maker/main_window_layout.gd` — PANELS list, default layouts
- `material_maker/globals_menu_manager.gd` — menu build + `not_in_ports` filter
- `material_maker/globals.gd` — config (`user://mm_config.ini`), popups helpers
- `addons/flexible_layout/flexible_layout.gd` — dock layout, undock windows
- `material_maker/panels/graph_edit/graph_edit.gd` — graph editor (extends GraphEdit), input
- `material_maker/nodes/base.gd` — graph node base (context menu, tooltips)
- `material_maker/windows/add_node_popup/add_node_popup.gd` — add-node popup (exe-dir path bug)
- `addons/material_maker/engine/multi_renderer.gd` — renderer autoload, local RenderingDevice thread
- `addons/material_maker/engine/pipeline/pipeline.gd` — texture formats, SPIR-V compile, samplers
- `addons/material_maker/engine/pipeline/compute_shader.gd` — compute dispatch/chunking
- `addons/material_maker/engine/pipeline/texture.gd` — MMTexture upload/readback
- `addons/material_maker/engine/renderer.gd` — legacy SubViewport renderer (8-bit)
- `addons/material_maker/engine/nodes/gen_material.gd` — material output, 3D preview shader
- `addons/material_maker/engine/paths.gd` — resource paths (exe dir → breaks on Android)
- `material_maker/panels/preview_2d/preview_2d.gd` — 2D preview
- `material_maker/panels/preview_3d/preview_3d.gd` — 3D preview, mouse orbit
- `material_maker/windows/file_dialog/file_dialog.gd` — custom FileDialog (all open/save/export)
- `material_maker/panels/paint/` — painting (out of scope, disable)
- `material_maker/tools/painter/` — painter engine (out of scope)
- `material_maker/tools/library_manager/library.gd` — library load; only Android gate upstream
- `material_maker/steam.gd` — Steam autoload (no-op without singleton)
- `addons/godotsteam/` — Steam GDExtension (no Android lib; exclude from export)
- `addons/gut/` — GUT 9.5.0 test framework
- `test/` — upstream GUT tests
- `material_maker/examples/` — example .ptex
- `addons/material_maker/nodes/` — node definitions (.mmg)
- `material_maker/library/` — node library JSON
- `android-port/reports/P1.md` — P1 recon report / risk map

## Android layer
- `material_maker/android/` — mobile-only scripts/scenes
- `material_maker/android/mobile.gd` — `MMMobile`: is_mobile (test override), gating, main-window setup, examples dialog
- `test/android/test_mobile.gd` — P3 GUT tests (paths, menu filter, gating, Android preset)
- `android-port/DEVICE_CHECKLIST.md` — on-device verification steps
- `android-port/reports/P3.md` — P3 report
- `android-port/reports/screens/` — device/desktop screenshots
