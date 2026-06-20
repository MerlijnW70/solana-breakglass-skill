# Hardening: security.txt and Disclosure Path

Make it easy for a researcher to reach you before they go public. A clear
disclosure path turns a potential surprise exploit into a coordinated fix.

## What to publish

```text
A reachable security contact (email or form), monitored.
A disclosure policy: scope, expectations, and safe-harbor language.
Response-time expectations (e.g. acknowledge within N hours).
Preferred report contents: affected component, repro/signature, impact.
An on-chain pointer where practical (e.g. a documented security contact).
```

## A security.txt sketch

```text
Contact: mailto:security@<yourdomain>
Policy: https://<yourdomain>/security-policy
Preferred-Languages: en
Expires: <future date>
```

Keep `Expires` in the future and review the file periodically so it stays valid.

## Disclosure policy essentials

- State scope (what is in/out) and a good-faith safe harbor.
- Ask reporters to delay public disclosure until mitigation.
- Commit to acknowledging quickly and keeping the reporter updated.
- Do not put legal characterizations or bounty amounts in stone without
  `[LEGAL_REVIEW]`.

## On report

Respond with [`../communications/security-researcher-response.md`](../communications/security-researcher-response.md):
appreciative, responsive, asks for safe evidence only, no legal admissions, and
no secrets accepted. Verify independently with the forensics modules before
acting.
