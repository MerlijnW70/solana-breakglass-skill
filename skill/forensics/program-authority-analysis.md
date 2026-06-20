# Forensics: Program Authority Analysis

A read-only method for establishing who can change a program: its upgrade
authority, buffer authority, and whether it is immutable or upgradeable. This is
the core of triaging a suspected upgrade-authority compromise.

## What to establish

```text
Program ID                 the program in question
Program data account       where the executable + authority live
Upgradeable?               upgradeable vs immutable (authority is None)
Upgrade authority          the account that can replace the code
Buffer authority           authority over any pending write buffers
Last upgrade               slot/time of the most recent upgrade
Upgrade source             does it match a reviewed commit + verified build?
Authority type             single key, multisig, or governance program
```

## Method

1. Read the program account and its program data account (read-only).
2. Determine if the upgrade authority is set or `None` (immutable).
3. If set, classify it: individual key, multisig, or governance — and capture
   the threshold/signers via [`authority-graph.md`](authority-graph.md).
4. Cross-check the last upgrade against
   [`verified-build-triage.md`](verified-build-triage.md): reviewed commit,
   reproducible build, expected hash.
5. Flag any mismatch with a confidence label.

## If compromise is indicated

Route to
[`../incidents/compromised-upgrade-authority.md`](../incidents/compromised-upgrade-authority.md).
Remember: revoking the upgrade authority is
`[IRREVERSIBLE][DO_NOT_AUTOMATE]` and is never the default response. All analysis
here is `[READ_ONLY]`; any rotation is a reviewed plan via
[`../recovery/authority-rotation-planning.md`](../recovery/authority-rotation-planning.md).

## Confidence

Label every finding (see
[`../core/confidence-model.md`](../core/confidence-model.md)):

```text
Confidence: CONFIRMED               authority/hash read on-chain and reproduced
Confidence: LIKELY                  strong but single-source evidence
Confidence: POSSIBLE                consistent with the symptom, not established
Confidence: UNKNOWN                 no basis yet
Confidence: INSUFFICIENT_EVIDENCE   name the missing input that would resolve it
```
