# Recovery: Authority Rotation Planning

How to prepare a reviewed plan to rotate a compromised or at-risk authority. The
skill produces the plan, the checklist, and the approval requirements — it never
executes the rotation and never handles keys.

## Preconditions

```text
Compromise confidence    CONFIRMED or LIKELY (not POSSIBLE/UNKNOWN)
Verified destination     the new holder is known-good (ideally a multisig)
Approvers identified     security review + multisig/governance signers ready
Blast radius understood  what the authority controls and what rotation affects
```

If any precondition is missing, do not plan execution yet — gather evidence and
verify read-only first.

## Plan contents

```text
Authority to rotate:     (upgrade / admin / mint / freeze / ...)
Current holder:          (verified)
New holder:              (verified; multisig preferred, with threshold)
Evidence + confidence:   (why rotation is justified)
Risk labels:             [IRREVERSIBLE][MULTISIG_REQUIRED][SECURITY_REVIEW][DO_NOT_AUTOMATE]
Approvers:               (named signers / reviewers)
Pre-checks:              (read-only verifications to run immediately before)
Rollback/abort plan:     (what to do if it goes wrong mid-rotation)
Comms plan:              (internal first; public only if needed and reviewed)
```

## Boundaries

- The skill never generates the signing steps as something to run blindly. It
  describes a reviewed human procedure with explicit approvers.
- **Revoking** an upgrade authority is irreversible and is not a default — see
  [`../incidents/compromised-upgrade-authority.md`](../incidents/compromised-upgrade-authority.md).
- Confirm the current and target authorities with
  [`../forensics/program-authority-analysis.md`](../forensics/program-authority-analysis.md)
  and [`../forensics/authority-graph.md`](../forensics/authority-graph.md).
- After rotation, validate with
  [`recovery-validation.md`](recovery-validation.md) before standing down.
