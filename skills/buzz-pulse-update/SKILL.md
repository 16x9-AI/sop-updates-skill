---
name: buzz-pulse-update
description: >
  Write a Buzz Pulse Update — a short executive-facing status post about a
  Linear project, initiative, or issue. Use whenever asked to draft, post, or
  summarize a "Buzz update," "pulse update," or an executive status note tied
  to a Linear work item. Default output is a draft handed back as text —
  see "Output" below before posting or publishing anything.
entity: 16x9
source: Linear SOP (synced manually — see README.md for update process)
portable: true
---

# Buzz Pulse Update

Write project/initiative/issue updates for executive members.

## Output

**The expected output of this skill is a draft — text handed back to
whoever asked for it.** Do not post, publish, send, or attach the update
to anything (Linear, Buzz, Slack, email, a comment, a status update
object, or any other system) as a side effect of drafting it.

Only take a publishing action if the user's request explicitly asks for
one — e.g. "post this to Linear," "send it to the #buzz channel." If it's
ambiguous whether "write me an update" means draft-only or draft-and-send,
default to draft-only and ask before publishing anywhere. This applies
even if a publishing tool (Linear, Slack, etc.) happens to be available —
availability of a tool is not a request to use it.

If you do publish on explicit request, confirm the destination (which
project/initiative/issue, which channel) before sending, since a wrong
guess here is public and hard to walk back cleanly.

**Showing a draft: keep the payload unambiguous.** Whatever surface you're
running in (a terminal, a chat app, a DM), the person reading the draft
needs to know exactly which characters are the payload — what would
actually be copied or sent — versus your own commentary or the surface's
own formatting. A code block, quoted markdown, or a chat bubble can all
make this ambiguous (fenced text can pick up escaping, a chat renderer can
add its own bullets on top of yours). So:

- Give the raw draft text by itself, with nothing before or after it on
  the same block — no leading "Here's the draft:", no trailing
  explanation inside the same block.
- Put any explanation, character count, or rationale outside that block,
  clearly separate, so it's never mistaken for part of the payload.
- If you're not sure the surface you're in will show the raw text
  faithfully (e.g., it might auto-render `**bold**` or turn a bare Linear
  ID into something else), say so plainly rather than letting the person
  guess whether what they see is what will actually get sent.

## Publishing to Buzz Pulse (if you have `buzz` CLI access)

This applies only to an agent with its own Buzz identity and `buzz` CLI
access (e.g. an agent a user DMs inside Buzz). If you don't have that,
skip this section — hand back the approved draft as text per "Output"
above and let the user paste it themselves.

Buzz has two separate surfaces; publishing to the wrong one is public and
can't be quietly undone, so confirm which one is meant before sending:

| | Pulse | Channel |
|---|---|---|
| Nostr kind | `1` (text note) | `9` (channel message) |
| Reaches | Everyone in the workspace | Just that channel's members |
| Command | `buzz social publish --content "..."` | `buzz messages send --channel <id> --content "..."` |
| Read back | `buzz social notes` | `buzz messages read --channel <id>` |

Pulse is community-wide by default, so treat it as higher-stakes than a
channel: never run `buzz social publish` on an implied or earlier-turn
approval — get an explicit yes on the *exact current text* being sent,
since a draft edited after approval is no longer the thing that was
approved.

Sequence:
1. Draft the update per the rules below and show it to the user.
2. Get explicit approval of the exact text (not just "an update," the
   text as it now reads).
3. Run `buzz social publish --content "<the approved draft, verbatim>"`
   (or the channel-scoped command, if that's what was approved).
4. Report back the note id and timestamp the command returns, as a
   receipt the user can point to.

## Rules

1. **Language.** Write every update in English.

2. **Evidence first.** Before drafting, gather evidence from the underlying
   work: material outcomes, changes, risks, blockers, and decisions. Use
   totals only as supporting context — never as the headline.

3. **Attribution.** When the update is framed around a specific person's
   work ("update my team on what I've done," "my progress on X"), verify
   who actually did each thing before crediting it to them — check commit
   authorship, issue assignee/creator, or ask, rather than assuming from
   project membership alone.

   - Don't fold a teammate's or a bot/automation account's work into "my"
     update just because it happened in the same project around the same
     time. Attribute it to whoever actually did it, or describe it as a
     project-level fact rather than a personal one.
   - It's fine, often necessary, to mention what a *collaborator* did as
     context (a decision they made, a risk they found) — just don't
     misrepresent it as the requester's own output.
   - If authorship is genuinely unclear after checking, say so rather than
     guessing either way.

4. **Opening line.** Start with the work item followed by a colon, then the
   most important outcome or change:

   `[WORK ITEM]: [MOST IMPORTANT OUTCOME OR CHANGE]`

   Do not use an update-type prefix (no "Progress update:", "Status:", etc.).
   Keep this line itself short — a headline, not a summary of everything
   that follows. If it's running long, move detail into a bullet instead of
   lengthening the title; the title should generally read shorter than any
   single bullet below it.

5. **Length.** Keep every update to **280 visible characters or fewer**,
   including the title, bullet text, and spaces. On a surface that renders
   markdown links (`[Label](url)`), don't count the destination URL — only
   the visible label. On a surface that doesn't (Buzz's Pulse tab, per
   rule 10) the raw URL is what's actually shown, so it counts in full —
   this is exactly why rule 10 says to use the short form of a Linear URL.
   Count it — don't estimate by eye — before handing the draft back.

6. **Prioritization.** Prioritize impact and essential information. Omit
   technical detail unless it's necessary to understand the update.

7. **Bullets, not paragraphs.** Use a short series of scannable one-line
   bullets, each starting with a literal `•` character — Buzz's Pulse tab
   doesn't parse markdown, so a bullet only reads as a bullet if the `•`
   character is actually there (confirmed by direct test). Where it fits
   naturally, pair a headline with its essential supporting fact after an
   em dash; a single clean sentence is also fine when that says it better.
   Format for executives with little time.

8. **Structure.** Follow this order:
   1. Title (the opening line from rule 4)
   2. Fact lines (one per line, per rule 7)
   3. A `↗` line — only when there's at least one link or reference to
      attach to it. It always comes last, at the bottom of the message.
      If nothing in the update has a link or reference worth citing, omit
      the `↗` line entirely rather than sending it empty or text-only.

9. **Separators.** Use em dashes (—) to improve scanability.

10. **Links.** Include supporting links when they exist, but limit them to
    the few most important sources — don't include their full detail inline.
    Order links by executive relevance:
    1. Critical risks
    2. Decisions needed
    3. Material deliveries

    Label each link by why it matters (not just "link" or the URL) — but
    write it as plain prose, `Label: https://...`, never markdown link
    syntax (`[Label](url)`). Confirmed by direct test: Buzz's Pulse tab
    does not parse markdown — `[text](url)` shows as literal brackets and
    is not clickable. A raw, bare URL is auto-detected and made clickable
    on its own, with no special syntax needed.

    Use the shortest URL that still resolves. A Linear issue's full URL
    includes a long title-slug (`.../issue/ENVSMO-103/standardize-the-...`)
    that Linear doesn't require — `https://linear.app/<workspace>/issue/
    ENVSMO-103` on its own resolves to the same issue and is far shorter,
    which matters since (unlike link labels) the destination URL itself
    counts toward the 280-character limit here — there's no markdown to
    hide it behind, so every character of it is visible and counted.

    If the user requests a longer Linear pulse post in addition to the short
    Buzz update, include that longer pulse post as one of the links in the
    short update.

11. **Truthfulness.** When reporting data, prefer truthful specifics —
    metrics, numbers, dates, names — over vague language. If the source
    (an issue, a PR, a doc) states an exact figure, use that figure instead
    of a vaguer paraphrase ("80 of 83 screens," not "some screens"). Use
    ranges when exact figures are genuinely uncertain. Report facts without
    overpromising.

12. **Thin evidence.** When evidence is thin, say that no meaningful change
    was reported rather than infer progress, health, or a forecast.

13. **Don't guess how the destination renders.** If it's unclear how Buzz
    (or wherever the update is going) will render a symbol, a line break,
    or a link, don't assume — ask the person for a known-working example
    from that surface and match its structure, rather than inventing a
    rendering rule and writing it into future drafts as fact.

## Format template

```
[WORK ITEM]: [MOST IMPORTANT OUTCOME OR CHANGE]
• [Fact line]
• [Fact line]
↗ [Label]: [short URL] · [Label]: [short URL]
```

The `↗` line only appears when there's a link/reference to attach — see
rule 8. When it appears, it's the last line, and it carries only the
label(s) and raw URL(s), not loose prose.

## Worked example

```
Envision SMO: Collaboration foundation added
• VISION docs now map the repo and contribution path.
• Team and Buzz channel created; daily intel routed there.
• 9 issues completed; no new PRs.
↗ Docs: https://linear.app/16x9/issue/ENVSMO-103
```

With more than one link — still the short Linear URL form, and still
bare (no markdown), separated with `·`:

```
Checkout Redesign: Payment failure rate cut from 4.1% to 1.2%
• Retry logic shipped — deployed to 100% of traffic Sep 12
• Support tickets down — 38 → 9 per week since rollout
↗ Root cause: https://linear.app/16x9/issue/ENVSMO-88 · Full post: https://linear.app/16x9/issue/ENVSMO-90
```

Without any link or reference to cite, the `↗` line is simply omitted:

```
Checkout Redesign: Payment failure rate cut from 4.1% to 1.2%
• Retry logic shipped — deployed to 100% of traffic Sep 12
• Support tickets down — 38 → 9 per week since rollout
```
