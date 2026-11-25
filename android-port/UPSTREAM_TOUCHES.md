# Upstream files touched

| File | Phase | Reason |
|---|---|---|
| `addons/material_maker/engine/paths.gd` | P3 | mobile: res:// resource dir; new `get_mmg_dir()` (single source for add-node popup) |
| `material_maker/windows/add_node_popup/add_node_popup.gd` | P3 | read .mmg via `MMPaths.get_mmg_dir()` (exe-dir crash on Android) |
| `material_maker/main_window.gd` | P3 | `"Android"` in not_in_ports (paint, website, docs); MMMobile hooks: setup, window state, .mmpp/mesh guards, examples dialog |
| `material_maker/panels/preview_3d/model_menu.gd` | P3 | mobile: skip "Custom" mesh and recent custom models |
| `project.godot` | P3 | settings: `.mobile` overrides (embed_subwindows, no transparency/borderless) |
| `export_presets.cfg` | P3 | settings: Android preset (arm64, D6 id, filters, version) |
| `.gitignore` | P3 | ignore `export/` |
