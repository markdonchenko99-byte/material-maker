# P3: First APK
Goal: a debug APK installs on the OnePlus Pad 3, opens an example graph, and node previews render (or we learn exactly why not). Painting and other out-of-scope features are hidden. The desktop build is unchanged. No touch or input work (that is P5/P6).

Read first:
- `android-port/STATE.md`, `android-port/reports/P1.md` §1, §3, §4, §7, §8 and the "Proposed order" section
- ADR 0001, 0003, 0004, 0005
- code only at the lines P1 cites

Environment (P0, verified 2026-11-25):
- Godot: `C:\Tools\Godot\Godot_v4.7.2-stable_win64_console.exe` (the non-mono build, for headless runs)
- Android templates 4.7.2 installed; JDK 17 and SDK paths set in editor settings
- adb: `%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe`; device `16b4ff8` (OPD2415, Android 16, arm64-v8a)
- Package id: `com.markdonchenko.materialmaker` (D6)

Steps:
1. **Test runner (ADR 0005).** Reuse the bundled GUT 9.5.0; this is not a new dependency.
   - Confirm a headless run works on desktop, e.g. `--headless -s addons/gut/gut_cmdln.gd -gdir=res://test -ginclude_subdirs -gexit`. A first `--headless --import` may be needed.
   - Put port tests in `test/android/`.
   - Mark ADR 0005 accepted.
2. **Red commit.** Write the tests listed below plus stubs. The project loads and the tests fail; paste the failure summary into the report.
3. **Paths (mobile gate).**
   - `addons/material_maker/engine/paths.gd:9-12`: on `mobile`, `get_resource_dir()` returns a `res://` dir, the same way the editor branch does.
   - `material_maker/windows/add_node_popup/add_node_popup.gd:281-283`: use `MMPaths.STD_GENDEF_PATH` on mobile too, or better, read through `MMPaths` so there is one source of truth.
4. **Window model (mobile only).**
   - Force embedded subwindows (`project.godot:64`). Prefer a feature-tag override such as `display/window/subwindows/embed_subwindows.mobile=true`, if Godot honours it at startup; otherwise set it at runtime in a mobile hook.
   - No undock (`allow_undock=false` at runtime; see `main_window.tscn:162`).
   - Skip saving and restoring window size, position and screen (`main_window.gd:150-166, 282-285`).
   - Check the splash's 1x1 transparent window (`project.godot:57-63`, `splash_screen.gd:103-132`) does not leave a tiny or black window. If it does, go straight to the main window on mobile.
5. **Disable out-of-scope features** (P1 §3):
   - Add `"Android"` to `not_in_ports` for the paint project, load-from-website, and the Help docs/examples items.
   - Guard the `.mmpp` load branch and the mesh drop handler.
   - Hide the Brushes, Layers and Parameters panels and the Share button.
   - Skip the Custom mesh in `model_menu.gd`.
   - Prefer a single mobile helper under `material_maker/android/` that the upstream hooks call.
6. **Android export preset** (`export_presets.cfg` preset.7):
   - arm64-v8a only; package id from D6; name "Material Maker"; version name "1.8-android".
   - `include_filter`: add `*.ptex` and `material_maker/environments/hdris/*.hdr`.
   - `exclude_filter`: `addons/godotsteam/*,addons/gut/*,test/*`.
   - Leave storage permissions as they are; that is P7.
7. **Build, install, run.** Use the `device-runner` subagent:
   - Debug export via the CLI (`--headless --export-debug "Android" <path>.apk`) to `export/` (git-ignored).
   - `adb install -r`, launch, filtered logcat.
   - Screenshots go in `android-port/reports/screens/P3-*.png`.
8. **Device checklist.** Write `android-port/DEVICE_CHECKLIST.md` with the P3 items and update INDEX.
9. **Desktop smoke.** On desktop the project opens, a sample graph renders, and the same menus and panels as upstream are present.

Tests to write first (GUT, headless, pure logic):
- On mobile, the resource dir and the nodes path resolve to existing `res://` paths, so the add-node popup can open an `.mmg` file. Gate the logic so the test can inject the mobile flag rather than rely on the real OS.
- The menu filter hides the out-of-scope items for "Android" and keeps them for "Windows" (`globals_menu_manager.gd:218` logic).
- Feature gating helper: mobile → no undock, embedded subwindows; desktop → unchanged.
- Export preset sanity: parse `export_presets.cfg` and check the Android preset is arm64 only, has the D6 package id, and has the include/exclude filters above.

Acceptance criteria:
- Red→green commits present; GUT green headless; `python tools/check_index.py` green.
- Upstream files touched ≤ 5 (excluding `export_presets.cfg`/`project.godot` settings). Each is listed in `UPSTREAM_TOUCHES.md`. More than that means stop and ask.
- The APK installs and launches without a crash on the device (logcat shows no fatal errors or `SCRIPT ERROR` floods).
- Desktop smoke passes.
- Report `android-port/reports/P3.md`; STATE updated. ADR 0004 gets a recommendation based on what the device showed.

On-device checks (owner confirms visuals):
- The app starts full-screen in landscape, with no tiny or black window.
- Open one example (File → Load or the examples list): node thumbnails, 2D preview and 3D preview render, not black. Record P1 risk R2 (r16f storage) here.
- Add a node through the add-node popup with no crash (P1 bug `add_node_popup.gd:281`).
- The paint project menu item is absent.
- Popups and dialogs open inside the app window.
- If previews are black: capture logcat (RenderingDevice/Vulkan errors) and stop. Fixes are P4.

Out of scope: touch gestures and right-click alternatives (P5), UI scale and toolbars (P6), file dialogs and storage (P7), render performance (P4), release signing.
