# Comms: Internal War-Room Update

A tight, repeatable internal update so everyone in the room shares one picture.
Internal updates can be franker than public ones, but still separate fact from
hypothesis and never contain secrets.

## Structure

```text
Time / update #:
Severity (and any change):
Confirmed facts:
Current hypotheses:
What we ruled out:
Actions in progress (with owners + risk labels):
Decisions needed (and who decides):
Evidence still needed:
Next update at:
```

## Rules

- Label confidence on every claim; keep "confirmed" and "suspected" visibly
  separate.
- Attach an owner to every in-progress action and a deadline to every decision
  needed.
- No secrets, keys, or seeds in the channel — even internally.
- Keep cadence predictable; a steady "no change, next update at X" beats silence.

## Cadence

```text
SEV0/SEV1   every 15-30 min, or on any material change
SEV2        every 30-60 min
```

Mirror key decisions into [`../core/decision-log.md`](../core/decision-log.md).
For a phone-sized version, use
[`mobile-war-room-update.md`](mobile-war-room-update.md). When ready to speak
publicly, switch to
[`public-status-update.md`](public-status-update.md).
