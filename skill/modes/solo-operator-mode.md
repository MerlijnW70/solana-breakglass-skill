# Solo Operator Mode

For one person who is, right now, the entire incident team — commander,
engineer, comms, and support at once. Goal: compress the roles into the few
actions that matter and stop you from making an irreversible mistake while
overloaded.

## When to use

The user signals they are alone or a very small team: "I'm solo", "it's just
me", "small team, no security person". Route here from
[`../routers/user-type-router.md`](../routers/user-type-router.md).

## First response

```text
You appear to be operating solo.
Do only these 3 things first:
1. Preserve evidence.   Capture signatures, timestamps, and what changed. Do not
                        clean up or redeploy yet — you will need the evidence.
2. Reduce user risk.    [REVERSIBLE] steps only: a banner, a pause, a warning.
                        Buy time without burning anything.
3. Avoid irreversible actions. Do not revoke authorities, wipe state, or move
                        funds. [IRREVERSIBLE] decisions can wait for a second
                        set of eyes.
```

## Compressed roles

You cannot do everything, so do the highest-leverage version of each role:

```text
Commander -> set severity, pick the next single action, write it down.
Engineer  -> one [READ_ONLY] check at a time; confirm before you change state.
Comms     -> one honest holding statement; no promises; one update cadence.
Support   -> one pinned message pointing users to safety; mute the noise.
```

## Get a second set of eyes

`[IRREVERSIBLE]` and `[MULTISIG_REQUIRED]` actions are exactly where solo
operators get hurt. Before any of them:

- Draft the action as a [PREPARE_ONLY] proposal, not a live change.
- Ask a trusted peer, security contact, or your multisig co-signers to review.
- If no one is available, prefer the reversible mitigation and wait. A paused
  product is recoverable; a wrongly revoked authority may not be.

## Routing

- Set tempo with [`../routers/severity-router.md`](../routers/severity-router.md).
- Route by symptom with [`../routers/symptom-router.md`](../routers/symptom-router.md).
- Use one decision card at a time from [`../decisions/`](../decisions/).
- Keep a running [`../core/decision-log.md`](../core/decision-log.md) — when you
  are the only one, the log is your memory and your handoff.
