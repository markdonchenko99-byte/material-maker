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
- `android-port/reports/` — one report per phase
- `.claude/agents/code-explorer.md` — read-only search subagent
- `.claude/agents/device-runner.md` — adb install/launch/logcat subagent
- `tools/check_index.py` — fails if a listed path does not exist

## Upstream code (filled in P1)
- `project.godot` — engine config, renderer
- `[planned: P1]` graph editor scripts/scenes
- `[planned: P1]` shader generation / renderer
- `[planned: P1]` 2D/3D preview
- `[planned: P1]` file dialogs / save-load / export
- `[planned: P1]` painting entry points (to disable)
- `[planned: P1]` main window / panel layout

## Android layer
- `[planned: P3]` `material_maker/android/` — mobile-only scripts/scenes
- `[planned: P3]` `export_presets.cfg` — Android preset (arm64-v8a)
- `[planned: P3]` `android-port/DEVICE_CHECKLIST.md` — on-device verification steps
