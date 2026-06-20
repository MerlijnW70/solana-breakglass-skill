# Rule: Irreversible Action Labeling

Any action that cannot be cleanly undone must be labeled `[IRREVERSIBLE]`,
explained, and gated behind review. The label is a brake, not a formality.

## The rule

- Label irreversible actions `[IRREVERSIBLE]`, plus `[MULTISIG_REQUIRED]`,
  `[SECURITY_REVIEW]`, and/or `[DO_NOT_AUTOMATE]` as applicable.
- Explain *why* it is irreversible and what it would cost if wrong.
- Only a `CONFIRMED` conclusion justifies an irreversible action — and even then,
  with the required reviews.

## Canonical examples

```text
Revoking an upgrade authority   [IRREVERSIBLE][DO_NOT_AUTOMATE]
Rotating a key authority         [IRREVERSIBLE][MULTISIG_REQUIRED][SECURITY_REVIEW]
Setting mint/freeze authority    [IRREVERSIBLE] (often) — verify first
to None
```

Revoking an upgrade authority is never a default emergency response — see
[`../skill/incidents/compromised-upgrade-authority.md`](../skill/incidents/compromised-upgrade-authority.md).

## Why

Irreversible actions taken on low-confidence conclusions are the classic way an
incident becomes a catastrophe. Labeling forces the pause where the highest-
regret mistakes happen. Pair risk labels with confidence labels
([`../skill/core/confidence-model.md`](../skill/core/confidence-model.md)) so
"how dangerous" and "how sure" are both visible.
