#!/usr/bin/env bash
# Install skills from 16x9-AI/sop-updates-skill into a project.
#
# Usage:
#   ./install.sh [target-dir] [skill-name]
#
#   target-dir   Where to install (default: current directory)
#   skill-name   Install just one skill (default: all skills in the repo)
#
# This repo is private, so you need GitHub access to 16x9-AI/sop-updates-skill
# (git/gh credentials already configured) to fetch it. One-command install:
#
#   git clone https://github.com/16x9-AI/sop-updates-skill.git /tmp/sop-updates-skill \
#     && /tmp/sop-updates-skill/install.sh .
#
# or, with the GitHub CLI:
#
#   gh repo clone 16x9-AI/sop-updates-skill /tmp/sop-updates-skill \
#     && /tmp/sop-updates-skill/install.sh .

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${1:-.}"
ONLY_SKILL="${2:-}"

if [ ! -d "$SCRIPT_DIR/skills" ]; then
  echo "error: skills/ not found next to install.sh — run this from a clone of the repo" >&2
  exit 1
fi

mkdir -p "$TARGET/.claude/skills" "$TARGET/skills"

installed=()
for skill_dir in "$SCRIPT_DIR"/skills/*/; do
  name="$(basename "$skill_dir")"
  if [ -n "$ONLY_SKILL" ] && [ "$name" != "$ONLY_SKILL" ]; then
    continue
  fi
  if [ ! -f "$skill_dir/SKILL.md" ]; then
    continue
  fi

  # Claude Code auto-discovers skills placed here.
  mkdir -p "$TARGET/.claude/skills/$name"
  cp "$skill_dir/SKILL.md" "$TARGET/.claude/skills/$name/SKILL.md"

  # Harness-agnostic copy any other tool's file-read/RAG step can point at.
  mkdir -p "$TARGET/skills/$name"
  cp "$skill_dir/SKILL.md" "$TARGET/skills/$name/SKILL.md"

  installed+=("$name")
done

if [ "${#installed[@]}" -eq 0 ]; then
  echo "error: no matching skill found" >&2
  exit 1
fi

echo "Installed: ${installed[*]}"
echo
echo "  $TARGET/.claude/skills/<name>/SKILL.md   — Claude Code auto-discovers this, no extra step"
echo "  $TARGET/skills/<name>/SKILL.md           — point any other agent's file tool at this"
echo
echo "For a chat-only agent with no file access, paste the body of SKILL.md"
echo "(everything after the --- frontmatter block) into its system/context prompt."
