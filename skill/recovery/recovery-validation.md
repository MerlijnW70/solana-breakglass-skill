# Recovery: Recovery Validation

How to confirm a fix or containment actually worked before standing down or
saying "resolved". Recovery is not done when the change ships — it is done when
monitoring confirms the risk is gone.

## Validation checklist

```text
Root cause closed        the specific cause is fixed, not just the symptom
Build/state verified     deployed artifact hash matches expectation
Exposure removed         the unsafe path/authority/site is no longer reachable
No recurrence            failure-rate / movement is back to baseline
Monitoring confirms      alerts are green over a defined observation window
Evidence preserved       artifacts kept for the postmortem
```

## Method

1. Re-run the read-only checks that originally detected the problem; they should
   now be clean.
2. Confirm any deployed fix matches the expected verified build hash.
3. Watch the relevant metrics over a defined window (not a single sample) before
   declaring stability.
4. Only then update status to resolved — see the comms rule against premature
   "resolved" in
   [`../communications/public-status-update.md`](../communications/public-status-update.md).

## Boundaries

- Do not say "funds are safe" or "resolved" until evidence and monitoring
  support it; label residual uncertainty honestly.
- All validation is `[READ_ONLY]`.
- Set up or confirm ongoing monitoring with
  [`monitoring-after-action.md`](monitoring-after-action.md), then capture the
  whole event in
  [`../communications/postmortem-template.md`](../communications/postmortem-template.md).
