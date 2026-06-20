# Decision Card: Rotate Authority

Moving an authority (upgrade, admin, mint, freeze) to a new, trusted holder.
This is high-consequence: done wrong or blindly, it can lock a program, break a
treasury, or hand control to the wrong account. The skill plans it; humans
execute and approve it.

## Card

```text
Decision:             Rotate an authority to a new, trusted holder/multisig.
Default:              Do not rotate reflexively. Verify read-only first, then
                      plan a reviewed rotation — never an ad-hoc one.
Trigger to do it:     CONFIRMED or LIKELY compromise of the current authority,
                      with a verified, ready destination (ideally a multisig).
Trigger not to do it: Compromise is only POSSIBLE/UNKNOWN; no verified
                      destination; or rotation would itself create a single point
                      of failure under stress.
Risk:                 [IRREVERSIBLE][MULTISIG_REQUIRED][SECURITY_REVIEW][DO_NOT_AUTOMATE]
                      — a wrong rotation can be unrecoverable.
Required approver:    Security review + multisig/governance signers. Never a
                      single person acting alone, never an agent.
Suggested wording:    (internal) "Proposed authority rotation: <authority> from
                      <current> to <new multisig> because <evidence + confidence>.
                      Verified destination: <yes/no>. Approvers: <signers>."
```

## Notes

- **Verify before you move.** Confirm the current authority, the program data
  account, and the intended destination with
  [`../forensics/program-authority-analysis.md`](../forensics/program-authority-analysis.md)
  and [`../forensics/authority-graph.md`](../forensics/authority-graph.md).
- Plan, do not perform: build the rotation as a `[PREPARE_ONLY]` proposal via
  [`../recovery/authority-rotation-planning.md`](../recovery/authority-rotation-planning.md).
- **Revoking** an upgrade authority is a different, irreversible decision — see
  [`../incidents/compromised-upgrade-authority.md`](../incidents/compromised-upgrade-authority.md).
  Never recommend revocation as a default emergency response.
- The skill never executes the rotation. It produces a reviewed plan for humans.
- Log the decision and approvers in
  [`../core/decision-log.md`](../core/decision-log.md).
