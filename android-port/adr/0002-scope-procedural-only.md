# ADR 0002: Procedural part only
Status: accepted
## Context
Owner wants to learn node graphs and see previews on the tablet. Painting is the least stable part of upstream since the Godot 4 port.
## Decision
Port graph editing, 2D/3D previews, library, save/open, texture export. Disable painting, mesh painting, custom mesh import, undocking, external processes on mobile.
## Consequences
Much smaller surface. Disabled features must be hidden cleanly (no dead menu items, no crashes when opening files that reference them).
