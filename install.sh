#!/usr/bin/env bash
#
# Fable Design System — one-command installer
#   Installs the design skill into whichever AI coding agents you have:
#   Claude (~/.claude), Codex (~/.codex), and Antigravity/Gemini (~/.gemini).
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/ajantoniou/fable-design-system/main/install.sh | bash
# or clone the repo and run:  bash install.sh
#
# What it does (and nothing more):
#   - downloads SKILL.md + FABLE-DESIGN-PERSONA.md + EVIDENCE.md from this repo
#   - copies them into the skill dir of each agent it detects
#   - backs up any existing install to <dir>.bak-<timestamp>
#   No sudo. No global changes. Nothing runs in the background.

set -euo pipefail

REPO="ajantoniou/fable-design-system"
RAW="https://raw.githubusercontent.com/${REPO}/main"
NAME="fable-design-system"
TS="$(date +%Y%m%d-%H%M%S)"

# ---- pretty output -------------------------------------------------------
bold()  { printf '\033[1m%s\033[0m\n' "$1"; }
ok()    { printf '  \033[32m✓\033[0m %s\n' "$1"; }
skip()  { printf '  \033[2m·\033[0m %s\n' "$1"; }
warn()  { printf '  \033[33m!\033[0m %s\n' "$1"; }

bold "🎨 Fable Design System — installer"
echo "Repo: https://github.com/${REPO}"
echo

# ---- fetch helper --------------------------------------------------------
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

fetch () { # $1 = repo path, $2 = dest file
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "${RAW}/$1" -o "$2"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$2" "${RAW}/$1"
  else
    echo "Need curl or wget to download. Aborting." >&2; exit 1
  fi
}

bold "Downloading the design system…"
fetch "FABLE-DESIGN-PERSONA.md" "$TMP/FABLE-DESIGN-PERSONA.md"
fetch "EVIDENCE.md"             "$TMP/EVIDENCE.md"
ok "persona + evidence"

# ---- install into one agent dir -----------------------------------------
# $1 = human label, $2 = detect dir (tool's root config dir), $3 = destination
#      skill dir, $4 = repo path to that tool's SKILL.md
install_into () {
  local label="$1" detect="$2" dest="$3" skillsrc="$4"
  [ -d "$detect" ] || { skip "$label not found — skipping"; return; }

  if [ -e "$dest" ]; then
    mv "$dest" "${dest}.bak-${TS}"
    warn "$label: backed up existing install → $(basename "${dest}.bak-${TS}")"
  fi
  mkdir -p "$dest"
  fetch "$skillsrc" "$dest/SKILL.md"
  cp "$TMP/FABLE-DESIGN-PERSONA.md" "$dest/FABLE-DESIGN-PERSONA.md"
  cp "$TMP/EVIDENCE.md"             "$dest/EVIDENCE.md"
  ok "$label → $dest"
}

bold "Installing into detected agents…"
install_into "Claude"               "$HOME/.claude"  "$HOME/.claude/skills/${NAME}"                       "skills/claude/SKILL.md"
install_into "Codex"                "$HOME/.codex"   "$HOME/.codex/skills/${NAME}"                        "skills/codex/SKILL.md"
install_into "Antigravity / Gemini" "$HOME/.gemini"  "$HOME/.gemini/config/plugins/${NAME}/skills/${NAME}" "skills/antigravity/SKILL.md"

# Gemini also wants a plugin.json manifest
GEM_PLUGIN="$HOME/.gemini/config/plugins/${NAME}"
if [ -d "$(dirname "$GEM_PLUGIN")" ] && [ -d "$GEM_PLUGIN" ]; then
  fetch "install/gemini/plugin.json" "$GEM_PLUGIN/plugin.json" 2>/dev/null && ok "Antigravity plugin manifest"
fi

echo
INSTALLED_ANY=false
for d in "$HOME/.claude/skills/${NAME}" "$HOME/.codex/skills/${NAME}" "$HOME/.gemini/config/plugins/${NAME}"; do
  [ -e "$d" ] && INSTALLED_ANY=true
done

if [ "$INSTALLED_ANY" = true ]; then
  bold "Done. 🎉"
  echo "Restart your agent (or start a new session) and it'll design like Fable."
  echo "Ask it to build a landing page — it reads the skill automatically."
else
  warn "No supported agent dirs found (~/.claude, ~/.codex, ~/.gemini)."
  echo "  Install Claude Code / Codex / Antigravity first, then re-run this."
fi
echo
echo "For Cursor: copy .cursor/rules/fable-design.mdc into your project's .cursor/rules/."
echo "Star the repo if it helped → https://github.com/${REPO}  🎨"
