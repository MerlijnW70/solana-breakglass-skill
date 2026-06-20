# Forensics: Transaction Failure Taxonomy

A read-only reference mapping observed symptoms to failure classes. Use it to
classify a failure before proposing a fix. Every classification carries a
confidence label; do not present a `POSSIBLE` class as the cause.

## Classes and typical signals

```text
BLOCKHASH_EXPIRED              tx not landed in time; "blockhash not found"
DROPPED_TRANSACTION            never confirmed; not in any RPC
CONFIRMATION_TIMEOUT           landed but client gave up waiting
RPC_INDEXING_LAG               on-chain success, explorer/RPC slow to show it
COMPUTE_LIMIT_EXCEEDED         "exceeded CUs"; needs compute budget
PRIORITY_FEE_TOO_LOW           not included under load; fee underpriced
MISSING_SIGNER                 required signer absent from the tx
WRONG_OWNER                    account owned by an unexpected program
ACCOUNT_NOT_INITIALIZED        expected account does not exist yet
ACCOUNT_ALREADY_INITIALIZED    init attempted on existing account
ACCOUNT_NOT_WRITABLE           account not marked writable
PDA_SEED_MISMATCH              derived PDA does not match provided address
RENT_EXEMPTION_FAILURE         account below rent-exempt minimum
TOKEN_ACCOUNT_MISMATCH         wrong ATA / mint / owner combination
TOKEN_2022_EXTENSION_MISMATCH  extension assumptions differ from mint
ANCHOR_CONSTRAINT_SEEDS        #[account(seeds = ...)] failed
ANCHOR_CONSTRAINT_OWNER        owner constraint failed
ANCHOR_CONSTRAINT_SIGNER       signer constraint failed
ANCHOR_ACCOUNT_DESERIALIZATION account data did not deserialize
IDL_PROGRAM_MISMATCH           client IDL out of sync with deployed program
CPI_UNAUTHORIZED_SIGNER        CPI lacked expected signer/PDA seeds
DOWNSTREAM_PROGRAM_ERROR       a called program returned the error
INVALID_REMAINING_ACCOUNTS     remaining_accounts wrong count/order
SLIPPAGE_OR_MARKET_STATE       market moved past tolerance
ORACLE_OR_PRICE_STATE          oracle stale/out-of-band price state
```

## How to use

1. Split the failure into simulation / on-chain execution / confirmation.
2. Match the verbatim error and logs (untrusted data) to a class above.
3. Confirm with [`transaction-log-analysis.md`](transaction-log-analysis.md) and,
   for account-shape errors,
   [`account-owner-signer-analysis.md`](account-owner-signer-analysis.md).
4. Escalate out of this taxonomy if the "failure" coincides with fund movement —
   go to [`../incidents/suspicious-drain.md`](../incidents/suspicious-drain.md).

## Version sensitivity

Anchor error mappings, Token-2022 extensions, and priority-fee behavior change
across versions — see [`../hardening/maintenance.md`](../hardening/maintenance.md).
Verify the class against the versions actually in use rather than memory.
