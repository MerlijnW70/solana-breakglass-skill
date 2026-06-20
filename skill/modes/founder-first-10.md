# Founder First 10 Minutes

For a founder or operator in the first minutes of a possible incident. Goal: get
calm, get a severity estimate, reduce user risk, and avoid a regrettable public
statement — all before the facts are in. Stay short and directive.

## When to use

A founder/operator says users are complaining, something looks wrong, or asks
"should we post / what do we say". Route here from
[`../routers/user-type-router.md`](../routers/user-type-router.md).

## Do not use when

The user is an affected end user (use
[`user-safety-mode.md`](user-safety-mode.md)) or is pasting logs for a technical
diagnosis (use [`engineer-debug-mode.md`](engineer-debug-mode.md)).

## First questions (minimal intake)

Ask only these, from [`../intake/minimal-intake.md`](../intake/minimal-intake.md):
is money at risk, is it happening now, is there a transaction signature, what
changed recently.

## The 3-3-3 first response

```text
3 immediate actions
  1. [READ_ONLY] Preserve evidence: capture signatures, timestamps, what changed.
  2. [PREPARE_ONLY] Pull the right people into a private war room.
  3. [READ_ONLY] Verify the problem on-chain before acting or posting.

3 evidence items
  1. Any transaction signature(s).
  2. What deployed or changed in the last 24h (code, frontend, DNS, authority).
  3. The specific user-reported symptom and when it started.

3 things not to do
  1. Do not post "funds are safe" or "we are hacked" before evidence.
  2. Do not take [IRREVERSIBLE] actions (e.g. revoke authority) on a hunch.
  3. Do not paste or request any secret, key, or seed phrase.
```

## Output structure

Render the first response as the founder **incident card** in
[`../core/response-format.md`](../core/response-format.md) (severity header,
`DO NOW`, `NEED` / `DON'T`), then fill the fields below as the record.

```text
Severity estimate:           (SEV0-SEV4 + confidence label)
Top risk:                    (the single worst plausible outcome right now)
Next 10 minutes:             (ordered, risk-labeled, lowest-risk first)
Who needs to be in the room: (roles, not names: eng, security, comms, support)
What not to say publicly:    (the claims you cannot yet support)
Evidence to collect:         (3 items, safe only)
Whether users need warning:  (yes/no/not yet + the trigger that decides)
Safe holding statement:      (a [PUBLIC_COMMS] draft that overclaims nothing)
```

## Safe holding statement (template)

```text
We are aware of reports of <symptom> affecting <product>. We are investigating
and will share an update by <time>. If you are affected, <one safe action>. We
will never DM you first or ask for your seed phrase or private keys.
```

## Routing

- Confirm severity with [`../routers/severity-router.md`](../routers/severity-router.md).
- Route by symptom with [`../routers/symptom-router.md`](../routers/symptom-router.md).
- For decisions (pause frontend, warn users, stop deposits), use the cards in
  [`../decisions/`](../decisions/).
- Record every decision in [`../core/decision-log.md`](../core/decision-log.md).
