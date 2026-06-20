# Comms: Postmortem Template

A blameless postmortem template. Focus on systems and process, not individuals.
Write it after the incident, from the evidence bundle and decision log, with
honest confidence labels.

## Template

```text
Summary:
Impact:
Detection:

Timeline:

Root cause:
  Trigger:
  Immediate cause:
  Contributing factors:

What went well:
What went poorly:
Where detection failed:
Where response failed:

User communication review:
Authority/control-plane review:

Corrective actions:
Owners:
Deadlines:
Verification plan:
Residual risk:
```

## Guidance

- **Blameless**: describe what the system allowed, not who erred. People act
  reasonably given the information and tools they had.
- **Evidence-based**: build the timeline from
  [`../core/decision-log.md`](../core/decision-log.md) and the evidence bundle;
  label residual uncertainty rather than smoothing it over.
- **Root cause vs trigger**: the trigger is what set it off; the immediate cause
  is the mechanism; contributing factors are what made it possible or worse.
- **Control-plane review**: revisit the authority graph — did on-chain or
  off-chain authority weaknesses contribute? Feed fixes into hardening.
- **Corrective actions** are concrete, owned, dated, and have a verification
  plan. An action with no owner and no date is a wish.

## After writing

Turn corrective actions into monitoring and hygiene improvements via
[`../recovery/monitoring-after-action.md`](../recovery/monitoring-after-action.md)
and [`../hardening/authority-hygiene.md`](../hardening/authority-hygiene.md). A
worked example lives in
[`../../examples/postmortem-example.md`](../../examples/postmortem-example.md).
Once recovery is validated, the public-facing writeup is the
[`trust-recovery-update.md`](trust-recovery-update.md).
