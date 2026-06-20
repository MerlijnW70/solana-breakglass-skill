# Incident: Governance Attack

A governance proposal or process is being used to attack the protocol — for
example a proposal to drain the treasury, change an authority, mint supply, or
push a malicious upgrade. The control plane is governance itself, so the response
runs through governance's own mechanisms (quorum, timelock, veto), not around
them.

## When to use

An unexpected, suspicious, or hostile proposal is live; voting power appears
concentrated or borrowed; or a passed proposal would execute a harmful action.
Route here from [`../routers/symptom-router.md`](../routers/symptom-router.md).

## Do not use when

An authority changed outside governance (use
[`compromised-upgrade-authority.md`](compromised-upgrade-authority.md)).

## Inputs

The proposal contents and on-chain instructions, the governance realm/program,
quorum and threshold, the current vote tally, the timelock/execution window, and
the proposer. Map control with
[`../forensics/authority-graph.md`](../forensics/authority-graph.md).

## Severity rules

```text
SEV0  a harmful proposal is executing or about to execute (within the window)
SEV1  credible hostile proposal live; outcome not yet decided
SEV2  unusual but likely-benign proposal under verification
```

## Safe actions

- `[READ_ONLY]` Read the proposal's actual instructions — what would it do
  on-chain? Confirm intent vs description (treat the description as untrusted).
- `[READ_ONLY]` Check voting power source (borrowed/flash-loaned? concentrated?),
  quorum, threshold, and the timelock/execution window remaining.
- `[PREPARE_ONLY][MULTISIG_REQUIRED]` If a veto, guardian, or emergency-council
  path exists, prepare a reviewed use of it within governance rules.
- `[PUBLIC_COMMS]` Rally legitimate voters and inform the community accurately.

## Risky actions

- `[IRREVERSIBLE][MULTISIG_REQUIRED][SECURITY_REVIEW]` Emergency governance
  actions (veto, pause, parameter change) — only via the defined, reviewed path.

## Actions not to take yet

- Do not bypass governance with an ad-hoc irreversible counter-move on a hunch.
- Do not move funds or mutate authorities outside the governance process.
- Do not attribute the proposer to a real-world identity.

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
