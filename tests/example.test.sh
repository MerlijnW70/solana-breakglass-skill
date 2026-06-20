#!/usr/bin/env bash
#
# Test for lib/example.sh. Pattern to copy for real Breakglass tests.
#
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=lib/testing.sh
source "$DIR/lib/testing.sh"
# shellcheck source=lib/example.sh
source "$DIR/lib/example.sh"

assert_eq "hello-world" "$(slugify 'Hello World')" "spaces become dashes"
assert_eq "a-b-c" "$(slugify 'a_b  c')" "underscores and runs collapse"
assert_eq "hello-world" "$(slugify 'Hello, World!')" "punctuation stripped"
assert_eq "caf" "$(slugify 'Café')" "non-ASCII is dropped, not folded"
assert_eq "" "$(slugify '   ')" "blank input yields empty slug"

test_summary
