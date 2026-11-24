# Roadmap

| Phase | Owner | Deliverable / done when |
|---|---|---|
| P0 Setup | owner | Godot 4.5.x + export templates, JDK 17, Android SDK, `adb devices` shows tablet |
| P1 Recon | agent (read-only) | `reports/P1.md` risk map; INDEX.md filled with real paths |
| P2 Render smoke | owner | Godot Editor for Android opens the project; node previews render? (yes/no + screenshots) |
| P3 First APK | agent | APK installs, opens example graph, previews render; painting disabled; desktop unaffected |
| P4 Render fixes | agent + owner | No black/broken previews on Adreno, no crashes on example set, acceptable latency |
| P5 Touch graph | agent | Pan/pinch-zoom, long-press = context menu, tap-to-add node, reliable port dragging |
| P6 Touch shell | agent | UI scale for 315 PPI, panels without undock, toolbar for hotkey actions, soft keyboard in fields |
| P7 Files | agent | Save/open `.ptex`, texture export to user-visible folder, permissions decided |
| P8 Verification | fresh agent | Checklist run on device, bug list in `reports/P8.md` |

P5 and P6 may run in parallel only in separate git worktrees/branches.
Task files for P3+ are written AFTER P1, based on its report.
