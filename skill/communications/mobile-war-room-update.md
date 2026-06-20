# Comms: Mobile War-Room Update

A phone-sized internal update for when the responder is away from a desk —
short enough to thumb-type, structured enough to stay useful. Same discipline as
the full internal update, fewer words.

## Format

```text
SEV<n> | upd #<k> | <time>
Facts: <1-2 confirmed items>
Suspect: <current top hypothesis + confidence>
Doing: <action in progress + owner + risk label>
Need: <one decision or evidence item>
Next: <time>
```

## Example

```text
SEV1 | upd #3 | 14:20 UTC
Facts: outflow CONFIRMED from treasury; signer not a known admin.
Suspect: authority compromise (LIKELY).
Doing: drafting containment proposal (@founder) [PREPARE_ONLY][MULTISIG_REQUIRED].
Need: 2nd multisig signer online.
Next: 14:40 UTC.
```

## Rules

- Confidence label on the hypothesis; risk label on the action.
- No secrets, ever — not even on mobile, not even "just this once".
- One decision or evidence ask per update; keep it skimmable.
- Promote to the full [`internal-war-room-update.md`](internal-war-room-update.md)
  once back at a desk, and mirror decisions to
  [`../core/decision-log.md`](../core/decision-log.md).
