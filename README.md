# sop-updates-skill

A small library of **portable agent skills** — plain-markdown instruction
files that any AI coding/agent harness can install and follow. Not just
Claude: Claude Code, Codex, Grok, Hermes, Pi, or anything else that can read
a file and follow instructions.

## Why this exists

Most "agent skill" formats are tied to one product. A team that writes its
standard operating procedures once — how to draft a status update, how to
file a bug, how to review a PR — shouldn't have to re-teach every agent it
uses the same rules by hand, or lock that knowledge into one vendor's
format.

This repo holds SOPs as skills in the simplest format that works
everywhere: a markdown file with a small YAML header. No proprietary tool
syntax, no vendor lock-in — just a name, a description of when to use it,
and instructions to follow.

## Install (one command)

```bash
git clone https://github.com/16x9-AI/sop-updates-skill.git /tmp/sop-updates-skill \
  && /tmp/sop-updates-skill/install.sh .
```

Run it from the root of the project you want a skill available in. It
installs every skill in this repo into:

- `.claude/skills/<name>/SKILL.md` — **Claude Code** discovers this automatically, no further setup.
- `skills/<name>/SKILL.md` — a harness-agnostic copy for anything else.

To install just one skill: `/tmp/sop-updates-skill/install.sh . <skill-name>`

## Using an installed skill

| Harness | How it picks this up |
|---|---|
| **Claude Code** | Automatic — it scans `.claude/skills/` and offers the skill by name/description. |
| **Any agent with a file-read tool** | Point it at `skills/<name>/SKILL.md` and ask it to follow those instructions. |
| **Chat-only agent (no file access)** | Open `skills/<name>/SKILL.md`, copy everything below the `---` frontmatter block, and paste it into the system/context prompt. |

## Format

Each skill lives at `skills/<skill-name>/SKILL.md`:

```markdown
---
name: skill-name
description: When to use this skill, in one to a few sentences.
entity: which team/org this originated from (optional)
source: where the canonical copy lives, if not here (optional)
---

# Skill title

Plain-language instructions the agent should follow.
```

Nothing else is required. Any tool that can read a text file and place it
in an agent's context can use a skill from this repo — copy/paste, RAG
indexing, a system-prompt append, or a harness's own skill-discovery
convention (like Claude Code's `.claude/skills/`).

## Skills in this repo

| Skill | Description |
|---|---|
| [`buzz-pulse-update`](skills/buzz-pulse-update/SKILL.md) | Format and rules for a short, executive-facing project/issue status update (character limit, structure, evidence-first sourcing). |

## Contributing a skill

Add a folder under `skills/<your-skill-name>/` with a `SKILL.md` following
the format above, and it's installable by everyone through the same
`install.sh`. If the skill originates as an SOP maintained elsewhere (e.g.
in a project-management tool), note that in the `source` frontmatter field
and update `SKILL.md` by hand when the source changes — this repo does not
auto-sync from anywhere.
