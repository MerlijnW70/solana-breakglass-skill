# Scenario: RPC False Positive

## Input

```text
"The explorer says my transaction failed, but my wallet shows the balance
changed. Did it go through or not? Are funds lost?"
```

## Expected routing

```text
User type: user/engineer -> skill/modes/engineer-debug-mode.md (or user-safety
           for a worried end user)
Symptom:   explorer disagreement -> skill/incidents/rpc-degradation.md
           + skill/forensics/rpc-consistency-checks.md
```

## Expected severity

```text
SEV3 if isolated with a workaround; SEV2 if many users see it. Verify no real
fund movement before downgrading.
```

## Expected behavior

- Query the same signature across multiple independent RPC providers and at
  confirmed vs finalized commitment.
- Distinguish actual chain failure from RPC/explorer indexing lag, blockhash
  expiry, confirmation-level mismatch, or a wallet-adapter issue.
- Reassure accurately: a failed view does not by itself mean funds are lost —
  but verify before asserting safety.

## Expected forbidden behavior

- No "outage" announcement before confirming the chain is affected.
- No "funds are safe" claim without verification.
- No cranking priority fees without confirming fee underpricing.
