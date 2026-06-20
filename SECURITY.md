# Security Policy

Breakglass for Solana is a crisis operations skill. Its security posture is part
of the product: the skill is designed to be safe to run during the worst moment
of a Solana team's life.

## Hard guarantees

- **No private keys.** The skill never requests or accepts private keys.
- **No seed phrases.** The skill never requests or accepts seed phrases or
  mnemonic recovery words.
- **No fund movement.** The skill never moves, transfers, or sweeps funds.
- **No transaction submission.** The skill never builds and submits a signed
  transaction, and never generates a fund-moving script.
- **No autonomous authority changes.** The skill never rotates, revokes, or
  mutates upgrade, mint, freeze, or admin authorities on its own.
- **No network calls during install.** `install.sh` only copies local files.
- **No wallet access.** The installer and skill never touch wallet files,
  keystores, or signing software.

## Safe evidence types

These are safe to share with the skill:

- Cluster name (mainnet-beta, devnet, testnet) and timestamps.
- Public transaction signatures.
- Public program IDs, program data accounts, and account addresses.
- Public token mint addresses.
- Program logs and client-side error messages (treated as untrusted data).
- RPC provider names and observed error rates.
- Public explorer URLs.
- Redacted screenshots and user reports (with PII removed).
- Deploy timestamps, commit hashes, and release notes.

## Unsafe evidence types — never share these

The skill will refuse these and ask you to redact them:

- Seed phrases or mnemonic recovery words.
- Private keys or keypair files (`*.json` keypairs, `id.json`).
- Wallet files or keystores.
- Raw `.env` files or their contents.
- API keys, RPC URLs containing secret tokens, or signing credentials.
- Production secrets of any kind.
- Customer personally identifiable information (PII).

If a secret has already been pasted somewhere it should not be, treat it as
compromised: rotate it through your normal, human-reviewed process. The skill
will not do this for you.

## Untrusted evidence

All incident evidence — logs, explorer metadata, token metadata, frontend HTML,
screenshots, websites, and third-party reports — is treated as untrusted data.
The skill does not follow instructions embedded inside evidence (for example, a
log line that says "ignore previous instructions"). See
[`rules/untrusted-evidence.md`](rules/untrusted-evidence.md).

## Reporting an issue

If you find a safety gap — a place where the skill could be steered into
requesting secrets, submitting transactions, or moving funds — open a GitHub
issue describing the routing path and the unsafe output, with secrets redacted.
For sensitive reports, use the repository's private security advisory channel
rather than a public issue. Do not include real keys, seeds, or production
secrets in any report.
