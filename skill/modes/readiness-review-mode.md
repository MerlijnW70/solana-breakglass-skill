# Readiness Review Mode

For a team with no live incident who wants to be ready for one — typically
pre-launch or a periodic hygiene review (SEV4). Goal: grade the current setup,
name the launch blockers, and turn gaps into a short, owned to-do list.

## When to use

The user asks to review their setup, authority hygiene, monitoring, or incident
readiness before launch. Route here from
[`../routers/user-type-router.md`](../routers/user-type-router.md). This is
`READINESS_REVIEW` mode from
[`../core/operating-model.md`](../core/operating-model.md).

## Do not use when

There is a live incident. Route to the matching incident playbook via
[`../routers/symptom-router.md`](../routers/symptom-router.md) instead.

## Inputs

Use the authority review block from
[`../intake/authority-review-input.md`](../intake/authority-review-input.md) and,
if available, build a full picture with
[`../forensics/authority-graph.md`](../forensics/authority-graph.md).

## Output

```text
Authority hygiene grade:   (A/B/C/D, per hardening/authority-hygiene.md)
Top risks:                 (ranked; each with a risk label and confidence)
Launch blockers:           (must-fix before mainnet; nothing ships with these)
Quick wins:                (low-effort, high-value hardening you can do today)
Monitoring gaps:           (alerts you are missing; see monitoring-alerting.md)
Incident readiness gaps:   (roles, runbooks, comms, tabletop not yet in place)
```

## What to examine

- **On-chain authority hygiene** — upgrade/buffer authority owners, mint/freeze
  authorities, multisig threshold and active signers. See
  [`../forensics/program-authority-analysis.md`](../forensics/program-authority-analysis.md)
  and [`../forensics/token-authority-analysis.md`](../forensics/token-authority-analysis.md).
- **Off-chain control plane** — GitHub admins, deploy pipeline, frontend
  hosting, DNS/CDN, RPC, secrets manager, pager ownership.
- **Verified builds** — is the program verified and reproducible? See
  [`../forensics/verified-build-triage.md`](../forensics/verified-build-triage.md).
- **Monitoring and alerting** — coverage for failure spikes, admin/upgrade
  actions, treasury moves, mint/freeze use, frontend/DNS changes. See
  [`../hardening/monitoring-alerting.md`](../hardening/monitoring-alerting.md).
- **Incident readiness** — roles, decision cards, comms templates, and a
  rehearsed tabletop. See
  [`../hardening/tabletop-exercises.md`](../hardening/tabletop-exercises.md).

## Output discipline

Grade against [`../hardening/authority-hygiene.md`](../hardening/authority-hygiene.md).
Give every risk a confidence label and every recommended change a risk label.
Readiness work is `[PREPARE_ONLY]` planning — the team executes changes through
their own reviewed process.
