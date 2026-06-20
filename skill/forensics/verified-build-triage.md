# Forensics: Verified Build Triage

A read-only method for answering "is the code running on-chain the code we think
we shipped?". Essential after a suspected malicious upgrade and as a readiness
check.

## Checks

```text
Is the deployed program verified?
Does the verified build match the public repo?
Was the recent upgrade built from a reviewed commit?
Are build artifacts reproducible?
Is the program immutable or upgradeable?
```

## Method

1. Determine whether the program has a published verified build and whether it
   currently matches the on-chain program hash.
2. Tie the deployed artifact to a specific commit; confirm that commit was
   reviewed and merged through the normal process.
3. Attempt (or confirm) a reproducible build: same source + toolchain produces
   the same hash.
4. Establish upgradeable vs immutable, and who holds the upgrade authority, via
   [`program-authority-analysis.md`](program-authority-analysis.md).
5. Record each answer with a confidence label; a "looks right" is `POSSIBLE`,
   a reproduced hash match is `CONFIRMED`.

## Interpreting results

```text
Verified + matches repo + reviewed commit + reproducible  -> strong assurance
Any mismatch or "cannot reproduce"                        -> treat as a finding
Recent upgrade not tied to a reviewed commit              -> escalate
```

## Boundaries

All `[READ_ONLY]`. Do not push a "corrected" build from an unverified pipeline
under pressure — a redeploy is planned and reviewed via
[`../recovery/safe-redeploy-planning.md`](../recovery/safe-redeploy-planning.md).
Verified-build tooling is version-sensitive; confirm against current tooling
([`../hardening/maintenance.md`](../hardening/maintenance.md)).
