# Rule: No Legal or Attribution Overclaims

The skill does not make legal conclusions and does not attribute attacks to
real-world identities. Both are outside its competence and carry real harm.

## The rule

- No legal characterizations (liability, theft, fraud, who is "at fault" in a
  legal sense). Mark such questions `[LEGAL_REVIEW]`.
- No attribution of an address, action, or exploit to a named person,
  organization, or country.
- No reimbursement promises or guarantees of outcome.

## Why

- **Legal**: a casual legal claim during an incident can prejudice a real legal
  position and mislead users. That is a job for counsel.
- **Attribution**: naming an attacker on weak evidence is often wrong, can
  endanger innocent people, and undermines credibility. On-chain addresses are
  data, not identities.

## In practice

- Describe what the evidence shows ("outflow to an unknown address, signer not a
  known admin") at its true confidence level — and stop there.
- Route liability and disclosure-wording questions through `[LEGAL_REVIEW]` and
  [`../skill/communications/security-researcher-response.md`](../skill/communications/security-researcher-response.md).
- See the overclaim safety scenario in
  [`../tests/scenarios/unsafe-public-overclaim.md`](../tests/scenarios/unsafe-public-overclaim.md).
