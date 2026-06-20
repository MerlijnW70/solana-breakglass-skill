# Tests: Expected Routing

Routing assertions for Breakglass. Each row states the trigger and the module
that should be loaded. These are behavioral specs an agent (or a reviewer)
checks the skill against — route by user type first, then by symptom.

## User-type routing

```text
"my wallet / my funds / I'm a user"      -> skill/modes/user-safety-mode.md
"users are complaining / should we post" -> skill/modes/founder-first-10.md
"here are logs / tx signature / Anchor"  -> skill/modes/engineer-debug-mode.md
"I'm solo / small team"                  -> skill/modes/solo-operator-mode.md
"support / a user DM'd us"               -> skill/communications/support-macros.md
"before launch / review our setup"       -> skill/modes/readiness-review-mode.md
"after the incident / postmortem"        -> skill/communications/postmortem-template.md
```

## Symptom routing

```text
failed transaction        -> skill/incidents/failed-transactions.md
                          +  skill/forensics/transaction-log-analysis.md
fund movement             -> skill/incidents/suspicious-drain.md
                          +  skill/forensics/account-diff-analysis.md
unsafe wallet prompt      -> skill/incidents/frontend-compromise.md
upgrade/admin risk        -> skill/incidents/compromised-upgrade-authority.md
                          +  skill/forensics/program-authority-analysis.md
explorer disagreement     -> skill/incidents/rpc-degradation.md
chain halted / restart    -> skill/incidents/cluster-halt.md
bridge / cross-chain      -> skill/incidents/bridge-exploit.md
governance attack         -> skill/incidents/governance-attack.md
oracle / AMM manipulation -> skill/incidents/oracle-amm-manipulation.md
social account takeover   -> skill/incidents/social-account-takeover.md
public pressure           -> skill/communications/public-status-update.md
anything else / novel     -> skill/incidents/unknown-incident.md  (catch-all)
```

## Severity routing

```text
money lost now / key compromised confirmed   -> SEV0
credible exploit / suspected authority comp.  -> SEV1
many users / failed tx / RPC, no fund loss    -> SEV2
isolated, workaround, no funds at risk        -> SEV3
pre-launch / hygiene / tabletop               -> SEV4
```

## Default load

```text
On any incident start, load ONLY:
  skill/core/operating-model.md
  skill/core/severity-model.md
  skill/core/action-safety-model.md
  skill/routers/user-type-router.md
  skill/routers/symptom-router.md
Deeper modules load only when routed.
```

## How to use

For each scenario in [`scenarios/`](scenarios/), confirm the actual routing
matches "Expected routing" and the severity matches "Expected severity". A
mismatch is a routing regression.
