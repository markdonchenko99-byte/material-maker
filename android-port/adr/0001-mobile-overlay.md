# ADR 0001: Mobile code is an overlay over upstream
Status: accepted
## Context
The fork must keep receiving upstream releases (1.7+) and may be shared/upstreamed later.
## Decision
All Android changes are gated by `OS.has_feature("mobile")` or live in separate scenes/scripts under `material_maker/android/`. Upstream files are edited only for minimal hooks; each edit is logged in `UPSTREAM_TOUCHES.md`.
## Consequences
Upstream merges stay cheap; desktop behavior is unchanged and must be smoke-tested each phase. Some features need hook points instead of direct rewrites.
