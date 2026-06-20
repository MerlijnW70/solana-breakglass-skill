# Launch Thread (X / Twitter)

A ready-to-post thread. Attach a **screenshot of the incident card** to post 2
(the strongest visual). Keep each post under ~280 chars; tweak the handle and
links. Engage replies thoughtfully — don't mass-tag accounts.

## Thread

**Post 1/6 — hook**

```text
Your Solana treasury just sent 40k USDC to an address nobody recognizes.
It's minute one. What do you do?

Most teams freeze, guess, or make it worse.

Breakglass for Solana is an open-source emergency copilot for exactly this
moment. 🧵
```

**Post 2/6 — what it is (attach the card screenshot)**

```text
It's an evidence-first incident-response skill for Solana founders & engineers.

You describe the incident; it routes to the right playbook and hands back a
calm, skimmable card: the severity, 3 safe actions, 3 things to collect, and
3 things NOT to do.
```

**Post 3/6 — the safety hook**

```text
The most important part: it's read-only.

It NEVER moves funds, submits transactions, rotates authorities, or asks for
your keys/seed. No autonomous on-chain actions, ever. It plans; humans execute.

After the web3.js compromise and a year of drainers, that guarantee is the point.
```

**Post 4/6 — coverage**

```text
Playbooks for the incidents Solana actually faces:
• failed transactions after a deploy
• suspicious drains (user / treasury / mint / freeze)
• compromised upgrade authority
• RPC vs explorer disagreement
• frontend compromise / wallet-drainer
+ comms, recovery & postmortems.
```

**Post 5/6 — credibility**

```text
It separates confirmed facts from hypotheses, labels every action by risk and
every conclusion by confidence, and treats logs/metadata as untrusted — it
ignores injected "send me the key" lines.

Independently eval'd: 17/17 scenarios, blind-graded.
```

**Post 6/6 — call to action**

```text
Free, MIT, open to contributions — and to security researchers who want to poke
holes (see SECURITY.md).

If you run a Solana protocol, grab it before you need it:
github.com/MerlijnW70/solana-breakglass-skill

What incident should it cover next?
```

## Notes

- The single highest-leverage asset is the **card screenshot** on post 2 — make
  it crisp and legible. Generate it with `bin/render-card.sh` (`drain` / `failed`
  / `user`), then screenshot your terminal — or record a few seconds with
  asciinema for a GIF.
- A good first reply to your own thread: a 20-second screen capture of a triage
  in action (the eval or a live card render).
- Tag sparingly and only where genuinely relevant; a thoughtful reply to a
  security/devrel account beats a cold @-pile.
