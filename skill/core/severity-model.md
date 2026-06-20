# Severity Model

Severity sets the tempo and the audience. Estimate it early, label it with a
confidence level, and re-estimate as evidence arrives. When unsure between two
levels, pick the higher one and say so.

## Levels

### SEV0 — Active critical incident

- Active loss of user or protocol funds.
- Confirmed private key compromise.
- Confirmed malicious upgrade or unauthorized admin action.
- Exploit ongoing.
- Public users actively at risk.

Response: short, calm, directive. Convene a war room. Preserve evidence. Reduce
user exposure with `[READ_ONLY]` / `[PREPARE_ONLY]` steps first.

### SEV1 — High-risk incident

- Credible exploit report.
- Suspected authority compromise.
- Treasury, mint, freeze, or upgrade authority at risk.
- Production system may be unsafe but active loss is not confirmed.

Response: treat as near-SEV0. Verify read-only before any state change. Prepare
containment proposals for human and multisig review.

### SEV2 — Major production degradation

- Many users affected.
- Failed transactions.
- RPC, indexing, or confirmation issues.
- Recent deploy causing serious failure.
- No confirmed fund loss.

Response: stabilize, communicate clearly, debug methodically.

### SEV3 — Limited impact

- Isolated bug.
- Workaround exists.
- No funds at risk.
- Staging or devnet only.

Response: normal engineering workflow; document and fix.

### SEV4 — Readiness or tabletop

- Pre-launch review.
- Authority hygiene.
- Monitoring setup.
- Tabletop exercise.

Response: readiness review mode; no live incident.

## Escalation and de-escalation

- **Escalate** the moment evidence suggests fund loss, key compromise, or an
  unauthorized authority action — even before it is confirmed.
- **De-escalate only on evidence**, never on hope. Do not lower severity because
  the situation "feels" calmer; lower it because a specific risk is ruled out.
- Record every severity change in the [`decision-log.md`](decision-log.md) with
  the evidence that justified it.
