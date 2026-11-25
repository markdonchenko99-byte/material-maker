class_name MMMobile
extends RefCounted

## Mobile (Android) overlay helper, ADR 0001. Upstream hooks call these
## functions; on desktop every function returns the upstream behaviour.

## Test injection: null = use the real OS, true/false = force mobile/desktop.
static var override_mobile = null

static func is_mobile() -> bool:
	return false

## Upstream `allow_undock` value -> value to use.
static func allow_undock(upstream : bool) -> bool:
	return upstream

## Upstream `gui_embed_subwindows` value -> value to use.
static func embed_subwindows(upstream : bool) -> bool:
	return upstream

## Whether the main window saves/restores its size, position and screen.
static func keep_window_state() -> bool:
	return true
