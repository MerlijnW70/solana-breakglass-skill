#!/usr/bin/env bash
#
# Minimal pure-Bash test helpers. Source this at the top of a tests/*.test.sh
# file, call assert_* helpers, then end with `test_summary`. A non-zero exit
# tells the gate's bash-test dimension the suite failed.
#
set -euo pipefail

_tests_run=0
_tests_failed=0

# assert_eq <expected> <actual> [message]
assert_eq() {
  _tests_run=$((_tests_run + 1))
  if [ "$1" != "$2" ]; then
    _tests_failed=$((_tests_failed + 1))
    printf '    not ok: %s\n      expected: %q\n      actual:   %q\n' \
      "${3:-assert_eq}" "$1" "$2" >&2
  fi
}

# assert_ok <message> -- <command...>  : command must exit 0
assert_ok() {
  local msg="$1"
  shift
  [ "${1:-}" = "--" ] && shift
  _tests_run=$((_tests_run + 1))
  if ! "$@" >/dev/null 2>&1; then
    _tests_failed=$((_tests_failed + 1))
    printf '    not ok: %s (command failed: %s)\n' "$msg" "$*" >&2
  fi
}

test_summary() {
  printf '    %d assertion(s), %d failed\n' "$_tests_run" "$_tests_failed"
  [ "$_tests_failed" -eq 0 ]
}
