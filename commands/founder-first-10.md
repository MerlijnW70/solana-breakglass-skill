# Command: founder-first-10

The founder/operator first-response command for the opening minutes of a
possible incident.

## Purpose

Give a founder a calm severity estimate, the next 10 minutes, who to pull in,
what not to say publicly, and a safe holding statement.

## When to use

A founder/operator senses something is wrong, users are complaining, or asks
"should we post / what do we say".

## Inputs

Minimal intake (money at risk, happening now, signature, what changed). See
`skill/intake/minimal-intake.md`.

## Output format

```text
Severity estimate (+ confidence):
Top risk:
Next 10 minutes (risk-labeled):
Who needs to be in the room:
What not to say publicly:
Evidence to collect (3, safe only):
Whether users need warning (+ trigger):
Safe holding statement:
```

## Safety rules

- Read-only by default; no secrets; no transactions; no fund movement; no
  automated authority changes.
- No public overclaims ("funds are safe", "we're hacked") before evidence.
- No reimbursement promises, no blame, no attribution.

## Referenced skill files

```text
skill/modes/founder-first-10.md
skill/routers/severity-router.md
skill/routers/symptom-router.md
skill/decisions/pause-frontend.md
skill/decisions/warn-users.md
skill/communications/public-status-update.md
```
