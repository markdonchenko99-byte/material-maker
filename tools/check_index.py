#!/usr/bin/env python3
"""Fail if a path listed in android-port/INDEX.md does not exist (except [planned: ...] entries)."""
import re, sys, pathlib
root = pathlib.Path(__file__).resolve().parent.parent
missing = []
for line in (root / "android-port/INDEX.md").read_text(encoding="utf-8").splitlines():
    if not line.lstrip().startswith("- ") or "[planned:" in line:
        continue
    m = re.search(r"`([^`]+)`", line)
    if m and not (root / m.group(1).rstrip("/")).exists():
        missing.append(m.group(1))
if missing:
    print("INDEX.md lists missing paths:\n  " + "\n  ".join(missing))
    sys.exit(1)
print("INDEX.md OK")
