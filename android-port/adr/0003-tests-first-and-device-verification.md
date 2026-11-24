# ADR 0003: Tests first; on-device verification
Status: accepted
## Context
Agents tend to fit tests to finished code and to declare "done" after a successful build.
## Decision
1. Tests are committed before implementation and must fail first (red commit, then green commit). Git history is the evidence.
2. Testable logic (gesture recognition, UI scale math, path mapping, feature gating) is written as pure functions and unit-tested headless.
3. Rendering, input and file access are verified on the device: install via adb, run the steps in `DEVICE_CHECKLIST.md`, check filtered logcat. The `device-runner` subagent automates install/launch/log capture; the owner confirms visuals.
## Consequences
More commits per change; some items stay `UNVERIFIED` until the owner checks the tablet.
