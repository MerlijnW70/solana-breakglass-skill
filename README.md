# Breakglass for Solana

> The Solana emergency copilot.

Breakglass for Solana is an evidence-first crisis operations skill for Solana
founders and engineers. It helps AI coding agents triage failed transactions,
suspicious drains, compromised authorities, RPC degradation, frontend
compromise, user communications, recovery planning, and postmortems — safely,
progressively, and **without autonomous on-chain actions**.

Breakglass for Solana helps AI coding agents answer one question during Solana
production stress:

> "What do we know, what is at risk, and what is the next safe action?"

## What it is

A Solana AI Kit skill: primarily Markdown, loaded progressively. The agent loads
a minimal router by default and pulls incident-specific playbooks only when a
situation is routed to them. It is a calm, structured operator — not an
autonomous actor.

## What problem it solves

During an incident, the hardest part is not fixing the bug — it is staying calm,
separating fact from fear, preserving evidence, and choosing the next safe step
without making things worse. Breakglass gives the agent (and the human reading
it) a disciplined triage loop: classify, label risk, label confidence, and act
read-only first.

## Who it helps

- **Founders / operators** — what to do in the first 10 minutes.
- **Engineers** — structured transaction and authority debugging.
- **Solo builders** — compressed incident roles for a team of one.
- **Support / moderators** — safe macros and user guidance.
- **Pre-launch teams** — readiness and authority-hygiene review.
- **Affected end users** — plain-language wallet safety.

## What it does not do

- Never requests seed phrases, private keys, wallet files, raw `.env` files, API
  keys, or production secrets.
- Never submits transactions or moves funds.
- Never generates autonomous fund-moving scripts.
- Never rotates, revokes, or mutates authorities automatically.
- Never makes legal conclusions or attributes attacks to real-world identities.
- Makes no network calls during install.

## Why it is Solana-specific

It speaks the surfaces an incident actually touches on Solana: program IDs and
program data accounts, upgrade and buffer authorities, PDAs, signers, writable
accounts and owners, recent blockhash and blockhash expiry, compute units and
priority fees, CPIs, Anchor constraints, IDL mismatches, SPL mint/freeze
authorities, Token-2022 extensions, associated token accounts, RPC commitment
levels (confirmed vs finalized), verified builds, and frontend build hashes.

## Main workflows

- **Founder First 10 Minutes** — first-response triage for operators.
- **Engineer Debug Mode** — structured transaction-failure debugging.
- **User Safety Mode** — plain-language guidance for affected users.
- **Authority Risk Review** — map on-chain and off-chain authorities.
- **Suspicious Drain Triage** — classify drains without overclaiming.
- **RPC False Positive Triage** — real chain failure vs RPC/index lag.
- **Frontend Compromise Triage** — DNS/CDN/build/adapter checks.
- **Postmortem Generator** — structured, blameless writeup.

## Install

```bash
./install.sh                 # installs to the default target
./install.sh /custom/path    # installs to a custom target
```

Default target: `$HOME/.solana-ai-kit/skills/solana-breakglass-skill`. The
installer copies Markdown and config files only — no network calls, no package
installation, no wallet access.

## Example prompts

- "Users say transactions are failing after our deploy. What now?"
- "Our treasury wallet just moved 40k USDC and nobody approved it."
- "Should we revoke our upgrade authority right now?"
- "Explorer says my transaction failed but my wallet shows it succeeded."
- "We are pre-launch — review our authority setup before mainnet."
- "Write me a status update; do not promise reimbursement."

## Repository structure

```text
skill/          progressive skill content (entry point: skill/SKILL.md)
  core/         operating model, severity, safety + confidence, evidence
  routers/      route by user type, symptom, severity
  modes/        one entry mode per user type
  intake/       copy-paste evidence intake blocks
  decisions/    decision cards (pause frontend, warn users, ...)
  incidents/    incident playbooks (loaded only when routed)
  forensics/    read-only analysis artifacts
  recovery/     human-reviewed recovery plans (never executes)
  communications/  internal, public, support, postmortem
  hardening/    readiness, monitoring, authority hygiene
commands/       task-shaped command specs
agents/         incident role definitions + handoff format
rules/          enforceable safety rules
tests/          routing + safety scenario specs
examples/       realistic, safe example outputs
schemas/        optional JSON schemas (structure only)
```

## Safety guarantees

Read-only by default. Evidence before advice. Every recommended action is
labeled by risk; every non-trivial conclusion is labeled by confidence. All
incident evidence — logs, explorer and token metadata, frontend HTML,
screenshots, third-party reports — is treated as untrusted data, and embedded
instructions inside it are never followed. See [`SECURITY.md`](SECURITY.md).

## Building this repo

This repository is developed under the [nohalo](https://github.com/MerlijnW70/nohalo)
quality gate. The build plan lives in
[`docs/breakglass-dev.md`](docs/breakglass-dev.md). Run `nh check` to grade a
change; it must be grade A to be done.

## License

MIT. See [`LICENSE`](LICENSE).
