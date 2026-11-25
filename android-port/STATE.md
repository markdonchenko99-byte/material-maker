phase: P3 done (first debug APK runs on OnePlus Pad 3; compute previews render on Adreno 830) → next P5 (touch graph) or P4; report `android-port/reports/P3.md`
done:
- P1 recon: `android-port/reports/P1.md`
- P3 first APK: `android-port/reports/P3.md` (mobile helper `material_maker/android/mobile.gd`, GUT tests `test/android/`, device checklist `android-port/DEVICE_CHECKLIST.md`)
- repo: local git from upstream/master 7d6daae3 (MM 1.8, Godot 4.7), branch `android`; remotes `origin` = github.com/markdonchenko99-byte/material-maker (fork), `upstream` = RodZill4
decisions:
- D1 scope: procedural only (ADR 0002)
- D2 mobile overlay, desktop unchanged (ADR 0001)
- D3 tests first + on-device verification (ADR 0003)
- D4 branch: `android` on owner's fork; upstream merged in, never rebased away
- D5 base: upstream master (MM 1.8, Godot 4.7.2 — CI version), owner decision 2026-11-24
- D6 Android package id: `com.markdonchenko.materialmaker` (owner, 2026-11-25)
- D7 tests: reuse bundled GUT 9.5.0, port tests in `test/android/` (ADR 0005 accepted, P3)
pending:
- renderer — ADR 0004: recommend Mobile (Vulkan); P3 showed compute previews render on Adreno 830. Owner to accept.
- examples on Android — upstream `material_maker/examples/.gdignore` keeps them out of the APK; options in reports/P3.md (recommend Android-only pre-export copy)
- storage access (SAF vs app folder vs MANAGE_EXTERNAL_STORAGE) — decide in P7
ask:
- owner: accept ADR 0004 (Mobile renderer) and pick the examples option (reports/P3.md, open question 1)
- owner: check the P3 items marked UNVERIFIED in reports/P3.md (DEVICE_CHECKLIST.md)
known_issues:
- examples not in APK (upstream `.gdignore`); Help → Example projects shows a res:// dialog without examples
- `reference_panel.gd:279` clipboard poll → 1/s ERROR log spam on Android (P6)
- `float_edit.gd:366` `alt_pressed` on InputEventScreenDrag → SCRIPT ERROR on touch-drag of sliders (P5)
- touch: library drag scrolls instead of dragging; double-tap does not open dialog folders; right-click-only actions (P5)
- all upstream "HTML5" OS.get_name() gates are dead in Godot 4
