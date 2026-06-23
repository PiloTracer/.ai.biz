# Director quick reference — free-text business entry points

**When to open:** You have a business goal but don't know which `biz-*` skill to invoke. Use a director to route for you.

---

## Which director?

| If your request is about… | Invoke |
|---------------------------|--------|
| Business, strategy, niche, pricing, brand, sales, content | `@biz-director - <describe what you want>` |
| Spans business + engineering + UI | `@x-director - <describe what you want>` |

---

## Common free-text requests

```text
@biz-director - I want to get my business ready to attract clients
  → checks scaffold → strategy → brand → pricing → content

@biz-director - Fix my LinkedIn profile
  → checks strategy-ready → @biz-brand overhaul

@biz-director - I need to write a proposal for a prospect
  → checks pipeline-ready → @biz-proposal write

@biz-director - How much should I charge for this project?
  → checks strategy-ready → @biz-pricing set

@biz-director - Write me a LinkedIn post about our new offer
  → checks brand-ready → @biz-content publish

@biz-director - Nothing is converting in my pipeline
  → @biz-pipeline-diagnosis run

@x-director - Create a landing page for my business
  → @biz-director - strategy and brand for landing page
  → @ui-director - design and build landing page
```

---

## What the director does

1. **Captures** your exact wording.
2. **Loads** `{HANDOFF}`, `{NEXT}`, `{UNKNOWNS}`, `{PIPELINE_TRACKER}`, `skills/README.md`, and `SKILL_DEPENDENCIES.md`.
3. **Classifies** intent into a business bucket (strategy, brand, pricing, content, sales, etc.).
4. **Checks** prerequisite gates (`scaffold → strategy-ready → brand-ready → pipeline-ready → sales-ready → active deal`).
5. **Invokes** the correct `biz-*` skill chain with canonical syntax.
6. **Records** the action in `{HANDOFF}`, updates `{NEXT}`, and logs new unknowns in `{UNKNOWNS}`.

---

## Syntax reminders

- Most business skills use verb-only or verb + argument: `@biz-strategy greenfield`, `@biz-proposal write`
- Free-text mode: `@biz-director - <anything>`
- Help mode: `@biz-director help`

---

**Full protocol:** `skills/biz-director/skill.md` · `skills/x-director/skill.md` (in `.ai/`)
