# User Report Intake

Questions support and moderators can ask an affected user to gather safe,
useful evidence — without ever asking for anything sensitive. Keep it short and
reassuring; a scared user will not answer a long form.

## Collection questions

```text
What action were you trying?
What wallet app?
Approximate time?
Transaction signature?
Screenshot?
Did you sign a transaction?
Did assets move?
Which URL did you use?
```

## Notes per field

- **What action / wallet app / time** — enough context to correlate with
  on-chain events and recent changes.
- **Transaction signature** — the single most useful safe artifact; ask for it
  first.
- **Which URL did you use** — critical for spotting a phishing or
  frontend-compromise pattern; ask for the exact address they typed or clicked.
- **Screenshot** — fine to share, but ask them to ensure no seed phrase or
  private key is visible.

## Hard boundary

Never ask a user for their seed phrase, private key, or wallet file — not to
"verify", "recover", or "help". Tell them outright that no real team will ever
ask. See [`../modes/user-safety-mode.md`](../modes/user-safety-mode.md) for the
warnings to send back, and
[`../communications/support-macros.md`](../communications/support-macros.md) for
ready replies.

## Next

If reports cluster around one URL, a bad signing prompt, or a recent deploy,
escalate to
[`../incidents/frontend-compromise.md`](../incidents/frontend-compromise.md) or
the matching playbook via
[`../routers/symptom-router.md`](../routers/symptom-router.md).
