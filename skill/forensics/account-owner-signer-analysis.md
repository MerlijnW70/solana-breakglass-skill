# Forensics: Account, Owner, and Signer Analysis

A read-only method for the most common Solana failure family: an account is the
wrong owner, not writable, not a signer, or not the PDA the program expected.
These also distinguish a benign bug from an authority problem.

## What to check

```text
Owner            which program owns each account; matches expectation?
Signer           which accounts signed; is a required signer missing?
Writable         which accounts are writable; is a mutated account read-only?
PDA derivation   does the provided address match the derived seeds + program?
Account exists   is an expected account initialized (or wrongly already-init)?
ATA correctness  associated token account = (owner, mint, token program)?
```

## Method

1. List the instruction's accounts with their roles (signer/writable) and owners.
2. Compare each against what the program/IDL expects.
3. For PDA errors, re-derive from seeds + program ID and compare addresses.
4. For token errors, confirm the ATA matches owner, mint, and the correct token
   program (classic SPL vs Token-2022) — see
   [`token-authority-analysis.md`](token-authority-analysis.md).
5. Map the result to a class in
   [`transaction-failure-taxonomy.md`](transaction-failure-taxonomy.md).

## Escalation signal

If a signer is an account nobody recognizes, or an admin/authority account
signed something unexpected, this is no longer a routine bug. Route to
[`../incidents/suspicious-drain.md`](../incidents/suspicious-drain.md) or
[`../incidents/compromised-upgrade-authority.md`](../incidents/compromised-upgrade-authority.md)
and raise severity. All steps here are `[READ_ONLY]`.

## Confidence

Label every finding (see
[`../core/confidence-model.md`](../core/confidence-model.md)):

```text
Confidence: CONFIRMED               re-derived/verified directly (PDA reproduced,
                                    owner read on-chain)
Confidence: LIKELY                  strong but single-source evidence
Confidence: POSSIBLE                consistent with the symptom, not established
Confidence: UNKNOWN                 no basis yet
Confidence: INSUFFICIENT_EVIDENCE   name the missing input that would resolve it
```
