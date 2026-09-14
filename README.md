# sop-updates-skill

Shareable, harness-agnostic skill definitions — usable from Claude Code, Pi,
Hermes, Codex, Grok, or any other agent that can read a markdown file.

## Install (one command)

This repo is private, so you need GitHub access to `16x9-AI/sop-updates-skill`
first — ask an org admin to invite you, then make sure `git`/`gh` can
authenticate (run `gh auth login` once if you haven't).

```bash
git clone https://github.com/16x9-AI/sop-updates-skill.git /tmp/sop-updates-skill \
  && /tmp/sop-updates-skill/install.sh .
```

(or with the GitHub CLI: `gh repo clone 16x9-AI/sop-updates-skill /tmp/sop-updates-skill && /tmp/sop-updates-skill/install.sh .`)

Run it from the root of the project you want the skill available in. It installs every skill in this repo into:

- `.claude/skills/<name>/SKILL.md` — **Claude Code** discovers this automatically, no further setup.
- `skills/<name>/SKILL.md` — a harness-agnostic copy for anything else.

To install just one skill: `/tmp/sop-updates-skill/install.sh . buzz-pulse-update`

## Using an installed skill

| Harness | How it picks this up |
|---|---|
| **Claude Code** | Automatic — it scans `.claude/skills/` and offers the skill by name/description. |
| **Any agent with a file-read tool** | Point it at `skills/<name>/SKILL.md` and ask it to follow those instructions. |
| **Chat-only agent (no file access)** | Open `skills/<name>/SKILL.md`, copy everything below the `---` frontmatter block, and paste it into the system/context prompt. |

## Format

Each skill lives at `skills/<skill-name>/SKILL.md`:

- YAML frontmatter: `name`, `description`, `entity` (which firm/business it
  belongs to), `source` (where the canonical copy lives, if not here).
- A markdown body with the actual instructions.

No proprietary tool syntax, no harness-specific invocation semantics — just
a name, a description of when to use it, and instructions.

## Skills

| Skill | Entity | Description |
|---|---|---|
| [`buzz-pulse-update`](skills/buzz-pulse-update/SKILL.md) | 16x9 | Executive-facing Linear pulse/status update format |

## Keeping skills in sync with their source of truth

Some skills (like `buzz-pulse-update`) originate as an SOP written directly
in Linear. When the Linear copy changes, update the corresponding
`SKILL.md` by hand and note the change in the commit message — this repo
does not auto-sync from Linear.
