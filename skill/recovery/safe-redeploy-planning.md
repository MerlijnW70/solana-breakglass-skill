# Recovery: Safe Redeploy Planning

How to prepare a reviewed plan to redeploy a program or frontend after an
incident — without shipping a panic build from a possibly-compromised pipeline.
The skill plans; humans build, review, and deploy.

## Preconditions

```text
Root cause understood    you know what you are fixing and why
Clean source             the fix is on a reviewed commit, not a hot patch
Trusted pipeline         the build/deploy path is itself verified uncompromised
Verified build target    you can confirm the artifact hash after deploy
Approvers ready          security review + (for programs) authority signers
```

## Plan contents

```text
What is redeploying:     (program / frontend / both)
Fix summary:             (root cause -> change, in one line)
Source commit:           (reviewed, merged)
Build verification:      (reproducible build; expected hash)
Pipeline integrity:      (confirmed not the compromise vector)
Risk labels:             [SECURITY_REVIEW][MULTISIG_REQUIRED for programs]
Approvers:               (named)
Pre-deploy checks:       (read-only)
Post-deploy validation:  (hash match, smoke checks, monitoring)
Rollback plan:           (known-good prior artifact + how to revert)
Comms plan:              (status update on completion, accurately scoped)
```

## Boundaries

- Never redeploy from a pipeline that may be the compromise vector — verify it
  first with [`../forensics/verified-build-triage.md`](../forensics/verified-build-triage.md).
- For frontend incidents, confirm the rolled-to build is clean, not just
  "previous" — see
  [`../incidents/frontend-compromise.md`](../incidents/frontend-compromise.md).
- The skill prepares the plan and checklist only; it does not deploy.
- Validate the result with
  [`recovery-validation.md`](recovery-validation.md) before saying "resolved".
