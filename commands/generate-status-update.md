# Command: generate-status-update

Draft a public status update that is timely, honest, and free of overclaims.

## Purpose

Produce a public update in the standard structure, with claims held at their true
confidence level and the required "do not" rules enforced.

## When to use

You need to post publicly during an incident, or to draft a holding statement
while you decide whether to post.

## Inputs

Current known facts (with confidence), what is under investigation, user impact,
the one safe user action, and the next-update time.

## Output format

```text
Status:
What we know:
What we are investigating:
User impact:
What users should do:
What users should not do:
Next update:
```

## Safety rules

```text
- Do not promise reimbursement.
- Do not assign blame.
- Do not reveal exploit details before mitigation.
- Do not say funds are safe unless evidence supports it.
- Do not say resolved until monitoring confirms it.
- Always include the anti-scam reminder and a next-update time.
```

## Referenced skill files

```text
skill/communications/public-status-update.md
skill/decisions/public-status.md
skill/decisions/warn-users.md
skill/modes/user-safety-mode.md
skill/communications/plain-language-glossary.md
```
