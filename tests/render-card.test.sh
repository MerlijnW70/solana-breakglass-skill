#!/usr/bin/env bash
#
# Tests for bin/render-card.sh — the launch-screenshot card renderer.
#
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=lib/testing.sh
source "$DIR/lib/testing.sh"

CARD="$DIR/bin/render-card.sh"

has() { case "$2" in *"$1"*) printf 'yes' ;; *) printf 'no' ;; esac; }

# --- default (drain) card renders the founder card ------------------------
out="$(bash "$CARD" --plain)"
assert_ok "default card runs"                 -- bash "$CARD" --plain
assert_eq "yes" "$(has 'SEV1' "$out")"        "drain card shows the severity header"
assert_eq "yes" "$(has 'DO NOW' "$out")"      "drain card shows DO NOW"
assert_eq "yes" "$(has "DON'T" "$out")"       "drain card shows DON'T"

# --plain must contain no ANSI escape sequences
case "$out" in *$'\e'*) ansi="yes" ;; *) ansi="no" ;; esac
assert_eq "no" "$ansi" "--plain output has no ANSI escapes"

# --- engineer + user variants --------------------------------------------
assert_eq "yes" "$(has 'IDL_PROGRAM_MISMATCH' "$(bash "$CARD" failed --plain)")" "failed card shows the failure class"
assert_eq "yes" "$(has 'SAFE TO SHARE' "$(bash "$CARD" user --plain)")" "user card shows SAFE TO SHARE"

# --- safety invariant: the card never asks for secrets --------------------
allout="$(bash "$CARD" drain --plain; bash "$CARD" failed --plain; bash "$CARD" user --plain)"
case "$allout" in
*"share your seed phrase or private key"*) seedwarn="present" ;;
*) seedwarn="absent" ;;
esac
assert_eq "present" "$seedwarn" "user card warns against sharing seed/key"

# --- unknown argument exits non-zero --------------------------------------
rc=0
bash "$CARD" bogus >/dev/null 2>&1 || rc=$?
assert_eq "2" "$rc" "unknown argument exits 2"

test_summary
