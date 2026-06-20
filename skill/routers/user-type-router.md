# User-Type Router

Route by **who** is asking before routing by what is wrong. The same incident
needs different first words for a scared end user, a founder under public
pressure, and an engineer holding logs. Pick the closest match; when ambiguous,
ask one clarifying question.

## Routing table

```text
"I am a user / my wallet / my funds"            -> modes/user-safety-mode.md
"Users are complaining / should we post /
 what do we say"                                -> modes/founder-first-10.md
"Here are logs / tx signature / Anchor error"   -> modes/engineer-debug-mode.md
"I'm alone / solo / small team"                 -> modes/solo-operator-mode.md
"Support / a user reported / macro reply"       -> communications/support-macros.md
"After the incident / postmortem"               -> communications/postmortem-template.md
"Before launch / review our setup"              -> modes/readiness-review-mode.md
```

## Signals

- **End user** — first person about their own wallet/funds; no operator access.
  Route to [`../modes/user-safety-mode.md`](../modes/user-safety-mode.md).
- **Founder / operator** — talks about users, comms, decisions, "we". Route to
  [`../modes/founder-first-10.md`](../modes/founder-first-10.md).
- **Engineer** — pastes signatures, logs, Anchor errors, IDLs. Route to
  [`../modes/engineer-debug-mode.md`](../modes/engineer-debug-mode.md).
- **Solo builder** — one person doing every role. Route to
  [`../modes/solo-operator-mode.md`](../modes/solo-operator-mode.md).
- **Support / moderator** — fielding user reports at scale. Route to
  [`../communications/support-macros.md`](../communications/support-macros.md).
- **Pre-launch team** — no live incident; reviewing setup. Route to
  [`../modes/readiness-review-mode.md`](../modes/readiness-review-mode.md).

## After user type

Once the entry mode is loaded, route by symptom with
[`symptom-router.md`](symptom-router.md) and set tempo with
[`severity-router.md`](severity-router.md). User type sets tone; symptom selects
the playbook; severity sets the speed.
