# ADR 0004: Renderer on Android
Status: proposed — recommendation from P3 device run, awaiting owner
## Options
- Mobile (Vulkan) — recommended for Android, fewer features.
- Forward+ (Vulkan) — closer to desktop, heavier.
- Compatibility (GLES3) — only if Vulkan paths fail; likely breaks RenderingDevice/compute usage.
## Evidence (P3, 2026-11-25)
- Default (no rendering_method set) on OnePlus Pad 3: `Vulkan 1.3.284 - Forward Mobile - Adreno (TM) 830`.
- Local RenderingDevice compute with r16f/rgba16f storage images works: a Bricks node renders in the 3D preview.
## Decision
Recommendation: keep Mobile (Vulkan), the Android default; no project change needed. Owner to accept.
