# Recovery: Monitoring After Action

After an incident, tighten monitoring so the same class of problem is detected
faster next time. This converts a painful event into durable detection.

## What to add or tune

```text
Detection gap closed     an alert for the signal you wished you'd had
Failure-rate baseline    alert on transaction failure-rate spikes
Authority/admin actions  alert on admin instructions and program upgrades
Treasury movement        alert on large or unexpected treasury outflows
Mint/freeze use          alert on any mint or freeze authority action
Frontend/DNS/CDN change  alert on deploys and DNS/CDN record changes
RPC error-rate           alert on RPC error-rate spikes
Ownership                each alert has a named owner and a pager path
```

## Method

1. Start from the incident's detection failure: what signal would have caught it
   sooner? Add that alert first.
2. Reconcile against the full alert set in
   [`../hardening/monitoring-alerting.md`](../hardening/monitoring-alerting.md);
   close the gaps that mattered here.
3. Assign each alert an owner and a clear, low-noise threshold.
4. Feed the gaps into the postmortem's corrective actions with deadlines.

## Boundaries

Monitoring is observation; it is `[READ_ONLY]` with respect to the protocol. The
skill recommends alerts and ownership — it does not configure infrastructure or
hold credentials. Record the follow-ups in
[`../communications/postmortem-template.md`](../communications/postmortem-template.md).
