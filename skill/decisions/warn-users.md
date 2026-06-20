# Decision Card: Warn Users

Whether and how to tell users to take a protective action. A warning can prevent
real losses — and a premature or wrong one can cause a panic or hand scammers a
script. Decide deliberately.

## Card

```text
Decision:             Publicly warn users to take a protective action.
Default:              Warn when users can take a concrete safe step that reduces
                      real, present risk. Stay silent-but-investigating when the
                      only honest message is "we don't know yet".
Trigger to do it:     A specific, verified user-facing risk (malicious site,
                      unsafe approval, drainer) where a clear user action helps.
Trigger not to do it: You cannot yet name a safe action; the risk is unconfirmed;
                      or a warning would reveal an unmitigated exploit path.
Risk:                 [PUBLIC_COMMS] — shapes user behavior and market reaction;
                      hard to walk back.
Required approver:    Founder/operator + whoever owns comms. Security review if
                      the warning could disclose exploit details.
Suggested wording:    "If you used <product> since <time>, <one specific safe
                      action>. Do not share your seed phrase or private keys with
                      anyone. We will never DM you first. Next update by <time>."
```

## Notes

- Give users **one** clear action, not a list. Under stress, one instruction is
  followed; five are ignored.
- Pair every warning with the anti-scam reminder (no DMs, no seed phrases) from
  [`../modes/user-safety-mode.md`](../modes/user-safety-mode.md).
- Do not promise reimbursement, assign blame, or say "resolved" — see the rules
  in [`../communications/public-status-update.md`](../communications/public-status-update.md).
- If the warning would reveal how to exploit an unmitigated bug, hold it for
  [SECURITY_REVIEW] and mitigate first.
- Log the decision in [`../core/decision-log.md`](../core/decision-log.md).
