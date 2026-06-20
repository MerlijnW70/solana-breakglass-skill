# Example: Suspicious Drain War-Room Update

An illustrative internal war-room update during a suspected drain. Fictional
values. Internal audience; still no secrets, still confidence-labeled.

## At a glance

```text
🟠 SEV1 · Suspicious treasury drain · confidence: LIKELY

DO NOW
  1. Confirm there are no further outflows since 14:05   [read-only]
  2. Trace the 40k destination one hop                   [read-only]
  3. Prep a containment proposal for the multisig         [prepare]

NEED                       DON'T
  • a 2nd multisig signer     • move or "rescue" funds
  • the full account diff     • name or attribute an attacker
  • treasury auth config      • share or request any key/seed

NEXT  decide stop-deposits by 14:30 · forensics/account-diff-analysis.md
```

## Update

```text
Time / update #:   2026-06-20 14:18 UTC / #2
Severity:          SEV1 (raised from SEV2 at 14:12 on signer finding)
Confirmed facts:   - 40,000 USDC left treasury at 14:05 (CONFIRMED).
                   - Signer Acc9999... is NOT in the known-admin set (CONFIRMED).
                   - No further outflows since 14:05 (CONFIRMED as of now).
Current hypotheses: - Authority/key compromise of a treasury signer (LIKELY).
                   - Misconfigured integration acting with stale rights (POSSIBLE).
What we ruled out: - Routine admin action (signer is not a known admin).
Actions in progress: - Drafting containment proposal (@security)
                       [PREPARE_ONLY][MULTISIG_REQUIRED].
                     - Frontend paused at 14:10 (@founder) [REVERSIBLE].
Decisions needed:  - Stop deposits? (owner: @founder, by 14:30)
Evidence still needed: - Full account diff over 14:00-14:20.
                       - Verify treasury authority config vs authority graph.
Next update at:    14:35 UTC
```

## Notes

This is internal and frank, but it still labels confidence, names owners, sets a
next-update time, and contains no secrets and no attacker attribution. The public
version would say far less and promise nothing — see
[`public-status-update.md`](public-status-update.md).
