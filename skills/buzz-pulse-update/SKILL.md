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

3. **Opening line.** Start with the work item followed by a colon, then the
   most important outcome or change:

   `[WORK ITEM]: [MOST IMPORTANT OUTCOME OR CHANGE]`

   Do not use an update-type prefix (no "Progress update:", "Status:", etc.).

4. **Length.** Keep every update to **280 visible characters or fewer**,
   including the title, bullets, visible link labels, and spaces. Do not
   count link destination URLs toward the limit.

5. **Prioritization.** Prioritize impact and essential information. Omit
   technical detail unless it's necessary to understand the update.

6. **Bullets, not paragraphs.** Use a short series of scannable one-line
   bullets. Each bullet pairs the headline with its essential supporting
   fact after an em dash. Format for executives with little time.

7. **Structure.** Follow this order:
   1. Title (the opening line from rule 3)
   2. Bullets
   3. A `↗` line with only the few most decision-relevant supporting details

8. **Separators.** Use em dashes (—) to improve scanability.

9. **Links.** Include supporting links when they exist, but limit them to
   the few most important sources — don't include their full detail inline.
   Order links by executive relevance:
   1. Critical risks
   2. Decisions needed
   3. Material deliveries

   Label each link by why it matters (not just "link" or the URL).

   If the user requests a longer Linear pulse post in addition to the short
   Buzz update, include that longer pulse post as one of the links in the
   short update.

10. **Truthfulness.** When reporting data, prefer truthful specifics —
    metrics, numbers, dates, names — over vague language. Use ranges when
    exact figures are uncertain. Report facts without overpromising.

11. **Thin evidence.** When evidence is thin, say that no meaningful change
    was reported rather than infer progress, health, or a forecast.

## Format template

```
[WORK ITEM]: [MOST IMPORTANT OUTCOME OR CHANGE]
[Bullet headline] — [supporting fact]
[Bullet headline] — [supporting fact]
↗ [Most decision-relevant detail], [label](url) · [label](url)
```

## Worked example

```
Checkout Redesign: Payment failure rate cut from 4.1% to 1.2% after retry-logic fix
Retry logic shipped — deployed to 100% of traffic Sep 12
Support tickets down — 38 → 9 per week since rollout
↗ Fix required reverting the Stripe SDK bump; full pulse post: [Details](https://linear.app/...)
```
