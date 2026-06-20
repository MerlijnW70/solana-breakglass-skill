# Hardening: Authority Hygiene

Grading and improving who controls your protocol. Most catastrophic incidents
trace back to authority hygiene: a single key holding upgrade authority, an
unowned DNS record, a multisig with everyone as a signer. Grade honestly and fix
the worst first.

## Grades

```text
A — Production hardened
    Upgrade/admin/mint/freeze authorities held by a healthy-threshold multisig
    or governance. Off-chain control plane scoped and owned. Verified,
    reproducible builds. Monitoring on every privileged action.
B — Acceptable with gaps
    Mostly multisig, but one or two HIGH items (e.g. a sole-owner DNS, an
    overpowered admin key). Known and scheduled to fix.
C — Risky
    A CRITICAL single point of control exists (e.g. one EOA can upgrade the
    program or move the treasury). Ship-blocking for anything user-facing.
D — Critical
    Multiple CRITICAL single points of failure and/or unknown ownership of key
    authorities. Do not launch.
```

## How to grade

1. Build the [`../forensics/authority-graph.md`](../forensics/authority-graph.md)
   and assign each entry a risk label.
2. The grade is set by the worst items: any `CRITICAL` caps you at C; multiple
   `CRITICAL`/`UNKNOWN` is D.
3. Convert `CRITICAL`/`HIGH`/`UNKNOWN` entries into ranked fixes.

## Common fixes (highest value first)

```text
Move upgrade authority to a multisig with a real threshold.
Remove or scope an overpowered admin key.
Set mint/freeze authority to None where supply/freeze should be fixed.
Establish clear ownership of DNS, CDN, and the deploy pipeline.
Right-size multisig signers (enough for liveness, not so many it's meaningless).
Enable verified, reproducible builds.
```

## Boundaries

All `[PREPARE_ONLY]`/`[READ_ONLY]`: the skill grades and recommends; humans
execute changes through their reviewed process (authority changes are
`[IRREVERSIBLE][MULTISIG_REQUIRED]`). Used as the grade source for
[`../modes/readiness-review-mode.md`](../modes/readiness-review-mode.md).
