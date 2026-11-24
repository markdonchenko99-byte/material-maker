# AGENTS.md — Material Maker Android port

Fork of RodZill4/material-maker. Goal: run the PROCEDURAL part (node graph + previews) on an Android tablet (OnePlus Pad 3). Read `android-port/PROJECT.md` for scope.

## Session start (always, in this order)
1. Read `android-port/STATE.md` (current phase, decisions, open questions).
2. Read `android-port/INDEX.md` to locate files. Do NOT explore the repo blindly.
3. Read ONLY the task file you were given (`android-port/tasks/<phase>.md`).
4. Read other docs/code only by section, only when the task needs it.

## Hard rules
1. One phase = one session. Handoff happens only through files (STATE.md, reports). Never rely on chat memory.
2. Tests first. Every code change is at least two commits: (a) tests + stubs — project loads, tests FAIL, paste failure summary into the report; (b) implementation — tests pass. Never weaken a test or widen a tolerance; any test edit must be listed in the report.
3. Mobile code is an overlay. Gate it with `OS.has_feature("mobile")` or separate scenes/scripts under `material_maker/android/`. The desktop build must behave exactly as before. Minimize edits to upstream files; every upstream file you touch goes into `android-port/UPSTREAM_TOUCHES.md` with a one-line reason.
4. Out of scope: painting, mesh/3D texture painting, anything not needed for graph editing, previews, save/load, texture export. Disable, do not port.
5. No new dependencies, addons or tools without the owner's explicit approval (ask, then stop).
6. "Builds" is not "works". Rendering/input/file tasks are done only after on-device verification (see `android-port/adr/0003-*`). If you cannot verify on device, mark the item `UNVERIFIED` and say what the owner must check.
7. Debugging: max two hypotheses. If both fail, stop, write what you learned, ask.
8. Keep it simple: no abstractions for hypothetical future needs. Smallest change that meets the task.
9. Keep `android-port/INDEX.md` current: add every new key file; replace `[planned: Px]` when it exists. `python tools/check_index.py` must pass.
10. Delegate exploration and log reading to subagents (`code-explorer`, `device-runner`); bring only conclusions into the main context.

## Stop and ask when
- the task conflicts with these rules or with an ADR;
- a fix needs editing many upstream files (>5) or changes desktop behavior;
- you need a dependency, a renderer change, or an Android permission not yet decided;
- the device/adb is unavailable for a task that requires it.

## Efficiency
- Read files with offset/limit; Grep/Glob before Read.
- Filter build/adb output (`grep`, tail); never paste full logcat.
- Ignore `.godot/`, `export/`, `*.import`, binaries.

## Definition of done (per phase)
- Task acceptance criteria met; tests green; `tools/check_index.py` green.
- Desktop smoke: project still opens and renders a sample graph on desktop.
- Report written: `android-port/reports/<phase>.md` (template below).
- `STATE.md` updated (phase, decisions, open questions, known issues).

## Report template (`android-port/reports/<phase>.md`)
```
# <phase> report
Status: done | partial | blocked
Changed: <files, one line each>
Upstream touched: <files or none>
Tests: <added/changed; red→green evidence>
On-device: verified | UNVERIFIED (+ what owner must check)
Decisions: <new, or none>
Open questions: <for owner>
Next: <suggested next task>
```

## Owner communication
Final message to the owner: in Russian, max 6 lines: what was done, what to check on the tablet, what needs his decision.
