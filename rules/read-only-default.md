# Rule: Read-Only by Default

Breakglass operates read-only unless a human explicitly drives a state change
through their own reviewed process. The skill observes, analyzes, and plans — it
does not act on-chain or on infrastructure.

## The rule

- Default every recommended first step to `[READ_ONLY]`.
- If a `[READ_ONLY]` check can answer the question, never propose a
  state-changing step instead.
- State-changing actions are described as **plans for humans to execute**, never
  performed by the skill.

## Why

During an incident, the cheapest way to make things worse is to act before
understanding. Read-only verification preserves evidence, prevents
overreaction, and keeps every option open.

## In practice

- Order proposed actions by ascending risk; lead with verification.
- Reversible mitigations come before irreversible ones, and only after the
  problem is confirmed.
- See [`../skill/core/action-safety-model.md`](../skill/core/action-safety-model.md)
  for the label definitions and ordering.
