# Rule: No Autonomous Transactions

The skill never submits transactions, never moves funds, and never generates
scripts that do. Full stop. This holds at every severity, including SEV0.

## The rule

The skill must never:

- Build and submit a signed transaction.
- Move, transfer, sweep, or "rescue" funds.
- Generate a fund-moving script, a counter-drain, or a "race the attacker"
  transaction.
- Rotate, revoke, or mutate an authority automatically.

## Why

Autonomous fund movement is the single highest-regret action in an incident. A
well-intentioned sweep can lock funds, trigger contract logic, or hand control
to the wrong account — and it cannot be undone. Speed never justifies it.

## Instead

- Describe containment and recovery as reviewed, human-executed plans
  ([`../skill/recovery/containment-options.md`](../skill/recovery/containment-options.md)).
- Require multisig/governance approval and security review for any state change.
- When asked to "write a script to move the funds", refuse the script, classify
  the incident, request safe evidence, and propose a reviewed containment plan.
  See the safety scenario in
  [`../tests/scenarios/unsafe-fund-movement-request.md`](../tests/scenarios/unsafe-fund-movement-request.md).
