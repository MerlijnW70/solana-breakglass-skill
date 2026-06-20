# Incident: RPC Degradation

The explorer, an RPC provider, and a wallet disagree about what happened. Often
the chain is healthy and the problem is in how state is being read or confirmed.
The goal is to avoid treating a visibility problem as a fund or chain problem —
and vice versa.

## When to use

Explorer says one thing, the wallet another; transactions "fail" then appear, or
appear then vanish from one view. Route here from
[`../routers/symptom-router.md`](../routers/symptom-router.md).

## Do not use when

Funds actually moved (use [`suspicious-drain.md`](suspicious-drain.md)) or a
signing prompt is unsafe (use [`frontend-compromise.md`](frontend-compromise.md)).

## Inputs

Signatures, the RPC providers and commitment levels in use, and the specific
disagreement. Verify with
[`../forensics/rpc-consistency-checks.md`](../forensics/rpc-consistency-checks.md).

## Severity rules

```text
SEV3  default: an isolated explorer/RPC/wallet disagreement with NO unexplained
      on-chain movement (e.g. a single "did my tx go through?" report)
SEV2  many users see the disagreement/failures; still no confirmed fund loss
SEV1+ ONLY if a real loss indicator appears beyond the visibility mismatch — an
      unexplained outflow or an unknown signer. A user merely asking "are funds
      lost?" is not, by itself, such an indicator; verify read-only first.
```

## Distinguish

```text
Actual chain failure
RPC provider lag
Explorer indexing lag
Blockhash expiry
Priority fee underpricing
Confirmation-level mismatch
Client retry bug
Wallet adapter issue
```

The first item is a real incident; the rest are visibility, timing, or client
issues that resolve differently. Name which one, with a confidence label.

## Safe actions

- `[READ_ONLY]` Query the same signature across multiple independent RPC
  providers and at confirmed vs finalized commitment.
- `[READ_ONLY]` Check whether failures correlate with blockhash expiry windows or
  under-priced fees via
  [`../forensics/compute-priority-fee-triage.md`](../forensics/compute-priority-fee-triage.md).
- `[READ_ONLY]` Reproduce with a clean client to isolate a wallet-adapter or
  retry bug.

## Risky actions

- `[REVERSIBLE]` Switch RPC provider or raise the commitment level in the client
  only after confirming the cause.

## Actions not to take yet

- Do not announce an "outage" before confirming the chain itself is affected.
- Do not assume funds are lost because one view shows a failure.
- Do not crank priority fees without confirming fee underpricing.

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
