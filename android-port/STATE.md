phase: P0 done (Godot 4.7.2 + Android templates, JDK 17, SDK, adb sees OnePlus Pad 3 / Android 16), P1 done → P3 next (task: `android-port/tasks/P3-first-apk.md`); owner chose to skip separate P2 — render smoke is done inside P3 on the APK
done:
- P1 recon: `android-port/reports/P1.md`
- repo: local git from upstream/master 7d6daae3 (MM 1.8, Godot 4.7), branch `android`; remotes `origin` = github.com/markdonchenko99-byte/material-maker (fork), `upstream` = RodZill4
decisions:
- D1 scope: procedural only (ADR 0002)
- D2 mobile overlay, desktop unchanged (ADR 0001)
- D3 tests first + on-device verification (ADR 0003)
- D4 branch: `android` on owner's fork; upstream merged in, never rebased away
- D5 base: upstream master (MM 1.8, Godot 4.7.2 — CI version), owner decision 2026-11-24
- D6 Android package id: `com.markdonchenko.materialmaker` (owner, 2026-11-25)
pending:
- renderer — ADR 0004. P1: must stay Vulkan (Mobile default); Compatibility breaks the local RenderingDevice compute path. Confirm after P2.
- test framework — ADR 0005. P1: upstream already ships GUT 9.5.0 + `test/`; proposal = reuse GUT, no new dependency.
- storage access (SAF vs app folder vs MANAGE_EXTERNAL_STORAGE) — decide in P7
ask:
- owner P2: check on tablet that node previews render (local RD + r16f storage images, report R2)
known_issues:
- add-node popup reads nodes from exe dir outside the editor → likely crash on Android (`add_node_popup.gd:281`)
- Android preset omits *.ptex and *.hdr; packs godotsteam/gut
- all upstream "HTML5" OS.get_name() gates are dead in Godot 4
