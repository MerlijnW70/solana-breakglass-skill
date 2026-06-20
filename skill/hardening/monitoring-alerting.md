# Hardening: Monitoring and Alerting

The alerts that turn a silent incident into a paged one. Aim for high-signal
alerts on the events that precede or constitute an incident, each with a named
owner and a clear threshold.

## Core alerts

```text
transaction failure-rate spike   sustained rise above baseline
admin instruction                any privileged/admin instruction executes
program upgrade                   the program is upgraded
large treasury movement          outflow above a defined threshold
mint/freeze authority use         any mint or freeze authority action
frontend deploy                   a new frontend build is shipped
DNS/CDN change                    a DNS or CDN record/config changes
RPC error-rate spike              client-facing RPC error rate rises
```

## Designing each alert

```text
Signal       what on/off-chain event triggers it
Threshold    tuned to catch real events without alert fatigue
Owner        a named human and a pager path
Runbook      the first read-only check to run on fire
Baseline     what "normal" looks like, so spikes are meaningful
```

## Priorities

1. **Privileged actions** (admin instruction, upgrade, mint/freeze, large
   treasury move) — these are the highest-stakes and should always page.
2. **Control-plane changes** (frontend deploy, DNS/CDN) — cheap to watch, common
   compromise vectors.
3. **Health signals** (transaction and RPC failure rates) — catch SEV2
   degradation early.

## Boundaries

The skill recommends alerts, thresholds, and ownership; it does not configure
infrastructure or hold credentials. After an incident, close detection gaps via
[`../recovery/monitoring-after-action.md`](../recovery/monitoring-after-action.md).
Provider APIs change — keep alert wiring current per
[`maintenance.md`](maintenance.md).
