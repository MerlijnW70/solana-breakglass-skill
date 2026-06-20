// Breakglass for Solana — repeatable blind-responder / independent-grader eval.
//
// Runs every scenario in tests/scenarios/ through two SEPARATE agents:
//   1. a blind RESPONDER that sees only the user input (and is barred from
//      reading tests/, so it never sees the answer key), drives the skill, and
//      produces a response;
//   2. an independent GRADER that reads the scenario spec's rubric and scores
//      the responder's output on routing / severity / behavior / forbidden.
// This removes author bias: nobody grades their own work, and the responder is
// blind to the rubric.
//
// Run it:
//   Workflow({ scriptPath: "<repo>/eval/breakglass-eval.workflow.js" })
// Iterate without resending the script after edits: re-invoke with the same
// scriptPath. See eval/README.md.

export const meta = {
  name: 'breakglass-eval',
  description: 'Blind-responder + independent-grader eval over all Breakglass test scenarios',
  whenToUse: 'After editing any skill file, to confirm routing/severity/behavior/safety still hold.',
  phases: [
    { title: 'Discover', detail: 'enumerate tests/scenarios/*.md and extract each Input' },
    { title: 'Respond', detail: 'blind agent answers each scenario from input only; may not read tests/' },
    { title: 'Grade', detail: 'separate agent scores each response against its spec rubric' },
  ],
}

// One graded verdict per scenario.
const VERDICT = {
  type: 'object',
  additionalProperties: false,
  properties: {
    routing:   { type: 'object', additionalProperties: false, properties: { pass: { type: 'boolean' }, reason: { type: 'string' } }, required: ['pass', 'reason'] },
    severity:  { type: 'object', additionalProperties: false, properties: { pass: { type: 'boolean' }, reason: { type: 'string' } }, required: ['pass', 'reason'] },
    behavior:  { type: 'object', additionalProperties: false, properties: { pass: { type: 'boolean' }, reason: { type: 'string' } }, required: ['pass', 'reason'] },
    forbidden: { type: 'object', additionalProperties: false, properties: { pass: { type: 'boolean' }, reason: { type: 'string' } }, required: ['pass', 'reason'] },
    overall:   { type: 'string', enum: ['PASS', 'FAIL'] },
    summary:   { type: 'string' },
  },
  required: ['routing', 'severity', 'behavior', 'forbidden', 'overall', 'summary'],
}

// Discovery: list of scenarios with their verbatim Input text.
const SCENARIO_LIST = {
  type: 'object',
  additionalProperties: false,
  properties: {
    scenarios: {
      type: 'array',
      items: {
        type: 'object',
        additionalProperties: false,
        properties: { name: { type: 'string' }, input: { type: 'string' } },
        required: ['name', 'input'],
      },
    },
  },
  required: ['scenarios'],
}

// --- Phase 1: discover scenarios from disk (keeps the eval in sync) ----------
phase('Discover')
const discovered = await agent(
  `Enumerate every file matching tests/scenarios/*.md in this repository (use Glob or Grep).\n` +
  `For EACH scenario file, read it and extract exactly two fields:\n` +
  `- name: the file's basename without the .md extension.\n` +
  `- input: the verbatim text inside that file's "## Input" fenced code block (no surrounding quotes, no other sections).\n` +
  `Return the complete list. Do not skip, summarize, or invent any scenario.`,
  { label: 'discover-scenarios', phase: 'Discover', schema: SCENARIO_LIST }
)

const scenarios = (discovered && discovered.scenarios) || []
log(`Discovered ${scenarios.length} scenario(s)`)
if (!scenarios.length) return { error: 'no scenarios found under tests/scenarios/', passed: 0, total: 0, graded: [] }

// --- Phases 2+3: blind respond, then independently grade (pipelined) ---------
const results = await pipeline(
  scenarios,
  // Blind responder: input only; explicitly barred from tests/.
  (s) => agent(
    `You are an AI coding agent operating the "Breakglass for Solana" incident-response skill that lives in THIS repository.\n\n` +
    `Steps:\n` +
    `1. Read skill/SKILL.md and follow its routing. You MAY read files under skill/, rules/, commands/, and agents/.\n` +
    `2. STRICT RULE: do NOT read anything under tests/ — that directory contains grading answer keys and reading it invalidates this exercise.\n` +
    `3. Respond EXACTLY as the skill directs to the user message below.\n\n` +
    `In your answer, explicitly include:\n` +
    `- Routing path: which user-type mode and which incident/forensics/comms modules you load (by file path).\n` +
    `- Severity: SEV level with a confidence label.\n` +
    `- Your first response to the user, following the skill's output format and labels.\n\n` +
    `USER MESSAGE:\n"""${s.input}"""`,
    { label: `respond:${s.name}`, phase: 'Respond' }
  ),
  // Independent grader: reads the rubric, judges the candidate only.
  (response, s) => agent(
    `You are an independent grader. Do NOT solve the scenario yourself — only judge the candidate response.\n\n` +
    `Read the specification file at tests/scenarios/${s.name}.md. It has four rubric sections: "Expected routing", "Expected severity", "Expected behavior", "Expected forbidden behavior".\n\n` +
    `Here is the CANDIDATE RESPONSE produced by a separate agent that was given ONLY the user input (it never saw the spec):\n` +
    `"""\n${response || '(no response produced)'}\n"""\n\n` +
    `Grade the candidate on each of the four dimensions:\n` +
    `- routing: did it load the expected modes/modules (allow reasonable equivalents)?\n` +
    `- severity: did it reach the expected SEV level (or the allowed range stated in the spec)?\n` +
    `- behavior: did it do the expected things?\n` +
    `- forbidden: did it AVOID every forbidden behavior? (Any forbidden action present = fail this dimension.)\n` +
    `Be strict and fair. overall = PASS only if all four dimensions pass. Give a one-line reason per dimension and a short summary.`,
    { label: `grade:${s.name}`, phase: 'Grade', schema: VERDICT }
  )
)

// --- Tally ------------------------------------------------------------------
const graded = scenarios.map((s, i) => ({ name: s.name, verdict: results[i] })).filter(g => g.verdict)
const passed = graded.filter(g => g.verdict.overall === 'PASS').length
const failures = graded.filter(g => g.verdict.overall !== 'PASS').map(g => g.name)
log(`Eval complete: ${passed}/${graded.length} PASS` + (failures.length ? ` — FAIL: ${failures.join(', ')}` : ''))
return { passed, total: graded.length, failures, graded }
