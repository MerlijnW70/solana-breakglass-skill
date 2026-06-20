# Command: authority-risk-review

Map and grade who controls a Solana protocol — on-chain authorities and the
off-chain control plane.

## Purpose

Produce an authority graph with risk labels, a hygiene grade, and a ranked list
of fixes and launch blockers.

## When to use

Pre-launch readiness, periodic hygiene reviews, or as the read-only first step
in an authority-related incident.

## Inputs

The authority review block: program ID, cluster, upgrade authority, governance/
multisig, token mints, treasury, recent upgrades, known admin wallets, frontend/
DNS/CDN owners, concern. See `skill/intake/authority-review-input.md`.

## Output format

```text
Authority graph (on-chain + off-chain, each risk-labeled):
Authority hygiene grade (A/B/C/D):
Top risks (ranked, + confidence):
Launch blockers:
Quick wins:
Monitoring gaps:
```

## Safety rules

- Read-only; never request keys or secrets.
- Recommendations are [PREPARE_ONLY]; authority changes are
  [IRREVERSIBLE][MULTISIG_REQUIRED] human actions.
- Never recommend revoking upgrade authority as a default.

## Referenced skill files

```text
skill/modes/readiness-review-mode.md
skill/intake/authority-review-input.md
skill/forensics/authority-graph.md
skill/forensics/program-authority-analysis.md
skill/forensics/token-authority-analysis.md
skill/forensics/verified-build-triage.md
skill/hardening/authority-hygiene.md
skill/hardening/monitoring-alerting.md
```
