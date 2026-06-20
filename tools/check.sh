#!/usr/bin/env bash
#
# Breakglass quality checks — pure Bash, zero external dependencies.
#
# Invoked by the nohalo gate (.gate/gate.toml). Each subcommand maps to one
# graded dimension. Exit 0 = pass; non-zero = fail, with the violations printed
# to stderr so the gate's adversarial report can quote them.
#
# Dimensions:
#   bash-build   syntax-check every shell script (bash -n)
#   bash-test    run tests/*.test.sh through the harness (lib/testing.sh)
#   bash-lint    conventions: bash shebang + `set -euo pipefail`
#   bash-format  whitespace hygiene: no trailing WS / tabs / CRLF, final newline
#   md-lint      structure: a single top-level H1, first non-blank line
#   md-format    whitespace hygiene for Markdown
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

# --- file discovery --------------------------------------------------------
# Print project files matching a glob, one per line, pruning VCS / vendored /
# nohalo-managed paths. CLAUDE.md and AGENTS.md are nohalo's, not project
# content, so they are never linted here.
list_files() {
  local pattern="$1"
  find . \
    -path ./.git -prune -o \
    -path ./.gate -prune -o \
    -path ./.claude -prune -o \
    -path ./node_modules -prune -o \
    -type f -name "$pattern" -print |
    sed 's#^\./##' |
    grep -vx -e 'CLAUDE.md' -e 'AGENTS.md' || true
}

# Report a single violation and remember that this dimension failed.
violations=0
fail() {
  printf 'FAIL %s\n' "$1" >&2
  violations=$((violations + 1))
}

finish() {
  local dim="$1"
  if [ "$violations" -ne 0 ]; then
    printf '\n%s: %d violation(s).\n' "$dim" "$violations" >&2
    exit 1
  fi
  printf '%s: OK\n' "$dim"
}

# --- whitespace hygiene (shared by *-format) -------------------------------
check_whitespace() {
  local f="$1"
  if grep -nq $'\r' "$f"; then
    fail "$f: contains CRLF line endings (use LF)"
  fi
  if grep -nq ' $' "$f"; then
    fail "$f: has trailing whitespace"
  fi
  if [ -s "$f" ] && [ -n "$(tail -c 1 "$f")" ]; then
    fail "$f: does not end with a newline"
  fi
}

# === bash dimensions =======================================================
bash_build() {
  local f
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    if ! bash -n "$f" 2>/dev/null; then
      fail "$f: bash syntax error"
    fi
  done < <(list_files '*.sh')
  finish bash-build
}

bash_lint() {
  local f first
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    first="$(head -n 1 "$f")"
    case "$first" in
    '#!'*bash*) : ;;
    *) fail "$f: missing a bash shebang on line 1" ;;
    esac
    if ! grep -q 'set -euo pipefail' "$f"; then
      fail "$f: missing 'set -euo pipefail'"
    fi
  done < <(list_files '*.sh')
  finish bash-lint
}

bash_format() {
  local f
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    if grep -nq $'\t' "$f"; then
      fail "$f: uses tab indentation (use spaces)"
    fi
    check_whitespace "$f"
  done < <(list_files '*.sh')
  finish bash-format
}

# Anti-vacuous-green: shell code under lib/ or bin/ must have at least one test.
bash_test() {
  local srcs tests
  srcs="$(list_files '*.sh' | grep -E '^(lib|bin)/' || true)"
  tests="$(list_files '*.test.sh' || true)"
  if [ -n "$srcs" ] && [ -z "$tests" ]; then
    fail "shell code exists under lib/ or bin/ but tests/ has no *.test.sh"
    finish bash-test
    return
  fi
  if [ -z "$tests" ]; then
    printf 'bash-test: OK (no tests yet — empty scaffold)\n'
    return
  fi
  local t failed=0
  while IFS= read -r t; do
    [ -n "$t" ] || continue
    printf '  running %s\n' "$t"
    if ! bash "$t"; then
      fail "$t: test suite failed"
      failed=1
    fi
  done < <(printf '%s\n' "$tests")
  [ "$failed" -eq 0 ] || true
  finish bash-test
}

# === markdown dimensions ===================================================
md_lint() {
  local f firstline h1
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    firstline="$(grep -nm1 '[^[:space:]]' "$f" | cut -d: -f2- || true)"
    case "$firstline" in
    '# '*) : ;;
    *) fail "$f: first non-blank line must be a top-level '# ' heading" ;;
    esac
    h1="$(grep -c '^# ' "$f" || true)"
    if [ "$h1" -gt 1 ]; then
      fail "$f: $h1 top-level H1 headings (exactly one expected)"
    fi
  done < <(list_files '*.md')
  finish md-lint
}

md_format() {
  local f
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    if grep -nq $'\t' "$f"; then
      fail "$f: contains hard tabs"
    fi
    check_whitespace "$f"
  done < <(list_files '*.md')
  finish md-format
}

case "${1:-}" in
bash-build) bash_build ;;
bash-test) bash_test ;;
bash-lint) bash_lint ;;
bash-format) bash_format ;;
md-lint) md_lint ;;
md-format) md_format ;;
*)
  printf 'usage: check.sh {bash-build|bash-test|bash-lint|bash-format|md-lint|md-format}\n' >&2
  exit 2
  ;;
esac
