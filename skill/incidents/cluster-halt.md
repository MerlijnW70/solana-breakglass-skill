# Incident: Cluster Halt / Network Outage

The Solana cluster itself has stopped producing or finalizing blocks, or a
coordinated restart is underway. This is a network event, not your bug — the job
is to protect users, avoid duplicate/again-failing actions, and prepare to
validate state cleanly once the cluster resumes.

## When to use

Transactions are failing network-wide, block production/finalization has stalled
across independent sources, or validators are coordinating a restart. Route here
from [`../routers/symptom-router.md`](../routers/symptom-router.md).

## Do not use when

Only your RPC or explorer disagrees while the chain is healthy — that is
[`rpc-degradation.md`](rpc-degradation.md). Confirm the halt across independent
sources before using this playbook.

## Inputs

Independent confirmations (multiple RPC providers, validator/status sources),
the time production stalled, and whether finalization or just confirmation is
affected. Verify with
[`../forensics/rpc-consistency-checks.md`](../forensics/rpc-consistency-checks.md).

## Severity rules

```text
SEV2  cluster degraded/halted; users affected; no confirmed fund loss
SEV1  user funds materially at risk around the halt/restart (e.g. stuck flows)
Not SEV0 by default — a halt is not fund loss; escalate only on actual loss
```

## Distinguish

```text
Real cluster halt (production/finalization stalled across independent sources)
vs. your RPC provider down  vs. explorer indexing lag  vs. a regional outage
```

## Safe actions

- `[READ_ONLY]` Confirm the halt across at least two independent providers and a
  validator/status source; note whether finalization or only confirmation stalled.
- `[REVERSIBLE][PUBLIC_COMMS]` Pause user actions that would fail or duplicate;
  post an accurate status (it is a network event; funds are not lost by a halt).
- `[PREPARE_ONLY]` Prepare for restart: plan to re-verify state, not blindly
  resubmit (blockhash expiry and duplicate-send risk).
- `[READ_ONLY]` After resume, validate balances/positions before re-enabling.

## Risky actions

- `[REVERSIBLE]` Re-enable flows only after confirming the cluster is producing
  and finalizing normally and your state reconciles.

## Actions not to take yet

- Do not tell users their funds are lost — a halt is not a loss.
- Do not mass-resubmit transactions; stale blockhashes and duplicates cause new
  problems.
- Do not take irreversible actions because the chain is "down".

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
