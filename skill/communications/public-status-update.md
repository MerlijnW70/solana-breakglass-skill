# Comms: Public Status Update

A public update that builds trust by being timely and honest, and that avoids
the overclaims that destroy it. Use this structure for every public post during
an incident.

## Structure

```text
Status:
What we know:
What we are investigating:
User impact:
What users should do:
What users should not do:
Next update:
```

## Rules

```text
- Do not promise reimbursement.
- Do not assign blame.
- Do not reveal exploit details before mitigation.
- Do not say funds are safe unless evidence supports it.
- Do not say resolved until monitoring confirms it.
```

## Writing guidance

- Keep claims at their true confidence level. "We are investigating reports of
  X" is honest under uncertainty; "no funds are affected" needs `CONFIRMED`.
- Give users exactly one clear action and one clear "do not".
- Always commit to a next-update time, even if the update will be "still
  investigating".
- Pair with the anti-scam reminder (no DMs, never asks for seed phrases) from
  [`../modes/user-safety-mode.md`](../modes/user-safety-mode.md).

## Template

```text
Status: Investigating
What we know: We are aware of reports of <symptom> affecting <product> starting
around <time>.
What we are investigating: The cause and scope. We have not confirmed <claim>.
User impact: <accurate, scoped statement, or "still determining">.
What users should do: <one safe action>.
What users should not do: Do not share your seed phrase or private keys. We will
never DM you first or ask for them.
Next update: by <time>.
```

Decide whether to post at all with
[`../decisions/public-status.md`](../decisions/public-status.md), and log the
published text in [`../core/decision-log.md`](../core/decision-log.md).
