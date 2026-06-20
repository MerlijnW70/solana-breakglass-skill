# Incident: Suspicious Drain

Funds appear to be leaving wallets, a treasury, or program-owned accounts.
Treat this as potentially SEV0, but do not assume malice or attribute an
attacker. An admin action, a misread balance, or an integration can look like a
drain. Classify with evidence and confidence.

## When to use

Unexpected outflows, balances dropping, or users reporting missing funds. Route
here from [`../routers/symptom-router.md`](../routers/symptom-router.md).

## Do not use when

The symptom is a failed/invisible transaction with no actual movement (use
[`failed-transactions.md`](failed-transactions.md) or
[`rpc-degradation.md`](rpc-degradation.md)).

## Inputs

Signatures, affected accounts, token mints, and recent authority/admin context.
Diff balances with
[`../forensics/account-diff-analysis.md`](../forensics/account-diff-analysis.md)
and check signers/owners with
[`../forensics/account-owner-signer-analysis.md`](../forensics/account-owner-signer-analysis.md).

## Severity rules

```text
SEV0  active, ongoing loss of user or protocol funds
SEV1  loss suspected/credible but not yet confirmed, or confined and stopped
SEV2  movement explained as likely-legitimate but still under verification
```

## Classification

```text
User wallet drain
Treasury drain
Program-owned account drain
Token mint abuse
Freeze authority abuse
Oracle/price manipulation
Liquidity pool manipulation
Frontend wallet-drainer
Legitimate admin action mistaken as malicious
```

Always actively consider the last item: confirm with
[`../forensics/authority-graph.md`](../forensics/authority-graph.md) whether the
signer is a known admin before concluding an attack.

## Prohibited

The skill must never produce any of the following:

```text
counter-drain instructions
fund-moving scripts
attacker doxxing
unverified attribution
```

No "race the attacker" transactions, no scripts to sweep remaining funds, no
naming of real-world identities, no on-chain attribution presented as fact.

## Safe actions

- `[READ_ONLY]` Confirm the movement is real on-chain and quantify it.
- `[READ_ONLY]` Identify the signer/authority and check it against known admins.
- `[PREPARE_ONLY][MULTISIG_REQUIRED]` Draft a containment proposal (pause,
  stop deposits) for human + multisig review via
  [`../recovery/containment-options.md`](../recovery/containment-options.md).
- `[REVERSIBLE]` Reduce exposure: pause frontend / stop deposits using the
  decision cards.

## Risky actions

- `[IRREVERSIBLE][MULTISIG_REQUIRED]` Any on-chain containment that uses a
  privileged instruction — verify and review first; the skill plans only.

## Actions not to take yet

- Do not move "remaining" funds without a reviewed plan and approvers.
- Do not publicly attribute or name an attacker.
- Do not declare scope ("only X lost") before the diff is complete.

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
