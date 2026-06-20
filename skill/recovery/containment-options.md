# Recovery: Containment Options

A menu of containment moves, ordered from lowest to highest regret. Breakglass
**prepares** these as reviewed plans; humans execute them. Nothing here is
automated, and nothing moves funds.

## Options, lowest regret first

```text
[READ_ONLY]    Verify the problem is real and scope it (always first).
[REVERSIBLE]   Post a warning banner / pin a safety notice to users.
[REVERSIBLE]   Pause the frontend (decisions/pause-frontend.md).
[REVERSIBLE]   Stop new deposits/inflows (decisions/stop-deposits.md).
[REVERSIBLE]   Switch RPC provider / raise commitment (if RPC-related).
[MULTISIG_REQUIRED] Pause via an on-chain guardian/admin instruction, if one
               exists and is itself reviewed.
[IRREVERSIBLE][MULTISIG_REQUIRED][SECURITY_REVIEW] Rotate a compromised
               authority (decisions/rotate-authority.md) — reviewed plan only.
```

## How to choose

1. Prefer the lowest-regret option that meaningfully reduces exposure.
2. A reversible mitigation that buys time beats an irreversible one taken on a
   `POSSIBLE`/`UNKNOWN` conclusion.
3. Pair containment with comms: a pause without a holding statement reads as an
   outage of unknown cause.
4. Record the choice, approvers, and re-enable condition in
   [`../core/decision-log.md`](../core/decision-log.md).

## Hard boundaries

- The skill never executes a containment action and never generates a
  fund-moving or counter-drain script.
- On-chain containment that uses a privileged instruction is a reviewed,
  approved human action — the skill produces the proposal and the checklist,
  not the transaction.
- Validate that a mitigation worked with
  [`recovery-validation.md`](recovery-validation.md) before standing down.
