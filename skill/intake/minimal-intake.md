# Minimal Intake

The four questions that change the next action. Ask these first, in any mode,
before pulling a deeper intake block. Do not interrogate — these are enough to
set severity and pick a route.

## The four questions

```text
1. Is user money at risk?          (yes / no / unsure)
2. Is the issue happening now?     (now / stopped / unsure)
3. Do you have any transaction
   signature?                      (paste it, or "no")
4. What changed recently?          (deploy, frontend, DNS, authority, config,
                                    dependency, nothing known)
```

## How the answers route

- **Money at risk + happening now** -> treat as SEV0/SEV1; go to
  [`../routers/severity-router.md`](../routers/severity-router.md) and the
  matching incident playbook immediately.
- **Have a signature** -> engineer path; pull
  [`transaction-triage-input.md`](transaction-triage-input.md).
- **Something changed (deploy/frontend/DNS/authority)** -> that change is the
  prime suspect; route by symptom with
  [`../routers/symptom-router.md`](../routers/symptom-router.md).
- **Unsure on everything** -> stay read-only, preserve evidence, and verify
  on-chain before any action.

## Safety note

Collect only safe evidence (see
[`../core/evidence-bundle.md`](../core/evidence-bundle.md)). Never ask for seed
phrases, private keys, wallet files, raw `.env`, API keys, or secrets — at any
point, in any mode.
