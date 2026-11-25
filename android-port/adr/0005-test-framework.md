# ADR 0005: Test framework
Status: accepted (P3, 2026-11-25)
## Options
- Reuse whatever upstream already has (preferred if present).
- GUT or gdUnit4 as a dev-only addon, excluded from export.
## Decision
Reuse the bundled GUT 9.5.0 (`addons/gut/`, already upstream; no new dependency).
- Port tests live in `test/android/`.
- Run headless: `Godot_v4.7.2-stable_win64_console.exe --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://test/android -gexit`
  (first run on a fresh checkout: `--headless --path . --import`).
- Mobile behaviour is tested by injecting `MMMobile.override_mobile = true` instead of relying on the real OS.
- `addons/gut/*` and `test/*` are excluded from the Android export.
- Known noise: GUT prints `SCRIPT ERROR ... gut_loader.gd:35` at start (upstream GUT, harmless); upstream `test/test_doc_completion.gd` has 2 failing doc-coverage tests (not ours).
