# Project

## Goal
Personal Android build of Material Maker for learning node-based procedural texturing away from the PC. Shareable later if quality is good.

## In scope
- Node graph editing: add/connect/disconnect/move/delete nodes, edit parameters, reroutes, comments, undo/redo.
- 2D preview and 3D material preview (simple meshes: sphere/cube/plane).
- Built-in node library and examples.
- Save/open `.ptex`; export textures to a user-accessible folder.

## Out of scope
Painting, mesh/texture painting, custom mesh import, multi-window/undocking, global menu, external process calls, Steam/itch integration.

## Target device
OnePlus Pad 3: Snapdragon 8 Elite (Adreno), 12/16 GB shared RAM, 13.2" 2400x3392 @ 315 PPI, touch + OnePlus Stylo 2. Android 15+. arm64-v8a only.

## Base
Upstream Material Maker 1.6, Godot 4.5.1 (verify exact version in `project.godot` during P1). Build machine: owner's PC with Claude Code.

## Principles
1. Desktop behavior unchanged; mobile is an overlay (ADR 0001).
2. Disable out-of-scope features instead of porting them (ADR 0002).
3. Tests first; on-device verification for anything visual/input/file (ADR 0003).
4. Touch first, stylus as precise pointer; no reliance on hover, right/middle mouse, wheel or hotkeys.
