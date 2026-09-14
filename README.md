# agent-skills

Shareable, harness-agnostic skill definitions — usable from Claude Code, Pi,
Hermes, Codex, Grok, or any other agent that can read a markdown file.

## Format

Each skill lives at `skills/<skill-name>/SKILL.md`:

- YAML frontmatter: `name`, `description`, `entity` (which firm/business it
  belongs to), `source` (where the canonical copy lives, if not here).
- A markdown body with the actual instructions.

No proprietary tool syntax, no harness-specific invocation semantics — just
a name, a description of when to use it, and instructions. Any agent can
load the file into its context (system prompt, RAG index, pasted directly)
and follow it.

## Using a skill on a given harness

- **Claude Code**: drop the folder under `.claude/skills/` in a project, or
  reference the file directly and ask Claude to follow it.
- **Anything else**: paste `SKILL.md`'s body into the system/context prompt,
  or point your agent's file-reading tool at it.

## Skills

| Skill | Entity | Description |
|---|---|---|
| [`buzz-pulse-update`](skills/buzz-pulse-update/SKILL.md) | 16x9 | Executive-facing Linear pulse/status update format |

## Keeping skills in sync with their source of truth

Some skills (like `buzz-pulse-update`) originate as an SOP written directly
in Linear. When the Linear copy changes, update the corresponding
`SKILL.md` by hand and note the change in the commit message — this repo
does not auto-sync from Linear.
