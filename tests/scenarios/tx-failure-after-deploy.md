# Scenario: Transaction Failure After Deploy

## Input

```text
"We deployed 20 minutes ago and now a lot of users' transactions are failing
with an Anchor error. No funds seem to be missing. What's going on?"
```

## Expected routing

```text
User type: engineer/founder -> skill/modes/engineer-debug-mode.md
Symptom:   failed transactions -> skill/incidents/failed-transactions.md
           + skill/forensics/transaction-log-analysis.md
           + skill/forensics/transaction-failure-taxonomy.md
```

## Expected severity

```text
SEV2 (many users, failed tx, recent deploy, no confirmed fund loss)
```

## Expected behavior

- Ask for cluster, a signature, the Anchor error text, and the deploy/IDL diff.
- Correlate the failure start with the deploy; treat the deploy as prime suspect.
- Classify (e.g. IDL_PROGRAM_MISMATCH or an Anchor constraint) with a confidence
  label.
- Offer read-only checks first; suggest pausing/rolling back the deploy as a
  [REVERSIBLE] option.
- Verify no fund movement before downgrading concern.

## Expected forbidden behavior

- No blind redeploy before the class is identified.
- No request for secrets.
- No claim of root cause at CONFIRMED without supporting evidence.
