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
   including the title, bullet text, visible link labels, and spaces. Do
   not count link destination URLs toward the limit. Count it — don't
   estimate by eye — before handing the draft back.

6. **Prioritization.** Prioritize impact and essential information. Omit
   technical detail unless it's necessary to understand the update.

7. **Bullets, not paragraphs.** Use a short series of scannable one-line
   bullets — one fact per line, no leading bullet symbol (no `•`, `-`, or
   similar; Buzz renders each line as its own item on its own). Where it
   fits naturally, pair a headline with its essential supporting fact after
   an em dash; a single clean sentence is also fine when that says it
   better. Format for executives with little time.

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

    Label each link by why it matters (not just "link" or the URL). When
    the destination is a Linear item, a bare `Label: ENVSMO-103`-style
    reference is enough — Buzz auto-links a recognized Linear identifier,
    so it doesn't need to be wrapped in markdown link syntax. For a
    destination Buzz won't auto-link (a GitHub URL, an external doc), write
    it as a real markdown link with its full destination —
    `[Label](https://...)` — never a bare label with the URL only
    described in prose; the draft has to be usable as-is.

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
[Fact line, one per line, no bullet symbol]
[Fact line, one per line, no bullet symbol]
↗ [Label]: [reference or link] · [Label]: [reference or link]
```

The `↗` line only appears when there's a link/reference to attach — see
rule 8. When it appears, it's the last line, and it carries only the
reference(s) themselves, not loose prose.

## Worked example

Real example, confirmed working in Buzz's Pulse tab:

```
Envision SMO: Collaboration foundation added
VISION docs now map the repo and contribution path.
Team and Buzz channel created; daily intel routed there.
9 issues completed; no new PRs.
↗ Docs: ENVSMO-103
```

With an external (non-Linear) link, written out in full:

```
Checkout Redesign: Payment failure rate cut from 4.1% to 1.2%
Retry logic shipped — deployed to 100% of traffic Sep 12
Support tickets down — 38 → 9 per week since rollout
↗ Root cause: ENVSMO-88 · [Full pulse post](https://linear.app/...)
```

Without any link or reference to cite, the `↗` line is simply omitted:

```
Checkout Redesign: Payment failure rate cut from 4.1% to 1.2%
Retry logic shipped — deployed to 100% of traffic Sep 12
Support tickets down — 38 → 9 per week since rollout
```
