# Decision Card: Stop Deposits

Halting new deposits/inflows to limit how many more users are exposed while an
incident is unresolved. Often reversible at the application layer, but it has
real product and trust costs.

## Card

```text
Decision:             Stop accepting new deposits / inflows.
Default:              Stop deposits when continuing would put more user funds at
                      risk than pausing would cost. When unsure, lean toward
                      protecting users.
Trigger to do it:     Active or LIKELY loss tied to deposits; an unsafe code path
                      or contract state that new deposits would feed into.
Trigger not to do it: Funds already deposited are unaffected and the issue is
                      read/visibility-only (e.g. RPC lag), where stopping
                      deposits helps nothing.
Risk:                 [REVERSIBLE][PUBLIC_COMMS] at the app layer. If it requires
                      an on-chain admin action, it may be
                      [IRREVERSIBLE][MULTISIG_REQUIRED] — verify first.
Required approver:    Founder/operator. Multisig/governance if the halt is an
                      on-chain privileged action.
Suggested wording:    "As a precaution, we've paused new deposits to <product>
                      while we investigate. Funds already in the protocol are
                      <accurate status>. Withdrawals <status>. Next update by
                      <time>."
```

## Notes

- Be precise and honest about what is paused: new deposits, withdrawals, or
  both. Do not imply existing funds are safe unless evidence supports it.
- Confirm whether the halt is an app-layer toggle (reversible) or an on-chain
  privileged instruction (treat as
  [IRREVERSIBLE][MULTISIG_REQUIRED][SECURITY_REVIEW]) before acting.
- Plan containment via
  [`../recovery/containment-options.md`](../recovery/containment-options.md); the
  skill prepares the plan, humans execute it.
- Log the decision and the re-enable condition in
  [`../core/decision-log.md`](../core/decision-log.md).
