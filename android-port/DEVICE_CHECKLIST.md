# Device checklist (OnePlus Pad 3)

Install: `adb -s 16b4ff8 install -r export/material_maker.apk`, start "Material Maker".

## P3 — first APK
- [ ] App starts full-screen in landscape; no tiny/black/transparent window, splash does not hang.
- [ ] Help → Example projects opens an in-app file dialog at `res://material_maker/examples`; pick e.g. `bricks.ptex`.
- [ ] Node thumbnails, 2D preview and 3D preview render (not black). If black → P1 risk R2 (r16f storage); capture logcat, stop (fix in P4).
- [ ] Add a node via the add-node popup (drag a wire to empty space, or right-click with a mouse) — no crash (old bug `add_node_popup.gd:281`).
- [ ] File menu: no "New paint project", no "Load material from website"; Help: no "User manual" / "library item documentation".
- [ ] Status bar: no Share button. Panel tabs: no undock button.
- [ ] Popups and dialogs open inside the app window.
- [ ] 3D preview model list has no "Custom" entry.
