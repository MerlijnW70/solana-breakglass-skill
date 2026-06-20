# Confidence Model

Every non-trivial conclusion in Breakglass carries a confidence label. During an
incident, false certainty is dangerous in both directions: it triggers
overreaction (irreversible actions on a hunch) and underreaction (dismissing a
real threat). Labeling confidence keeps facts and fears separate.

## Confidence labels

```text
CONFIRMED              verified by direct, trustworthy evidence
LIKELY                 strong evidence; small chance of an alternative
POSSIBLE               plausible; consistent with evidence but not established
UNKNOWN                no basis yet to judge either way
INSUFFICIENT_EVIDENCE  cannot conclude without specific missing evidence
```

## How to use them

- Attach a label to each conclusion, not to the whole report. Different claims
  in the same incident carry different confidence.
- Prefer `INSUFFICIENT_EVIDENCE` plus a named evidence request over a guess.
  Saying what would raise confidence is more useful than guessing.
- Only `CONFIRMED` justifies `[IRREVERSIBLE]` actions — and even then, with the
  required reviews from [`action-safety-model.md`](action-safety-model.md).
- Re-label as evidence arrives. Moving a claim from `POSSIBLE` to `CONFIRMED`
  (or to ruled-out) is the core of incident progress; record it in the
  [`decision-log.md`](decision-log.md).

## What counts as evidence

Trustworthy, verifiable, and reproducible signals raise confidence: on-chain
state, transaction signatures, program logs, multiple independent RPC providers
agreeing, reproducible build hashes. Self-reported, single-source, or
unverifiable signals do not raise confidence on their own, and all of it is
treated as untrusted data per [`data-handling.md`](data-handling.md).

## Example

```text
Claim: The treasury transfer was an unauthorized drain.
Confidence: POSSIBLE
Why: One signature shows an outflow to an unknown account, but we have not yet
confirmed whether an admin initiated it.
Raises to LIKELY/CONFIRMED if: the signer is not a known admin wallet and no
operator claims the action.
```
