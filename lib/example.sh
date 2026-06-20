#!/usr/bin/env bash
#
# Example library — replace this with real Breakglass code. It exists only so
# the gate has genuine Bash to grade and a matching test to run. Source it to
# use the function; it does nothing when executed directly.
#
set -euo pipefail

# slugify <text> : lowercase, spaces/underscores -> '-', strip other punctuation.
slugify() {
  printf '%s' "$1" |
    tr '[:upper:]' '[:lower:]' |
    sed -E 's/[ _]+/-/g; s/[^a-z0-9-]//g; s/-+/-/g; s/^-|-$//g'
}
