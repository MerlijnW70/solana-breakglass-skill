# Forensics: Account Diff Analysis

A read-only method for quantifying what actually moved: comparing account
balances and state before and after a suspect set of transactions. This turns
"funds are gone" into a precise, evidence-backed statement.

## What to produce

```text
Scope            the set of accounts and the time/slot window examined
Before/after     balance and owner of each account at the window edges
Net movement     amount and direction per account; totals
Destinations     where outflows went (addresses only; no attribution)
Signers          who authorized each movement (known admin or unknown?)
Confidence       per finding, with the evidence that supports it
```

## Method

1. Fix the window: the first suspect signature to the latest, by slot.
2. For each affected account, record balance/state at both edges.
3. Compute net movement and follow outflows one hop to their destinations.
4. Check each authorizing signer against
   [`authority-graph.md`](authority-graph.md): known admin, or unknown?
5. Separate confirmed movement (`CONFIRMED`) from inferred intent (`POSSIBLE`).

## Boundaries

- `[READ_ONLY]` only. Never produce a script to move, sweep, or "rescue" funds.
- Record destination addresses as data. Do **not** attribute them to real-world
  identities or label them as the attacker — that is prohibited per
  [`../incidents/suspicious-drain.md`](../incidents/suspicious-drain.md).
- State scope honestly: "examined accounts A–C over slots X–Y", not "total loss
  is N" unless the diff is complete.
