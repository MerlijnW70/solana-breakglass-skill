# Response Format

How to render the user-facing **first response** during an active incident:
clean, skimmable, and calm. This is the presentation layer — what a stressed
founder or engineer actually reads. It carries the same content as the 3-3-3
rule and the standard output contract in
[`operating-model.md`](operating-model.md), but formatted so the next safe
action is obvious in seconds.

Use the **card** for the first response (especially SEV0/SEV1). Expand into the
full output contract only after the card, or when a deeper module is loaded.

## The incident card

```text
<sev> SEV<n> · <incident class> · confidence: <LABEL>

DO NOW
  1. <lowest-risk action first>            [<risk tag>]
  2. <action>                              [<risk tag>]
  3. <action>                              [<risk tag>]

NEED                       DON'T
  • <evidence to collect>    • <highest-regret mistake>
  • <evidence>               • <mistake>
  • <evidence>               • <mistake>

NEXT  <who to pull in / recommended next module>
```

Rules:

- Lead with the card. For SEV0/SEV1 nothing goes above it.
- Exactly **3** items in DO NOW, NEED, and DON'T (the 3-3-3 rule).
- DO NOW is ordered **lowest-risk first** — read-only and prepare steps before
  anything reversible, irreversible last.
- One line per item. No paragraphs inside the card.
- Plain, calm language. No hype, no jargon dump, no walls of text.
- The header confidence is the overall read; per-claim confidence lives in the
  detail below the card.

## Severity at a glance (the header)

```text
🔴 SEV0  active critical — fund loss / key compromise / exploit happening now
🟠 SEV1  high risk — suspected compromise, loss not yet confirmed
🟡 SEV2  major degradation — many users affected, no confirmed fund loss
🔵 SEV3  limited — isolated, has a workaround, no funds at risk
⚪ SEV4  readiness / tabletop — no live incident
```

## Risk tags (plain words, same meaning as the action labels)

The user reads the friendly tag; it maps 1:1 to a label in
[`action-safety-model.md`](action-safety-model.md).

```text
[read-only]        observes only, changes nothing        = [READ_ONLY]
[prepare]          drafts a plan for humans to review     = [PREPARE_ONLY]
[reversible]       can be cleanly undone                  = [REVERSIBLE]
[irreversible]     cannot be undone                       = [IRREVERSIBLE]
[needs multisig]   requires multisig/governance approval  = [MULTISIG_REQUIRED]
[security review]  needs a security engineer first        = [SECURITY_REVIEW]
[legal review]     needs legal first                      = [LEGAL_REVIEW]
[public]           is or affects a public statement       = [PUBLIC_COMMS]
[do not automate]  humans only, never an agent/script     = [DO_NOT_AUTOMATE]
```

## Audience variants

Same card, tuned to who is reading.

**Founder / operator** — the default card above.

**End user** (from [`../modes/user-safety-mode.md`](../modes/user-safety-mode.md))
— drop the SEV jargon, lead with safety:

```text
DO NOW
  1. Disconnect your wallet and stop signing.
  2. Use only the official site — type the address yourself.
  3. Save the transaction signature, the URL, and the time.

DON'T
  • Never share your seed phrase or private key — no one legit will ask.
  • Don't trust a DM offering to "recover" your funds.

SAFE TO SHARE
  • transaction signature · the URL you used · wallet app · approx time
```

**Engineer** (from [`../modes/engineer-debug-mode.md`](../modes/engineer-debug-mode.md))
— header is the failure class, body is the next checks:

```text
🟡 <FAILURE_CLASS> · confidence: <LABEL>

NEXT 3 CHECKS (read-only)
  1. <check>
  2. <check>
  3. <check>

NEED  • <missing input>     PROBABLE FIX  <area>
```

## Worked example

```text
🟠 SEV1 · Suspicious drain · confidence: POSSIBLE

DO NOW
  1. Confirm the outflow on-chain and size it       [read-only]
  2. Check the signer against known admins          [read-only]
  3. Draft a containment proposal for the multisig   [prepare]

NEED                       DON'T
  • the signing authority    • move or "rescue" funds
  • a full account diff      • name or attribute an attacker
  • recent authority changes • share or request any key/seed

NEXT  pull in eng + a multisig signer · forensics/account-diff-analysis.md
```

After the card, fill the full
[output contract](operating-model.md) as the structured record.
