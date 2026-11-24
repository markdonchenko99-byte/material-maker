phase: P1 done → P2 (owner render smoke) next; P3 task file to be written after P2
done:
- P1 recon: `android-port/reports/P1.md`
- repo: local git from upstream/master 7d6daae3 (MM 1.8, Godot 4.7), branch `android`, remote `upstream` only
decisions:
- D1 scope: procedural only (ADR 0002)
- D2 mobile overlay, desktop unchanged (ADR 0001)
- D3 tests first + on-device verification (ADR 0003)
- D4 branch: `android` on owner's fork; upstream merged in, never rebased away
pending:
- base version: master (MM 1.8 / Godot 4.7.2, CI version) vs tag 1.6 (Godot 4.6); PROJECT.md's "1.6 / 4.5.1" is wrong either way. Recon assumes master.
- renderer — ADR 0004. P1: must stay Vulkan (Mobile default); Compatibility breaks the local RenderingDevice compute path. Confirm after P2.
- test framework — ADR 0005. P1: upstream already ships GUT 9.5.0 + `test/`; proposal = reuse GUT, no new dependency.
- storage access (SAF vs app folder vs MANAGE_EXTERNAL_STORAGE) — decide in P7
- Android package id / app name (upstream preset: org.rodzlabs.materialmaker)
ask:
- owner: confirm base (master vs 1.6); install matching Godot (4.7.2) + export templates
- owner: fork URL to add as `origin` and push `android`
- owner P2: check on tablet that node previews render (local RD + r16f storage images, report R2)
known_issues:
- add-node popup reads nodes from exe dir outside the editor → likely crash on Android (`add_node_popup.gd:281`)
- Android preset omits *.ptex and *.hdr; packs godotsteam/gut
- all upstream "HTML5" OS.get_name() gates are dead in Godot 4
