# Incident: Frontend Compromise

The on-chain program may be fine while the website that talks to it has been
compromised — serving a wallet-drainer, a swapped RPC, or a signing prompt that
does not match the user's intent. The off-chain control plane is in scope.

## When to use

Users report unexpected or unsafe wallet prompts, signing requests that do not
match the action, or a site that looks subtly wrong. Route here from
[`../routers/symptom-router.md`](../routers/symptom-router.md).

## Do not use when

The signing prompt is correct and the failure is on-chain (use
[`failed-transactions.md`](failed-transactions.md)).

## Inputs

The exact URL used, wallet app, transaction preview details, recent frontend/
DNS/CDN/dependency changes, and build hashes. Cross-check with
[`../forensics/verified-build-triage.md`](../forensics/verified-build-triage.md).

## Severity rules

```text
SEV0  confirmed live drainer served to users
SEV1  credible compromise indicators; users at risk; not yet confirmed
SEV2  anomaly under verification with no confirmed user harm
```

## Checks

```text
DNS record changes
CDN deployment history
GitHub release history
lockfile diff
wallet adapter changes
transaction preview mismatch
suspicious destination accounts
changed RPC endpoint
injected scripts
build artifact hash mismatch
dependency compromise
```

## Safe actions

- `[READ_ONLY]` Compare the live build hash to the expected/verified artifact.
- `[READ_ONLY]` Review DNS, CDN deploy, and GitHub release history for
  unexplained changes around the start time.
- `[READ_ONLY]` Inspect the transaction preview: does the destination and action
  match user intent?
- `[REVERSIBLE][PUBLIC_COMMS]` Pause the frontend via
  [`../decisions/pause-frontend.md`](../decisions/pause-frontend.md) and warn
  users with [`../decisions/warn-users.md`](../decisions/warn-users.md).

## Risky actions

- `[REVERSIBLE][PREPARE_ONLY]` Plan a rollback to a known-good build for humans
  to execute — and only after verifying that build is itself clean.

## Actions not to take yet

- Do not redeploy from a possibly-compromised pipeline before verifying it.
- Do not tell users "the site is safe now" before the build hash is verified.
- Do not ignore a dependency/lockfile change as noise.

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
