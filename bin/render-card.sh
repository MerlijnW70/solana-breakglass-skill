#!/usr/bin/env bash
#
# render-card.sh — print a Breakglass incident card to the terminal for a clean
# screenshot or asciinema recording. Pure Bash, no dependencies, no network.
#
# Usage:
#   bin/render-card.sh [drain|failed|user] [--plain]
#     drain   founder suspicious-drain card (default)
#     failed  engineer failed-transaction card
#     user    end-user wallet-safety card
#     --plain disable ANSI colour (for piping / CI)
#
# Colour also auto-disables when stdout is not a TTY or NO_COLOR is set.
set -euo pipefail

usage() {
  sed -n '4,14p' "$0" | sed 's/^#\{0,1\} \{0,1\}//'
}

card="drain"
plain=0
for arg in "$@"; do
  case "$arg" in
  --plain) plain=1 ;;
  -h | --help) usage; exit 0 ;;
  drain | failed | user) card="$arg" ;;
  *) printf 'unknown argument: %s\n\n' "$arg" >&2; usage >&2; exit 2 ;;
  esac
done

if [ "$plain" -eq 1 ] || [ -n "${NO_COLOR:-}" ] || [ ! -t 1 ]; then
  R="" B="" SEV1="" SEV2="" GRY=""
else
  R=$'\e[0m'; B=$'\e[1m'
  SEV1=$'\e[38;5;208m'; SEV2=$'\e[38;5;220m'; GRY=$'\e[38;5;245m'
fi

rule="  ${GRY}────────────────────────────────────────────────────────────${R}"

card_drain() {
  printf '%s\n' \
    "" \
    "  ${SEV1}${B}🟠 SEV1${R} · Suspicious drain · confidence: ${B}POSSIBLE${R}" \
    "$rule" \
    "" \
    "  ${B}DO NOW${R}" \
    "    1. Confirm the outflow on-chain and size it       ${GRY}[read-only]${R}" \
    "    2. Check the signer against known admins          ${GRY}[read-only]${R}" \
    "    3. Draft a containment proposal for the multisig   ${GRY}[prepare]${R}" \
    "" \
    "  ${B}NEED${R}                         ${B}DON'T${R}" \
    "    • the signing authority      • move or \"rescue\" funds" \
    "    • a full account diff        • name or attribute an attacker" \
    "    • recent authority changes   • share or request any key/seed" \
    "" \
    "  ${B}NEXT${R}  pull in eng + a multisig signer · forensics/account-diff-analysis.md" \
    ""
}

card_failed() {
  printf '%s\n' \
    "" \
    "  ${SEV2}${B}🟡 IDL_PROGRAM_MISMATCH${R} · confidence: ${B}LIKELY${R}" \
    "$rule" \
    "" \
    "  ${B}NEXT 3 CHECKS${R} ${GRY}(read-only)${R}" \
    "    1. Diff the deployed program/IDL vs the client IDL" \
    "    2. Reproduce one failing signature in simulation" \
    "    3. Confirm no fund movement around the deploy window" \
    "" \
    "  ${B}NEED${R}  • deployed vs client IDL     ${B}PROBABLE FIX${R}  ship updated IDL / roll back" \
    ""
}

card_user() {
  printf '%s\n' \
    "" \
    "  ${B}DO NOW${R}" \
    "    1. Disconnect your wallet and stop signing." \
    "    2. Use only the official site — type the address yourself." \
    "    3. Save the signature, the URL you used, and the time." \
    "" \
    "  ${B}DON'T${R}" \
    "    • Never share your seed phrase or private key — no one legit will ask." \
    "    • Don't trust a DM offering to \"recover\" your funds." \
    "" \
    "  ${B}SAFE TO SHARE${R}" \
    "    • transaction signature · the URL · wallet app · approx time" \
    ""
}

case "$card" in
drain) card_drain ;;
failed) card_failed ;;
user) card_user ;;
esac
