# Command: mobile-war-room-update

Produce a phone-sized internal incident update.

## Purpose

Generate a short, structured status line a responder can thumb-type away from a
desk, keeping the team in sync without losing rigor.

## When to use

During an active incident when the responder is mobile and a full internal
update is impractical.

## Inputs

Current severity and update number, 1-2 confirmed facts, the top hypothesis with
confidence, the action in progress with owner and risk label, the one decision/
evidence ask, and the next-update time.

## Output format

```text
SEV<n> | upd #<k> | <time>
Facts: <confirmed>
Suspect: <hypothesis + confidence>
Doing: <action + owner + risk label>
Need: <one decision/evidence ask>
Next: <time>
```

## Safety rules

- Confidence label on the hypothesis, risk label on the action.
- No secrets, ever — including on mobile.
- One ask per update; promote to the full internal update when back at a desk.

## Referenced skill files

```text
skill/communications/mobile-war-room-update.md
skill/communications/internal-war-room-update.md
skill/core/decision-log.md
```
