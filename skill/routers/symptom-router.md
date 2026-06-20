# Symptom Router

Once the user type is set, route by the observable symptom. Load the incident
playbook and the forensics artifact it pairs with — nothing else loads until the
symptom is clear. When two symptoms overlap, start with the one that has the
highest potential fund impact.

## Routing table

```text
Failed transaction(s)
  -> incidents/failed-transactions.md
  +  forensics/transaction-log-analysis.md

Unexpected fund movement
  -> incidents/suspicious-drain.md
  +  forensics/account-diff-analysis.md

Unsafe / unexpected wallet prompt
  -> incidents/frontend-compromise.md

Upgrade or admin authority risk
  -> incidents/compromised-upgrade-authority.md
  +  forensics/program-authority-analysis.md

Explorer / RPC disagreement
  -> incidents/rpc-degradation.md

Public pressure / needing a statement
  -> communications/public-status-update.md
```

## How to read a symptom

- **Failed transactions** — client errors, dropped/expired transactions,
  confirmation timeouts, Anchor constraint failures. Triage with
  [`../incidents/failed-transactions.md`](../incidents/failed-transactions.md).
- **Fund movement** — outflows nobody recognizes. Do not assume malice; an
  admin action can look like a drain. See
  [`../incidents/suspicious-drain.md`](../incidents/suspicious-drain.md).
- **Unsafe wallet prompt** — a signing request that does not match the intended
  action; a possible frontend compromise. See
  [`../incidents/frontend-compromise.md`](../incidents/frontend-compromise.md).
- **Upgrade / admin risk** — an unexpected upgrade, changed authority, or admin
  instruction. See
  [`../incidents/compromised-upgrade-authority.md`](../incidents/compromised-upgrade-authority.md).
  Never default to revoking an upgrade authority.
- **Explorer disagreement** — explorer, RPC, and wallet tell different stories.
  Often not an on-chain failure. See
  [`../incidents/rpc-degradation.md`](../incidents/rpc-degradation.md).
- **Public pressure** — the chain may be fine but the timeline is on fire. See
  [`../communications/public-status-update.md`](../communications/public-status-update.md).

## Set the tempo

Pair every route with [`severity-router.md`](severity-router.md). A failed
transaction at SEV3 and a failed transaction during an active drain are the same
symptom at very different speeds.
