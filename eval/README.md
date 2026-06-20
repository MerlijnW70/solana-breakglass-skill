# Breakglass Eval

A repeatable, bias-resistant evaluation of the Breakglass skill against the
scenarios in [`../tests/scenarios/`](../tests/scenarios/). Use it after editing
any skill file to confirm routing, severity, expected behavior, and — most
importantly — the safety guardrails still hold.

## How it works

For every scenario, the eval runs two **separate** agents:

1. **Blind responder** — sees only the scenario's user input, drives the skill
   from `skill/SKILL.md`, and produces a response. It is explicitly barred from
   reading `tests/`, so it never sees the answer key.
2. **Independent grader** — reads that scenario's spec rubric (Expected routing
   / severity / behavior / forbidden) and scores the responder's output.

Nobody grades their own work, and the responder is blind to the rubric, so a
pass reflects the skill actually behaving — not an author marking their own
homework. The scenario list is **discovered at run time** from
`tests/scenarios/*.md`, so adding or editing a scenario is automatically covered.

## Running it

This is a Claude Code workflow (it orchestrates agents), launched with the
`Workflow` tool — not a plain shell script:

```text
Workflow({ scriptPath: "<repo>/eval/breakglass-eval.workflow.js" })
```

Ask Claude Code to "run the Breakglass eval" and it will invoke the above. The
workflow runs in the background and reports a per-scenario verdict table when it
finishes; watch live progress with `/workflows`.

To iterate after editing the script, re-invoke `Workflow` with the same
`scriptPath`.

## Cost

It spawns roughly `1 + 2N` agents (one discovery agent plus a responder and a
grader per scenario). For the current scenario set that is ~24 agents. Run it
when you have changed skill behavior, not on every trivial edit.

## Reading the result

The workflow returns:

```text
passed   number of scenarios where all four dimensions passed
total    number of scenarios graded
failures list of scenario names that failed
graded   per-scenario verdict: routing/severity/behavior/forbidden + summary
```

A scenario is `PASS` only if all four dimensions pass; any present forbidden
behavior fails the `forbidden` dimension and the scenario.

## Relationship to the gate

The nohalo gate (`nh check`) covers static quality — Markdown/Bash hygiene and
the installer test. This eval covers **behavioral** quality, which a linter
cannot judge. They are complementary: run the gate on every change, run this
eval when skill behavior changes.

## Scope and honesty

The grader is an LLM, so treat verdicts as strong signal, not proof. A failing
scenario usually means one of two things: the skill genuinely misbehaves, or the
scenario spec and the skill disagree at some seam (a useful finding either way —
fix whichever is wrong). Keep the four rubric sections in each scenario spec
clear and bounded so grading stays consistent.
