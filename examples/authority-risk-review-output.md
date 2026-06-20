# Example: Authority Risk Review Output

An illustrative, safe readiness review. Addresses are placeholders. Format
follows readiness review mode and the authority graph.

## Authority graph (excerpt)

```text
On-chain
  Program ID:            Prog1111...           LOW
  Upgrade authority:     single key Key1111... CRITICAL (sole EOA can upgrade)
  Mint authority:        multisig MS33333...   LOW (3-of-5)
  Freeze authority:      None                  LOW
  Treasury owner:        multisig MS33333...   LOW
Off-chain
  GitHub admins:         2 owners              MEDIUM (no review enforcement)
  DNS provider:          single personal acct  HIGH (unclear ownership, no 2FA noted)
  Deploy pipeline:       CI with shared token  HIGH
```

## Assessment

```text
Authority hygiene grade: C
Top risks:
  1. CRITICAL — upgrade authority is a single EOA. (CONFIRMED)
  2. HIGH — DNS owned by a personal account with unclear controls. (LIKELY)
  3. HIGH — deploy pipeline uses a shared token. (LIKELY)
Launch blockers:
  - Move upgrade authority to a multisig before mainnet.
  - Establish owned, 2FA-protected DNS control.
Quick wins:
  - Enforce PR review on the program repo.
  - Scope/rotate the CI deploy token; remove shared use.
Monitoring gaps:
  - No alert on program upgrade or admin instruction.
  - No alert on DNS/CDN change.
```

All recommendations are [PREPARE_ONLY]; authority changes are
[IRREVERSIBLE][MULTISIG_REQUIRED] human actions executed through the team's
reviewed process.
