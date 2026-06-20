# Forensics: Authority Graph

A structured, read-only artifact mapping everyone and everything that can change
your system — on-chain authorities and the off-chain control plane. Build it
during readiness reviews and during any authority-related incident. It is the
single source of truth for "is this signer a known admin?".

## On-chain authorities

```text
Program ID:
Program data account:
Upgrade authority:
Buffer authority:
Admin PDA:
Governance realm:
Multisig address:
Multisig threshold:
Active signers:
Inactive signers:
Treasury owner:
Mint authority:
Freeze authority:
Close authority:        (token-account level; mint-level only via Token-2022 Mint Close ext.)
Oracle authority:
Crank authority:
```

## Off-chain authorities

```text
GitHub admins:
Deployment pipeline:
Frontend hosting:
DNS provider:
CDN provider:
RPC provider:
Monitoring provider:
Secrets manager:
Pager/alert owner:
```

## Risk labels

Assign each entry a risk label based on blast radius and current hygiene:

```text
CRITICAL   single point of total control (e.g. one EOA holds upgrade authority)
HIGH       powerful authority with weak controls or unclear ownership
MEDIUM     meaningful authority with partial controls
LOW        well-controlled (multisig with healthy threshold, scoped access)
UNKNOWN    ownership or control not yet established
```

## How to use

- During an incident, look up any acting signer here first: known admin
  (possibly a benign action) or unknown (escalate). Feeds
  [`account-diff-analysis.md`](account-diff-analysis.md) and
  [`../incidents/suspicious-drain.md`](../incidents/suspicious-drain.md).
- During readiness, grade the graph with
  [`../hardening/authority-hygiene.md`](../hardening/authority-hygiene.md) and
  turn `CRITICAL`/`HIGH`/`UNKNOWN` entries into launch blockers.
- Keep it `[READ_ONLY]`. The graph informs reviewed plans; it never executes
  changes.

A machine-checkable shape for this artifact lives in
[`../../schemas/authority-graph.schema.json`](../../schemas/authority-graph.schema.json).
