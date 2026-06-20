# Forensics: Compute and Priority Fee Triage

A read-only method for the failure family caused by compute budget and priority
fees: transactions that fail under load, exceed compute units, or never get
included. These look alarming but are usually tuning issues, not attacks.

## What to check

```text
Compute units      consumed vs requested limit; was the budget too low?
Compute budget ix  is a ComputeBudget instruction present and sized correctly?
Priority fee       is the fee competitive for current network conditions?
Inclusion          did the tx land at all, or get dropped under contention?
Blockhash window   did it expire before inclusion (timing, not pricing)?
Pattern            do failures spike with network load or a specific instruction?
```

## Method

1. Read the consumed-vs-limit compute from logs
   ([`transaction-log-analysis.md`](transaction-log-analysis.md)).
2. Separate "ran out of compute" (`COMPUTE_LIMIT_EXCEEDED`) from "never
   included" (`PRIORITY_FEE_TOO_LOW` / contention) from "expired"
   (`BLOCKHASH_EXPIRED`).
3. Correlate failures with network load and the specific instruction mix.
4. Confirm before tuning: raising fees or compute blindly can mask the real
   cause and cost users money.

## Boundaries

`[READ_ONLY]` analysis. Fee/compute changes are `[REVERSIBLE]` client changes
made by humans after the cause is confirmed — never an automated reaction.
Priority-fee recommendations are version- and condition-sensitive; do not hard
code them ([`../hardening/maintenance.md`](../hardening/maintenance.md)).

## Confidence

Label every finding (see
[`../core/confidence-model.md`](../core/confidence-model.md)):

```text
Confidence: CONFIRMED               consumed-vs-limit or inclusion read directly
Confidence: LIKELY                  strong correlation with load/fees
Confidence: POSSIBLE                consistent with the symptom, not established
Confidence: UNKNOWN                 no basis yet
Confidence: INSUFFICIENT_EVIDENCE   name the missing input that would resolve it
```
