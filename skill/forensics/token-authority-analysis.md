# Forensics: Token Authority Analysis

A read-only method for establishing control over SPL and Token-2022 mints: who
can mint, freeze, or close, and which extensions change the rules. Mint and
freeze authorities are common abuse surfaces.

## What to establish

```text
Mint address           the token mint in question
Token program          classic SPL Token vs Token-2022
Mint authority         who can mint new supply (or None)
Freeze authority       who can freeze token accounts (or None)
Close authority         who can close a token account; for a MINT only via the Token-2022 Mint Close extension
Supply                 current supply; any recent unexpected change?
Token-2022 extensions  transfer hooks, transfer fees, permanent delegate, etc.
```

## Why it matters

```text
Mint authority abuse   minting unlimited supply to dump or dilute
Freeze authority abuse freezing user accounts to trap funds
Permanent delegate     (Token-2022) can move tokens without the holder's sign-off
Transfer hook          custom logic on every transfer; review it
```

## Method

1. Read the mint account and its authorities (read-only).
2. Identify the token program and enumerate Token-2022 extensions if present.
3. Check whether mint/freeze authorities are held by a key, multisig, or `None`,
   and reconcile with [`authority-graph.md`](authority-graph.md).
4. For a suspected abuse, diff supply/state with
   [`account-diff-analysis.md`](account-diff-analysis.md).

## Boundaries

All steps are `[READ_ONLY]`. Any authority change is a reviewed plan, never an
automated action — see
[`../decisions/rotate-authority.md`](../decisions/rotate-authority.md).
Token-2022 extension behavior is version-sensitive; verify against the deployed
mint rather than assumptions
([`../hardening/maintenance.md`](../hardening/maintenance.md)).

## Confidence

Label every finding (see
[`../core/confidence-model.md`](../core/confidence-model.md)):

```text
Confidence: CONFIRMED               mint authorities/supply read on-chain
Confidence: LIKELY                  strong but single-source evidence
Confidence: POSSIBLE                consistent with the symptom, not established
Confidence: UNKNOWN                 no basis yet
Confidence: INSUFFICIENT_EVIDENCE   name the missing input that would resolve it
```
