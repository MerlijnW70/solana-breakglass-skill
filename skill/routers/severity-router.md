# Severity Router

Severity sets the speed and the audience of the response. Estimate it from the
first answers, label the estimate with a confidence level, and re-estimate as
evidence arrives. When torn between two levels, choose the higher one and say so.
Full definitions live in [`../core/severity-model.md`](../core/severity-model.md).

## Quick triage questions

```text
1. Is user or protocol money being lost right now?      yes -> SEV0
2. Is a key/authority confirmed compromised?            yes -> SEV0
3. Is there a credible exploit report or suspected
   authority compromise, loss not yet confirmed?        yes -> SEV1
4. Are many users affected / transactions failing /
   RPC degraded, with no confirmed fund loss?           yes -> SEV2
5. Is it isolated, with a workaround and no funds
   at risk (or devnet/staging only)?                    yes -> SEV3
6. Is there no live incident (pre-launch, hygiene,
   tabletop)?                                            yes -> SEV4
```

Stop at the first `yes`. If question 1 or 2 is even *possible* but unconfirmed,
treat as SEV1 until ruled out.

## Tempo by severity

```text
SEV0  short, calm, directive; war room now; 3-3-3; read-only verify first
SEV1  near-SEV0; verify read-only before any state change; prep proposals
SEV2  stabilize, communicate, debug methodically
SEV3  normal engineering workflow; document and fix
SEV4  readiness review mode; no live incident
```

## Routing by severity

- **SEV0 / SEV1** — lead with the 3-3-3 rule from
  [`../core/operating-model.md`](../core/operating-model.md). Convene roles via
  the founder or solo modes. Record every decision in
  [`../core/decision-log.md`](../core/decision-log.md).
- **SEV2** — work the matching incident playbook and a public/internal update.
- **SEV3** — engineer debug mode is usually enough.
- **SEV4** — route to
  [`../modes/readiness-review-mode.md`](../modes/readiness-review-mode.md).

## Escalation triggers

Re-raise severity immediately if any appears: new evidence of fund loss, a
signer that is not a known admin, an unrecognized upgrade, a withdrawal preview
to an unknown destination, or a confirmed secret exposure. Record the change and
its evidence in the decision log.
