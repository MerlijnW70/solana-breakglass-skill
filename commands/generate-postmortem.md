# Command: generate-postmortem

Draft a blameless postmortem from the evidence bundle and decision log.

## Purpose

Produce a structured, honest postmortem: timeline, root cause, what went well/
poorly, where detection and response failed, and owned, dated corrective
actions.

## When to use

After an incident is contained and recovery is validated.

## Inputs

The decision log, the evidence bundle, the timeline of actions, and the
validation results.

## Output format

```text
Summary / Impact / Detection
Timeline
Root cause (Trigger / Immediate cause / Contributing factors)
What went well / poorly
Where detection failed / Where response failed
User communication review
Authority/control-plane review
Corrective actions / Owners / Deadlines
Verification plan / Residual risk
```

## Safety rules

- Blameless: describe systems and process, not individuals.
- Evidence-based: label residual uncertainty; do not smooth over unknowns.
- No attribution of attackers to real-world identities; no legal conclusions.

## Referenced skill files

```text
skill/communications/postmortem-template.md
skill/core/decision-log.md
skill/core/evidence-bundle.md
skill/recovery/recovery-validation.md
skill/recovery/monitoring-after-action.md
skill/hardening/authority-hygiene.md
```
