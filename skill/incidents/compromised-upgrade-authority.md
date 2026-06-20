# Incident: Compromised Upgrade Authority

An upgrade, admin instruction, or authority change is unexpected, and the
program's control plane may be compromised. This is among the highest-stakes
Solana incidents — and among the easiest to make worse with a panicked,
irreversible action.

## When to use

An unrecognized program upgrade, a changed upgrade/admin authority, or a
privileged instruction nobody on the team initiated. Route here from
[`../routers/symptom-router.md`](../routers/symptom-router.md).

## Do not use when

The concern is read-only readiness (use
[`../modes/readiness-review-mode.md`](../modes/readiness-review-mode.md)).

## Critical guidance

```text
Never recommend revoking upgrade authority as a default emergency response.
Revoking upgrade authority is irreversible and must be [IRREVERSIBLE][DO_NOT_AUTOMATE].
Prefer read-only verification, reviewed authority rotation planning, and
governance/security approval.
```

Revocation can permanently freeze your ability to fix the very program under
attack. It is sometimes correct — but only as a deliberate, reviewed decision,
never as a reflex.

## Inputs

Program ID, program data account, current upgrade/buffer authority, governance/
multisig address and threshold, and recent upgrade history. Analyze with
[`../forensics/program-authority-analysis.md`](../forensics/program-authority-analysis.md)
and [`../forensics/verified-build-triage.md`](../forensics/verified-build-triage.md).

## Severity rules

```text
SEV0  confirmed malicious upgrade or unauthorized admin action
SEV1  suspected authority compromise; upgrade/admin risk; loss not confirmed
SEV2  unexplained but likely-benign authority/upgrade event under verification
```

## Safe actions

- `[READ_ONLY]` Confirm the current upgrade authority and whether the program is
  immutable or upgradeable.
- `[READ_ONLY]` Determine whether the recent upgrade matches a reviewed commit
  and a verified build.
- `[READ_ONLY]` Map all authorities with
  [`../forensics/authority-graph.md`](../forensics/authority-graph.md).
- `[PREPARE_ONLY][MULTISIG_REQUIRED][SECURITY_REVIEW]` Draft a reviewed rotation
  plan via
  [`../recovery/authority-rotation-planning.md`](../recovery/authority-rotation-planning.md)
  and the [`../decisions/rotate-authority.md`](../decisions/rotate-authority.md)
  card.

## Risky actions

- `[IRREVERSIBLE][MULTISIG_REQUIRED][SECURITY_REVIEW][DO_NOT_AUTOMATE]` Rotating
  or revoking an authority — only as a reviewed, approved human decision.

## Actions not to take yet

- Do not revoke the upgrade authority as a first move.
- Do not push a "fix" upgrade from an unverified build under pressure.
- Do not assume compromise without confirming the signer is not a known admin.

## Output contract

```text
Incident class:
Severity:
Confidence:
Known facts:
Unknowns:
Hypotheses:
Evidence requested:
Immediate safe actions:
Actions not to take yet:
Escalation triggers:
Recommended next module:
Communication need:
Postmortem notes:
```
