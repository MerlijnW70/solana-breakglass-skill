# Incident: Oracle / AMM Manipulation

A price feed or liquidity pool is being manipulated to produce bad pricing —
driving wrongful liquidations, mispriced swaps, or drains of protocol or LP
funds. Confirm the price/state anomaly on-chain before acting; the fix usually
runs through a market pause or circuit-breaker, never a counter-trade.

## When to use

Prices, liquidations, or swap outputs look wrong; an oracle is stale or
out-of-band; or a pool's reserves/price moved in a way that's draining value.
Route here from [`../routers/symptom-router.md`](../routers/symptom-router.md).

## Do not use when

It's a plain failed transaction with no pricing/state anomaly (use
[`failed-transactions.md`](failed-transactions.md)); if funds are simply leaving
via a signer, start at [`suspicious-drain.md`](suspicious-drain.md).

## Inputs

The oracle account/provider and its authority, the affected market/pool and its
program, the suspect signatures, and the price/reserve values before and during.
Use [`../forensics/account-diff-analysis.md`](../forensics/account-diff-analysis.md)
and [`../forensics/token-authority-analysis.md`](../forensics/token-authority-analysis.md).

## Severity rules

```text
SEV0  active, ongoing loss via manipulation
SEV1  credible manipulation, loss suspected not confirmed
SEV2  price/state anomaly under verification, no confirmed loss
```

## Classify

```text
Oracle staleness / out-of-band price   Single-source oracle skew
AMM/liquidity reserve manipulation   Flash-loan-driven price swing
Liquidation cascade   Legitimate volatility misread as an attack
```

## Safe actions

- `[READ_ONLY]` Confirm the anomaly: compare the on-chain price/reserves against
  independent references; quantify the divergence and the value at risk.
- `[READ_ONLY]` Identify the oracle/pool authority and whether a pause or
  circuit-breaker exists.
- `[REVERSIBLE][MULTISIG_REQUIRED]` Prepare a reviewed pause of the affected
  market(s) / stop deposits; do not leave the bad price live if you can halt it.
- `[PREPARE_ONLY]` Draft containment with
  [`../recovery/containment-options.md`](../recovery/containment-options.md).

## Risky actions

- `[IRREVERSIBLE][MULTISIG_REQUIRED][SECURITY_REVIEW]` Oracle/parameter changes or
  market halts — reviewed, approved humans only.

## Actions not to take yet

- No counter-trade, arbitrage-back, or fund-moving script.
- No oracle/parameter change on low confidence without security review.
- No attacker attribution.

## Output contract

```text
Incident class:
Severity:
Confidence:
Known facts:
Unknowns:
Hypotheses:
Evidence requested:
Immediate safe actions:
Actions not to take yet:
Escalation triggers:
Recommended next module:
Communication need:
Postmortem notes:
```
