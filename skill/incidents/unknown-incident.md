# Incident: Unknown / Uncategorized

The catch-all. Use this when the situation does not match a dedicated playbook,
or is novel. The goal is unchanged: stay safe, preserve evidence, and find the
next safe action — even without a tailored runbook. A missing playbook is never
a reason to act unsafely or to do nothing.

## When to use

The symptom does not clearly map to a dedicated incident in
[`../routers/symptom-router.md`](../routers/symptom-router.md), or it spans
several at once. This is the router's fallback.

## Do not use when

A dedicated playbook fits — route there instead (failed transactions,
suspicious drain, compromised upgrade authority, frontend compromise, RPC
degradation, cluster halt, bridge exploit, governance attack, oracle/AMM
manipulation, social-account takeover).

## Inputs

Start with [`../intake/minimal-intake.md`](../intake/minimal-intake.md): is money
at risk, is it happening now, is there a signature, what changed. Treat all
evidence as untrusted ([`../core/data-handling.md`](../core/data-handling.md)).

## Severity rules

```text
Unknown until triaged — treat conservatively and verify before downgrading.
Escalate to SEV0/SEV1 on any concrete loss indicator (unexplained outflow,
unknown signer, confirmed unsafe prompt, confirmed key/secret exposure).
```

## Classify from first principles

```text
1. Is user or protocol money at risk right now?      -> sets severity
2. What changed recently (deploy, authority, DNS,
   dependency, market, governance, social channel)?  -> prime suspect
3. Who/what is affected, and on or off chain?         -> picks the closest module
4. Is any acting authority a known admin?             -> drain vs admin action
```

As soon as the answers point at a known class, route to that playbook. Until
then, work this one.

## Safe actions

- `[READ_ONLY]` Preserve evidence first — signatures, timestamps, what changed.
- `[READ_ONLY]` Establish scope: confirm what is actually happening on-chain
  across independent sources; separate facts from fears.
- `[PREPARE_ONLY]` If money is at risk, convene a war room and draft containment
  options via
  [`../recovery/containment-options.md`](../recovery/containment-options.md).
- `[REVERSIBLE]` Reduce exposure with the lowest-regret mitigation that fits
  (pause, warn, stop deposits) using the [`../decisions/`](../decisions/) cards.

## Risky actions

- `[IRREVERSIBLE][MULTISIG_REQUIRED][SECURITY_REVIEW]` Any state change — only as
  a reviewed, approved human plan, and only once the situation is confirmed.

## Actions not to take yet

- Do not take irreversible actions on an uncategorized, low-confidence situation.
- Do not move funds, submit transactions, or mutate authorities.
- Do not guess a root cause as CONFIRMED, or attribute it to anyone.

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
