phase: P0 (owner setup) / P1 ready to start
done: -
decisions:
- D1 scope: procedural only (ADR 0002)
- D2 mobile overlay, desktop unchanged (ADR 0001)
- D3 tests first + on-device verification (ADR 0003)
- D4 branch: `android` on owner's fork; upstream merged in, never rebased away
pending:
- renderer (Mobile vs Forward+) — ADR 0004, decide after P1+P2
- test framework — ADR 0005, decide after P1 (check if upstream already has one)
- storage access (SAF vs app folder vs MANAGE_EXTERNAL_STORAGE) — decide in P7
ask:
- owner: PC OS (Windows/Linux) for setup instructions
known_issues: -
