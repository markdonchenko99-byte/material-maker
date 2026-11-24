# P1: Recon (read-only)

Goal: produce a risk map for porting the procedural part to Android. DO NOT modify code (only `android-port/` docs and INDEX.md).
Use the `code-explorer` subagent for searches.

Write `android-port/reports/P1.md` covering:
1. Engine: exact Godot version and renderer in `project.godot`; export presets present.
2. Rendering: how node previews and final textures are computed (SubViewport, RenderingDevice, compute shaders?). Texture/buffer formats (esp. 16/32-bit float). Risks on Vulkan Mobile / Adreno.
3. Disable list: painting, mesh, other out-of-scope code — entry points and the cheapest place to switch each off.
4. Desktop dependencies: OS.execute, native file dialogs, multi-window/undock, global menu, clipboard, absolute paths, writes to res://.
5. Input: every place relying on right/middle mouse, wheel, hover, Ctrl/Shift/Alt, hotkeys — especially the graph editor (GraphEdit or custom).
6. Native code, GDExtension, addons, external binaries.
7. Data locations: node library, examples, user data (res:// vs user://).
8. Existing tests or test framework in the repo (input for ADR 0005).

For each item: file paths with line numbers, difficulty (low/med/high), blocker yes/no.
End with: top-5 risks and proposed order/split for P3–P7 tasks.

Also: fill the "Upstream code" section of INDEX.md with real paths; run `python tools/check_index.py`.
Acceptance: report complete for all 8 items; INDEX check passes; no code changes in git diff outside `android-port/`.
