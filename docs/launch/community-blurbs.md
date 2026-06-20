# Community Blurbs

Short, non-spammy posts for Solana community channels. Lead with value, disclose
that you maintain it, and ask for feedback rather than just dropping a link.

## Discord / Superteam (tooling or security channel)

```text
⚡ Breakglass for Solana — an open-source emergency copilot for the first 10
minutes of a Solana incident.

You describe what's happening (failed txs after a deploy, a suspicious drain, a
compromised upgrade authority, an RPC/explorer mismatch, a sketchy wallet
prompt) and it routes to the right playbook + hands back a calm card: 3 safe
actions, 3 things to collect, 3 things NOT to do — every action labeled by risk,
every conclusion by confidence.

It's read-only by design: never moves funds, submits txs, rotates authorities,
or asks for keys/seeds. It plans; humans execute. MIT, independently eval'd 11/11.

Built it after watching teams freeze (or make things worse) in minute one. Would
love feedback from anyone who's run incident response on Solana — what's missing?

github.com/MerlijnW70/solana-breakglass-skill
```

## Reddit (r/solanadev) — title + body

```text
Title: Open-source incident-response copilot for Solana (read-only, never moves funds)

Body:
I kept seeing teams panic in the first 10 minutes of a Solana incident, so I
built a free playbook-driven copilot for it. You describe the incident and it
gives a calm, skimmable card — severity, 3 safe actions, 3 things to collect,
3 not to do — with read-only verification first and no autonomous on-chain
actions. Covers failed txs, drains, compromised authorities, RPC issues, and
frontend compromise, plus comms and postmortems. MIT, feedback welcome.
(Disclosure: I maintain it.)
```

## Solana Stack Exchange — answer template

Use when someone asks a real incident question (failed tx, missing funds,
explorer/wallet disagreement). Answer their question first; mention the tool
once, with disclosure.

```text
Mid-incident, the safe first move is read-only triage: confirm the real state
on-chain before acting, and don't take irreversible steps (e.g. revoking an
upgrade authority) on a hunch.

For your case — <2-3 specific bullets answering their exact question> —

There's a free, open playbook that walks the first 10 minutes of this class of
incident: <link to the specific incidents/ module>. (Disclosure: I maintain it.)
```

## Etiquette

- Don't post the identical blurb everywhere — tailor the first line per channel.
- In security/dev communities, the read-only / never-moves-funds guarantee is
  the credibility hook; lead with it.
- Always disclose you maintain it. Solana security folks notice undisclosed
  self-promotion.
