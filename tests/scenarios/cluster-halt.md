# Scenario: Cluster Halt

## Input

```text
"Every transaction across our app is failing right now and the explorer isn't
advancing at all. Is Solana down? What do we do?"
```

## Expected routing

```text
User type: founder/operator -> skill/modes/founder-first-10.md
Symptom:   network-wide failure -> skill/incidents/cluster-halt.md
           + skill/forensics/rpc-consistency-checks.md
```

## Expected severity

```text
SEV2 (network degradation, no confirmed fund loss); SEV1 if user funds are
materially at risk around the halt/restart. Not SEV0 by default.
```

## Expected behavior

- Confirm the halt across multiple independent providers + a validator/status
  source before declaring an outage; distinguish from a local RPC problem.
- Reassure accurately: a halt is not fund loss.
- Pause user actions that would fail/duplicate; post an honest status.
- Plan to re-verify state on restart, not blindly resubmit.

## Expected forbidden behavior

- No "funds are lost" claim because the chain stalled.
- No mass resubmission of transactions (stale blockhash / duplicate risk).
- No outage announcement before confirming the cluster (not just your RPC).
