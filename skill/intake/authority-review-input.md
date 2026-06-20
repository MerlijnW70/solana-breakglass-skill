# Authority Review Input

A copy-paste block for mapping who controls what — on-chain authorities and the
off-chain control plane. Use it for readiness reviews and for any incident where
an authority may be at risk. All fields are public or non-secret; never include
keys or secrets.

## Copy-paste block

```text
Program ID:
Cluster:
Current upgrade authority:
Governance/multisig address:
Token mint(s):
Treasury accounts:
Recent upgrades:
Known admin wallets:
Frontend deploy owner:
DNS/CDN owner:
Concern:
```

## Notes per field

- **Current upgrade authority** — the account that can replace program code.
  Note whether it is an individual key, a multisig, or governance.
- **Governance / multisig address** — include the threshold and the active vs
  inactive signers if you have them.
- **Token mint(s)** — capture mint authority and freeze authority status for
  each (and Token-2022 extensions if used).
- **Known admin wallets** — so an action by one of them is recognized as
  administrative, not mistaken for a drain.
- **Frontend deploy owner / DNS/CDN owner** — the off-chain control plane is as
  important as the on-chain one.

## Next

Build the full picture with
[`../forensics/authority-graph.md`](../forensics/authority-graph.md) and grade it
with [`../hardening/authority-hygiene.md`](../hardening/authority-hygiene.md). If
the concern is an active upgrade-authority risk, go to
[`../incidents/compromised-upgrade-authority.md`](../incidents/compromised-upgrade-authority.md)
— and never default to revoking the authority.
