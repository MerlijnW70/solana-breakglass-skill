# Decision Card: Public Status

Whether to publish a public status update now, and what it can safely say. A
timely, honest update builds trust; a premature or overclaiming one destroys it.

## Card

```text
Decision:             Publish a public status update.
Default:              Acknowledge early, commit to a next-update time, and say
                      only what you can support with evidence.
Trigger to do it:     Users are visibly affected or asking; silence is being
                      read as a cover-up; you can state a true, useful fact.
Trigger not to do it: You have nothing verified to add and no safe action to
                      give — but still set and honor a next-update time.
Risk:                 [PUBLIC_COMMS] — on the record; pair with [LEGAL_REVIEW]
                      for anything touching liability or reimbursement.
Required approver:    Founder/operator + comms owner. Security review before
                      revealing any incident detail.
Suggested wording:    Use the structure in communications/public-status-update.md
                      (Status / What we know / Investigating / Impact / Do /
                      Don't / Next update).
```

## Notes

- Follow the comms rules: do not promise reimbursement, do not assign blame, do
  not reveal exploit details before mitigation, do not say "funds are safe"
  without evidence, do not say "resolved" until monitoring confirms it. See
  [`../communications/public-status-update.md`](../communications/public-status-update.md).
- Always include a next-update time, even if the update is "still
  investigating". A predictable cadence is itself reassuring.
- Keep claims at their true confidence level — "we are investigating reports"
  (POSSIBLE) is honest; "no funds affected" (needs CONFIRMED) often is not.
- Log the published statement and its timestamp in
  [`../core/decision-log.md`](../core/decision-log.md).
