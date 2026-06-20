# Decision Card: Pause Frontend

A fast, usually reversible way to reduce user risk while you investigate. Taking
the frontend down (or to a safe maintenance page) stops users from signing
unsafe transactions without touching on-chain state.

## Card

```text
Decision:             Pause the frontend (maintenance page / disable signing).
Default:              Pause when a signing prompt, build, or destination looks
                      unsafe and you cannot yet confirm it is safe.
Trigger to do it:     Withdrawal/approval preview to an unknown destination;
                      unexpected build or DNS/CDN change; credible compromise
                      report; users reporting unexpected wallet prompts.
Trigger not to do it: The chain/frontend is verified healthy and the issue is an
                      RPC or explorer visibility problem (see rpc-degradation).
Risk:                 [REVERSIBLE][PUBLIC_COMMS] — visible outage; pair with a
                      short, honest holding statement.
Required approver:    Founder/operator on call (or solo operator). No multisig
                      needed to pause a frontend.
Suggested wording:    "We've temporarily paused <product> while we investigate a
                      potential issue. Your funds are not affected by this pause.
                      Do not sign transactions on any site claiming to be us.
                      Next update by <time>."
```

## Notes

- Pausing is reversible and low-regret; prefer it over `[IRREVERSIBLE]` actions
  while facts are still `POSSIBLE`/`UNKNOWN`.
- Do not claim "funds are safe" unless evidence supports it — say the *pause*
  does not move funds, which is true.
- If the suspected cause is a frontend compromise, work
  [`../incidents/frontend-compromise.md`](../incidents/frontend-compromise.md)
  before un-pausing, and verify the build hash first.
- Record the decision and its reversal condition in
  [`../core/decision-log.md`](../core/decision-log.md).
