# Contributing to Breakglass for Solana

Thank you for helping make Solana incident response safer. Breakglass is
primarily Markdown, and every module follows the same shape so an AI agent can
load it predictably under stress.

## Principles

- **Safety first.** Never add a module that requests secrets, submits
  transactions, moves funds, or mutates authorities. Re-read
  [`SECURITY.md`](SECURITY.md) before contributing.
- **Evidence before advice.** Modules ask for the minimum viable evidence, then
  give labeled, risk-rated next steps.
- **Progressive loading.** Keep `skill/SKILL.md` minimal. New playbooks load
  only when routed to.
- **Token-efficient.** Short, calm, operational language. No hype, no legal
  claims, no attribution, no fake certainty.
- **Real references only.** A module may only reference files that exist.

## Labels every module reuses

- **Action labels** (every recommended action): `[READ_ONLY]`,
  `[PREPARE_ONLY]`, `[REVERSIBLE]`, `[IRREVERSIBLE]`, `[MULTISIG_REQUIRED]`,
  `[SECURITY_REVIEW]`, `[LEGAL_REVIEW]`, `[PUBLIC_COMMS]`, `[DO_NOT_AUTOMATE]`.
- **Confidence labels** (every non-trivial conclusion): `CONFIRMED`, `LIKELY`,
  `POSSIBLE`, `UNKNOWN`, `INSUFFICIENT_EVIDENCE`.
- **Severity**: `SEV0`–`SEV4` per
  [`skill/core/severity-model.md`](skill/core/severity-model.md).

## Module template

Every new skill module should follow this shape. Render each line below as a
real Markdown heading (`#` for the title, `##` for each section):

```text
H1  <Module name>
H2  When to use
H2  Do not use when
H2  Inputs
H2  Severity rules
H2  Evidence required
H2  Safe actions
H2  Risky actions
H2  Actions not to take yet
H2  Output contract
H2  Tests
```

Incident modules must additionally end with the standard output contract from
[`skill/core/operating-model.md`](skill/core/operating-model.md).

## Repo conventions (the gate)

This repository is developed under the [nohalo](https://github.com/MerlijnW70/nohalo)
quality gate. Markdown must pass `md-lint` and `md-format`:

- Exactly one top-level `# ` H1 per file.
- The first non-blank line is a heading.
- No trailing whitespace, no hard tabs, no CRLF; files end with a newline.
- A `#` heading inside a fenced code block still counts as an H1 — use a label
  like `H1` / `H2` instead (as in the template above).

Shell files must pass `bash-lint` / `bash-build` / `bash-format`: a bash shebang
on line 1, `set -euo pipefail`, spaces (no tabs), LF endings.

Run `nh check` and reach grade A before opening a pull request.

## Pull request checklist

- [ ] Follows the module template (and the output contract, if an incident).
- [ ] Every recommended action carries a valid action label.
- [ ] Every non-trivial conclusion carries a confidence label.
- [ ] References only files that exist.
- [ ] Adds or updates a scenario in `tests/` if behavior or routing changed.
- [ ] No secrets, no fund-moving steps, no autonomous authority changes.
- [ ] `nh check` is grade A.
