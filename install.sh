#!/usr/bin/env bash
#
# install.sh — install the Breakglass for Solana skill by copying local
# Markdown and config files into a skills directory.
#
# This installer is intentionally boring and transparent:
#   - no network calls
#   - no package installation
#   - no wallet, key, or secret access
#   - it only copies files you can already read in this repository
#
# Usage:
#   ./install.sh                 # install to the default target
#   ./install.sh /custom/path    # install to a custom target
#
set -euo pipefail

# Resolve the repository root (the directory this script lives in).
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Default install target; overridable by the first argument.
DEFAULT_TARGET="$HOME/.solana-ai-kit/skills/solana-breakglass-skill"
TARGET="${1:-$DEFAULT_TARGET}"

# Top-level items to install. Only documentation and skill content — nothing
# executable beyond this installer, and no VCS or gate internals.
ITEMS=(
  "README.md"
  "LICENSE"
  "SECURITY.md"
  "CONTRIBUTING.md"
  "skill"
  "commands"
  "agents"
  "rules"
  "tests"
  "examples"
  "schemas"
)

printf 'Installing Breakglass for Solana\n'
printf '  from: %s\n' "$SRC_DIR"
printf '  to:   %s\n' "$TARGET"

mkdir -p "$TARGET"

copied=0
skipped=0
for item in "${ITEMS[@]}"; do
  src="$SRC_DIR/$item"
  if [ -e "$src" ]; then
    cp -R "$src" "$TARGET/"
    printf '  copied %s\n' "$item"
    copied=$((copied + 1))
  else
    printf '  skipped %s (not present yet)\n' "$item"
    skipped=$((skipped + 1))
  fi
done

printf '\nBreakglass for Solana installed successfully.\n'
printf '  %d item(s) copied, %d skipped.\n' "$copied" "$skipped"
printf '  Entry point: %s/skill/SKILL.md\n' "$TARGET"
