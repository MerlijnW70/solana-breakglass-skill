# Decision Log

During an incident, decisions are made fast and remembered poorly. The decision
log captures each meaningful choice as it happens so the team can review,
reverse, and learn from it — and so the postmortem writes itself.

## What to log

Log any decision that changes severity, exposure, or public posture: convening a
war room, pausing the frontend, warning users, stopping deposits, planning an
authority rotation, or publishing a status update. Do not log routine
read-only checks.

## Table format

```text
Time | Decision | Owner | Evidence | Risk | Alternatives considered | Follow-up
```

- **Time** — timestamp with time zone.
- **Decision** — what was decided, in one line.
- **Owner** — the human accountable for it.
- **Evidence** — what the decision was based on, with its confidence label.
- **Risk** — the action labels that apply (e.g. `[IRREVERSIBLE]`,
  `[PUBLIC_COMMS]`).
- **Alternatives considered** — what else was on the table and why it was not
  chosen.
- **Follow-up** — the next check, owner, or reversal condition.

## Example row

```text
2026-06-20 14:05 UTC | Pause frontend deposits | @founder |
Withdrawal preview showed unknown destination, POSSIBLE drainer |
[REVERSIBLE][PUBLIC_COMMS] | Leave up + banner warning (rejected: too risky) |
Re-enable once build hash verified; owner @eng
```

## Discipline

- Record the **evidence and its confidence**, not just the conclusion.
- Record **alternatives**, so a reversal later is a known option, not a
  surprise.
- Every severity change gets a row, per
  [`severity-model.md`](severity-model.md).
- The log feeds the timeline and the control-plane review in the postmortem.
