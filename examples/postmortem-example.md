# Example: Postmortem

An illustrative, blameless postmortem for a fictional frontend-compromise
incident. Shows the template filled honestly, with residual risk acknowledged.

## Postmortem

```text
Summary: For ~45 minutes, our frontend served a build that altered withdrawal
destinations. We paused the site, verified a clean build, and redeployed.

Impact: An estimated small number of users saw an altered prompt; we confirmed 3
affected transactions. No protocol-owned funds were affected.

Detection: A user report flagged an unexpected destination at 14:06 UTC, 6
minutes after the bad deploy.

Timeline:
  13:58 Deploy via CI.
  14:06 First user report.
  14:10 Frontend paused.
  14:25 Bad build hash confirmed; CI token found over-scoped.
  14:40 Clean build verified and redeployed.
  15:30 Monitoring stable; status updated.

Root cause:
  Trigger: A compromised dependency introduced in the 13:58 build.
  Immediate cause: The build altered the withdrawal destination at runtime.
  Contributing factors: Over-scoped shared CI token; no build-hash verification
  gate; no alert on frontend deploy.

What went well: Fast pause; honest comms; clean-build verification before
redeploy.
What went poorly: Detection relied on a user, not an alert; rollback target had
to be verified manually.
Where detection failed: No automated build-hash or deploy alert.
Where response failed: No pre-agreed clean-build reference.

User communication review: Timely, no overclaims; anti-scam reminder included.
Authority/control-plane review: CI token scope was the weak link; DNS/hosting
ownership was fine.

Corrective actions:
  - Add build-hash verification gate.        Owner: @eng    Due: +1 week
  - Scope/rotate CI tokens; remove sharing.   Owner: @eng    Due: +3 days
  - Alert on frontend deploy + DNS/CDN change. Owner: @sre   Due: +1 week
Verification plan: Re-run the tabletop with these in place; confirm alerts fire.
Residual risk: Dependency-supply risk remains until SBOM + pinning land.
```

Template: [`../skill/communications/postmortem-template.md`](../skill/communications/postmortem-template.md).
