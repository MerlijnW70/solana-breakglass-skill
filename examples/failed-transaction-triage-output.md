# Example: Failed Transaction Triage Output

An illustrative, safe output for an engineer triaging failures after a deploy.
Values are fictional. Format follows engineer debug mode plus the incident output
contract.

## Triage

```text
Likely failure class:  IDL_PROGRAM_MISMATCH
Confidence:            LIKELY
Evidence:              Failures began ~2 min after the 14:02 UTC deploy; client
                       error "InstructionDidNotDeserialize"; clients still ship
                       the pre-deploy IDL.
Missing input:         Confirmation that the deployed program's IDL/version
                       differs from the client bundle.
Next 3 checks:         1. [READ_ONLY] Diff deployed program/IDL vs client IDL.
                       2. [READ_ONLY] Reproduce one failing signature in
                          simulation.
                       3. [READ_ONLY] Confirm no fund movement around the window.
Probable fix area:     Ship the updated IDL/client, or roll back the deploy.
Escalation risk:       Low — no fund movement observed; verify before closing.
```

## Output contract

```text
Incident class:        Failed transactions after deploy
Severity:              SEV2 (LIKELY)
Confidence:            LIKELY (cause), CONFIRMED (timing correlation)
Known facts:           Failures started post-deploy; deserialization error.
Unknowns:              Exact IDL delta; whether all clients affected.
Hypotheses:            Client/deployed IDL mismatch.
Evidence requested:    Deployed vs client IDL; one repro signature.
Immediate safe actions: Read-only IDL diff; reproduce; confirm no movement.
Actions not to take yet: No blind redeploy; no fee changes.
Escalation triggers:   Any sign of fund movement or authority change.
Recommended next module: forensics/transaction-log-analysis.md
Communication need:    SEV2 status update if many users affected.
Postmortem notes:      Add a deploy gate that ships client IDL atomically.
```
