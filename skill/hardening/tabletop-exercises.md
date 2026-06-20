# Hardening: Tabletop Exercises

Practice incidents before a real one. A tabletop is a low-stakes walkthrough of
a scenario that surfaces gaps in roles, decisions, comms, and tooling — when it
is cheap to find them. This is `TABLETOP_EXERCISE` mode.

## Ground rules

```text
Clearly labeled as a drill   every artifact says "DRILL" — never real comms.
No real actions               nothing is executed on-chain or published.
Realistic, not theatrical     use a plausible scenario and your real tools.
Timed                          run to a clock to test tempo and cadence.
Blameless debrief             capture gaps, not blame.
```

## Running one

1. Pick a scenario (see [`../../tests/scenarios/`](../../tests/scenarios/) for
   ready-made ones: tx failure after deploy, treasury drain, upgrade-authority
   compromise, RPC false positive, frontend compromise, whitehat disclosure).
2. Assign the roles from [`../../agents/`](../../agents/): incident commander,
   forensics, security, recovery, comms, support.
3. Inject the scenario; have the commander run the 3-3-3 first response and route
   via the [`../routers/`](../routers/).
4. Make decisions using the [`../decisions/`](../decisions/) cards and log them.
5. Draft (do not send) the internal and public updates.

## Debrief

```text
Where did routing or severity go wrong?
Which decision lacked a clear owner or trigger?
What evidence couldn't we get fast enough?
Which alert would have caught this sooner?
What will we change, who owns it, by when?
```

Feed the gaps into [`authority-hygiene.md`](authority-hygiene.md),
[`monitoring-alerting.md`](monitoring-alerting.md), and a real
[`../communications/postmortem-template.md`](../communications/postmortem-template.md)
-style writeup of the drill.
