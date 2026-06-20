# Forensics: RPC Consistency Checks

A read-only method for deciding whether a problem is on-chain or just in how
state is being read. Querying the same fact from multiple independent sources at
different commitment levels separates a real incident from a visibility issue.

## What to compare

```text
Across providers     same signature/account queried on 2+ independent RPCs
Across commitment     processed vs confirmed vs finalized for the same query
Explorer vs RPC       does the explorer lag the RPC, or disagree outright?
Wallet vs RPC         is the wallet adapter showing stale or cached state?
Over time            does a "failure" resolve on retry a few seconds later?
```

## Method

1. Pick the disputed fact (a signature's status, an account balance).
2. Query it on at least two independent RPC providers.
3. Query at processed, confirmed, and finalized commitment; note differences —
   a result visible at processed/confirmed but not finalized is the classic lag.
4. If providers agree and only the explorer/wallet disagrees, the chain is fine
   and the issue is indexing/caching (`RPC_INDEXING_LAG`, adapter issue).
5. If independent providers disagree at finalized, escalate — this may be real.

## Interpreting results

```text
Providers agree, explorer lags      -> visibility issue, not fund loss
Resolves on retry                   -> timing/confirmation issue
Providers disagree at finalized     -> escalate; verify against fund movement
```

## Boundaries

`[READ_ONLY]` throughout. Switching providers or raising commitment is a
`[REVERSIBLE]` human change after the cause is clear. Route confirmed visibility
issues to [`../incidents/rpc-degradation.md`](../incidents/rpc-degradation.md);
if a real movement is hiding behind the noise, go to
[`../incidents/suspicious-drain.md`](../incidents/suspicious-drain.md).

## Confidence

Label every finding (see
[`../core/confidence-model.md`](../core/confidence-model.md)):

```text
Confidence: CONFIRMED               agreed across independent providers at finalized
Confidence: LIKELY                  strong but from a single provider/view
Confidence: POSSIBLE                consistent with the symptom, not established
Confidence: UNKNOWN                 no basis yet
Confidence: INSUFFICIENT_EVIDENCE   name the missing input that would resolve it
```
