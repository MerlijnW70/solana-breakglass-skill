# Breakglass

A Markdown + Bash project, developed under [nohalo](https://github.com/MerlijnW70/nohalo)
quality guardrails. The gate grades every change A–F and refuses to call a turn
done below grade A.

## Layout

- `lib/` — reusable Bash functions (source them; they no-op when run directly).
- `bin/` — executable Bash entry points (add as needed).
- `tests/` — `*.test.sh` suites; each sources `lib/testing.sh` and ends with
  `test_summary`.
- `docs/` — Markdown documentation.
- `tools/check.sh` — the gate's check dispatcher (one subcommand per dimension).

## The gate

The checks are pure Bash with zero external dependencies, so they run anywhere
Git Bash does — nothing to install.

| Dimension     | What it enforces                                          |
| ------------- | --------------------------------------------------------- |
| `bash-build`  | every `*.sh` passes `bash -n` (syntax)                    |
| `bash-test`   | `tests/*.test.sh` all pass (and code must have a test)    |
| `bash-lint`   | bash shebang + `set -euo pipefail` in every script        |
| `bash-format` | no trailing whitespace, tabs, or CRLF; files end with LF  |
| `md-lint`     | one top-level `# ` H1, first non-blank line is a heading  |
| `md-format`   | Markdown whitespace hygiene                               |

Run the whole suite and grade it with `nh check`; print the sign-off with
`nh stamp`.

## Develop

Write a function in `lib/`, a matching `tests/<name>.test.sh`, then `nh check`
until it is grade A.
