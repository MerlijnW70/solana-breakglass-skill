# Hardening: Maintenance

What in this skill stays true over time, and what drifts with the ecosystem.
Lean on the stable surfaces for durable advice; verify the version-sensitive ones
against current tooling before relying on specifics.

## Stable surfaces

These reflect how Solana works and change rarely:

```text
accounts
owners
signers
writable accounts
transaction atomicity
upgrade authority concept
recent blockhash concept
```

Reasoning built on these (separate signer from owner, verify authority before
acting, transactions are atomic) ages well.

## Version-sensitive surfaces

These drift across releases, tools, and providers — confirm against what is
actually deployed:

```text
Solana CLI behavior
Anchor error mappings
Token-2022 extensions
priority fee recommendations
RPC provider APIs
verified build tooling
wallet adapter patterns
```

When a module gives a specific error mapping, fee figure, or tooling step, treat
it as illustrative and verify it against the current version in use.

## Maintaining the skill

- When a version-sensitive detail changes, update the specific module and note
  it here rather than scattering version caveats everywhere.
- Keep examples illustrative, not authoritative; never hardcode a dangerous
  command.
- Re-run the [`../../tests/`](../../tests/) routing and safety scenarios after
  edits to confirm behavior and safety still hold.
