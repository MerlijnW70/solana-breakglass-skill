# Comms: Trust Recovery Update

The message after the incident is contained: what happened, what you fixed, and
what you are doing so it does not recur. This is where trust is rebuilt — through
specifics and follow-through, not reassurance.

## Structure

```text
What happened:        (plain-language, accurate, scoped)
Impact:               (who/what was affected; honest numbers)
What we did:          (containment and fix, at true confidence)
What we changed:      (concrete corrective actions, owned and dated)
What we're still doing: (open items + when they'll be done)
How to stay safe:     (the ongoing user guidance + anti-scam reminder)
```

## Rules

- Only publish once recovery is validated
  ([`../recovery/recovery-validation.md`](../recovery/recovery-validation.md)) —
  do not say "resolved" before monitoring confirms it.
- Specifics over reassurance: "we moved the upgrade authority to a 3-of-5
  multisig" rebuilds more trust than "we take security seriously".
- No reimbursement promises, no blame, no legal characterizations
  (`[LEGAL_REVIEW]` if liability is in question).
- Keep the anti-scam reminder: official channels only, no DMs, never asks for
  seed phrases.

## Source it from the postmortem

Draw the content from the
[`postmortem-template.md`](postmortem-template.md): corrective actions become
"what we changed", residual risk becomes "what we're still doing". Keep the
public version honest but free of exploit details that remain sensitive.
