# Example: Public Status Update

An illustrative public status update during an active investigation. Fictional.
Notice it promises nothing, blames no one, and keeps every claim at its true
confidence level.

## Post

```text
Status: Investigating

What we know: We're aware of reports of unexpected wallet prompts on our site
starting around 14:00 UTC. We've temporarily paused the site while we
investigate.

What we are investigating: The cause and scope. We have not confirmed how this
happened or how many users are affected.

User impact: If you used the site since 14:00 UTC, a transaction prompt may have
shown an unexpected destination. Funds already in the protocol are not affected
by the pause itself.

What users should do: Do not sign transactions on our site or any site claiming
to be us until we confirm it's safe. Review and revoke any approval you don't
recognize using a tool you trust and reach yourself.

What users should not do: Never share your seed phrase or private keys. We will
never DM you first or ask for them.

Next update: by 15:00 UTC.
```

## Why this is safe

- No "funds are safe" or "resolved" claim (would need CONFIRMED + validation).
- No blame, no attacker attribution, no reimbursement promise.
- One clear user action and one clear "do not".
- A committed next-update time. See
  [`../skill/communications/public-status-update.md`](../skill/communications/public-status-update.md).
