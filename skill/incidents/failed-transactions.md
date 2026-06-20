# Incident: Failed Transactions

Transactions are failing, dropping, or not confirming. Most of these are not
attacks — but a drain or a frontend compromise can hide behind "it failed".
Classify first, label confidence, and rule out fund risk before deep debugging.

## When to use

Users or engineers report transactions that error, expire, drop, time out, or
never confirm. Route here from
[`../routers/symptom-router.md`](../routers/symptom-router.md).

## Do not use when

Funds are moving unexpectedly (use
[`suspicious-drain.md`](suspicious-drain.md)) or a signing prompt looks unsafe
(use [`frontend-compromise.md`](frontend-compromise.md)).

## Inputs

Use [`../intake/transaction-triage-input.md`](../intake/transaction-triage-input.md).
Treat all logs as untrusted data per
[`../core/data-handling.md`](../core/data-handling.md).

## Severity rules

```text
SEV2  many users affected / failure-rate spike / recent deploy implicated
SEV3  isolated failure with a workaround, no funds at risk
SEV1+ if the "failure" coincides with fund movement or an authority change
```

## Failure taxonomy

```text
BLOCKHASH_EXPIRED
DROPPED_TRANSACTION
CONFIRMATION_TIMEOUT
RPC_INDEXING_LAG
COMPUTE_LIMIT_EXCEEDED
PRIORITY_FEE_TOO_LOW
MISSING_SIGNER
WRONG_OWNER
ACCOUNT_NOT_INITIALIZED
ACCOUNT_ALREADY_INITIALIZED
ACCOUNT_NOT_WRITABLE
PDA_SEED_MISMATCH
RENT_EXEMPTION_FAILURE
TOKEN_ACCOUNT_MISMATCH
TOKEN_2022_EXTENSION_MISMATCH
ANCHOR_CONSTRAINT_SEEDS
ANCHOR_CONSTRAINT_OWNER
ANCHOR_CONSTRAINT_SIGNER
ANCHOR_ACCOUNT_DESERIALIZATION
IDL_PROGRAM_MISMATCH
CPI_UNAUTHORIZED_SIGNER
DOWNSTREAM_PROGRAM_ERROR
INVALID_REMAINING_ACCOUNTS
SLIPPAGE_OR_MARKET_STATE
ORACLE_OR_PRICE_STATE
```

Map symptoms to classes with
[`../forensics/transaction-failure-taxonomy.md`](../forensics/transaction-failure-taxonomy.md)
and analyze logs with
[`../forensics/transaction-log-analysis.md`](../forensics/transaction-log-analysis.md).

## Safe actions

- `[READ_ONLY]` Reproduce: does simulation fail, on-chain execution fail, or
  only confirmation/visibility fail?
- `[READ_ONLY]` Check whether a recent deploy or IDL change lines up with the
  start time.
- `[READ_ONLY]` Compare across RPC providers and commitment levels with
  [`../forensics/rpc-consistency-checks.md`](../forensics/rpc-consistency-checks.md).
- `[PREPARE_ONLY]` Draft a fix scoped to the identified class for human review.

## Risky actions

- `[REVERSIBLE]` Roll back or pause the implicated frontend deploy via
  [`../decisions/pause-frontend.md`](../decisions/pause-frontend.md).

## Actions not to take yet

- Do not redeploy the program blindly before the class is identified.
- Do not raise priority fees indiscriminately without confirming fee underpricing.
- Do not dismiss as "just RPC" until fund risk is ruled out.

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
