#!/usr/bin/env bash
#
# Tests for install.sh. Exercises real installer behavior into throwaway temp
# directories and locks in the installer's safety invariants (no network calls,
# no package installation, no wallet/secret access). A non-zero exit tells the
# gate's bash-test dimension the suite failed.
#
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=lib/testing.sh
source "$DIR/lib/testing.sh"

INSTALLER="$DIR/install.sh"

# --- behavior: installs into a custom target ------------------------------
target="$(mktemp -d)"
trap 'rm -rf "$target" "${target2:-}"' EXIT

out="$(bash "$INSTALLER" "$target/bg")"
rc=$?

assert_eq "0" "$rc" "installer exits 0 on a custom target"
assert_ok "entry point SKILL.md is installed" -- test -f "$target/bg/skill/SKILL.md"
assert_ok "README.md is installed"            -- test -f "$target/bg/README.md"
assert_ok "LICENSE is installed"              -- test -f "$target/bg/LICENSE"
assert_ok "a core contract is installed"      -- test -f "$target/bg/skill/core/severity-model.md"
assert_ok "an incident playbook is installed" -- test -f "$target/bg/skill/incidents/suspicious-drain.md"
assert_ok "a rule is installed"               -- test -f "$target/bg/rules/agent-safety.md"
assert_ok "a schema is installed"             -- test -f "$target/bg/schemas/evidence-bundle.schema.json"

# success message names the entry point
case "$out" in
  *"installed successfully"*"skill/SKILL.md"*) msg_ok=yes ;;
  *) msg_ok=no ;;
esac
assert_eq "yes" "$msg_ok" "prints a success message naming the entry point"

# --- safety invariants: enforced against CODE, not comments ----------------
# Strip comment and blank lines first so the installer's own reassuring safety
# comments ("no network calls", "no wallet access") don't trip these checks.
# A future edit that adds a real fetch or wallet read fails the gate.
NET_RE='curl|wget|netcat|(^| )nc |( |^)ssh |( |^)scp |npm( |$)|npx |( |^)pip3? |apt-get|( |^)apt |( |^)brew |cargo (install|add)|go install|git clone'
SECRET_RE='id\.json|keypair|private[_-]?key|seed[_-]?phrase|mnemonic|\.env|secret|wallet'

assert_ok "installer makes no network/package calls" -- \
  bash -c 'grep -Ev "^[[:space:]]*(#|$)" "'"$INSTALLER"'" | { ! grep -Eqi "'"$NET_RE"'"; }'

assert_ok "installer touches no wallets/keys/secrets" -- \
  bash -c 'grep -Ev "^[[:space:]]*(#|$)" "'"$INSTALLER"'" | { ! grep -Eqi "'"$SECRET_RE"'"; }'

# --- behavior: idempotent re-run into the same target ---------------------
target2="$(mktemp -d)"
bash "$INSTALLER" "$target2/bg" >/dev/null
assert_ok "re-running the installer still exits 0" -- bash "$INSTALLER" "$target2/bg"

test_summary
