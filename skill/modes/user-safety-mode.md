# User Safety Mode

For an affected end user. Goal: keep them safe, calm, and out of the reach of
scammers who circle every incident. Use plain language — no jargon, no blame, no
guarantees.

## When to use

Someone speaks in the first person about their own wallet or funds: "my
transaction failed", "my funds are missing", "I connected my wallet and now...".
Route here from
[`../routers/user-type-router.md`](../routers/user-type-router.md).

## What users should do now

- Stop and slow down. Most mistakes during a scare are rushed ones.
- Use only the official website and app — type the URL yourself; do not click
  links from DMs.
- If you think a site or approval is unsafe, disconnect your wallet and stop
  signing anything.
- Save evidence: the transaction signature, the website URL you used, the time,
  and a screenshot.

## What users should not do

- Do not share your seed phrase or private key with anyone — ever. No real
  support team will ask for it.
- Do not trust anyone who DMs you "support", even if they look official.
- Do not approve or sign a transaction you do not understand.
- Do not "validate", "sync", "migrate", or "unlock" your wallet on a site
  someone sent you — those are scam patterns.
- Do not send funds anywhere to "recover" or "protect" them.

## What evidence users can safely share

```text
Transaction signature
The website URL you used
Your wallet app name (e.g. Phantom, Solflare, Backpack)
Approximate time and time zone
A screenshot (with no secrets visible)
```

Safe to share: public addresses and signatures. Never share: your seed phrase,
private key, or wallet file.

## Seed phrase / private key warning

```text
Your seed phrase and private key control your funds completely. Anyone who gets
them can take everything. No legitimate team, support agent, or tool — including
this one — will ever ask for them. If you have entered them on a website or
shared them, treat that wallet as compromised and move to a new wallet using
your normal, trusted process.
```

## Fake support warning

```text
Scammers watch for incidents and DM users pretending to be support. Real support
will not DM you first, will not ask for your seed phrase, and will not send you a
link to "fix" your wallet. When in doubt, go to the official site yourself.
```

## Routing

If the user's report suggests a malicious site or signing prompt, the operator
should also see
[`../incidents/frontend-compromise.md`](../incidents/frontend-compromise.md).
Support teams can answer with
[`../communications/support-macros.md`](../communications/support-macros.md).
