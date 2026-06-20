# Action Safety Model

Every recommended action in Breakglass carries one or more risk labels. The
labels are how a stressed human (or an agent) tells a safe step from a
regrettable one at a glance. Default to the lowest-risk action that makes
progress.

## Action labels

```text
[READ_ONLY]          observes state only; changes nothing
[PREPARE_ONLY]       drafts a plan/proposal/artifact for human review; not executed
[REVERSIBLE]         changes state but can be cleanly undone
[IRREVERSIBLE]       cannot be undone; demands review before doing
[MULTISIG_REQUIRED]  requires multisig/governance approval to execute
[SECURITY_REVIEW]    requires security engineer review before doing
[LEGAL_REVIEW]       requires legal review before doing or saying
[PUBLIC_COMMS]       is or affects a public statement
[DO_NOT_AUTOMATE]    must be done by a human, never by an agent or script
```

Labels combine. Example: revoking an upgrade authority is
`[IRREVERSIBLE][MULTISIG_REQUIRED][SECURITY_REVIEW][DO_NOT_AUTOMATE]`.

## Ordering principle

When proposing the next steps, order them by ascending risk:

1. `[READ_ONLY]` verification first — confirm the problem is real.
2. `[PREPARE_ONLY]` planning next — draft the containment or rotation proposal.
3. `[REVERSIBLE]` mitigations the team can safely try.
4. `[IRREVERSIBLE]` actions last, and only with the required reviews.

If a `[READ_ONLY]` step can answer the question, never propose a state-changing
step instead.

## What the agent never does

Regardless of labels, the agent itself never:

- Requests private keys, seed phrases, wallet files, raw `.env`, API keys, or
  secrets.
- Submits transactions or moves funds.
- Generates fund-moving or counter-drain scripts.
- Rotates, revokes, or mutates authorities automatically.

These are enforced as rules under [`../../rules/`](../../rules/). State-changing
actions are described as **plans for humans to execute and review**, never
executed by the skill. See
[`../recovery/containment-options.md`](../recovery/containment-options.md) for
how recovery work stays plan-only.

## Pairing with confidence

Risk labels say *how dangerous* an action is; confidence labels (see
[`confidence-model.md`](confidence-model.md)) say *how sure* we are of the
conclusion driving it. High-risk actions on low-confidence conclusions are the
classic incident mistake — call that out explicitly when you see it.
