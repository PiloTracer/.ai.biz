---
name: biz-director
description: >-
  Universal orchestrator. Accepts free-text business requests, loads project
  state, maps intent to correct skill(s), checks prerequisite gates,
  orchestrates execution, and ensures proper documentation. If no skill
  matches, recommends creating one.
  biz-director <free-text request>
---

# biz-director — Business Request Orchestrator

**Purpose:** You don't need to know which skill exists or what it does. Just describe what you want to accomplish. biz-director reads project state, maps your intent to the right skills, checks gates, chains dependent skills, and ensures every session leaves the project better documented.

**Canonical path:** `.ai.biz/skills/biz-director/skill.md`

---

## Parse invocation

Free-text match — no fixed verb. Capture the user's natural language request in full.

| User says | Action |
|-----------|--------|
| `@biz-director I want to get my business ready to attract clients` | Route through full flow: strategy → brand → pricing → content |
| `@biz-director fix my LinkedIn profile` | Route to `@biz-brand overhaul` |
| `@biz-director I need to write a proposal for a prospect` | Route to `@biz-proposal write` (check pipeline-ready gate) |
| `@biz-director help` | Display routing table and this skill's purpose |
| `@biz-director we need a new way to track customer onboarding` | Gap detected → recommend new skill |

---

## I0 — Load project state

Before routing, read the following to understand current context:

| File | What it tells you |
|------|------------------|
| `.work.biz/context/HANDOFF.md` | Last session state, pending tasks, key decisions |
| `.work.biz/plans/NEXT.md` | Current tactical next action |
| `.work.biz/plans/UNKNOWNS.md` | Open questions that may affect routing |
| `.work.biz/pipeline/pipeline_tracker.md` | Pipeline status, active deals, bottlenecks |

If any of these files don't exist yet (project not bootstrapped), the first recommendation is `@biz-bootstrap init`.

Also read `skills/SKILL_DEPENDENCIES.md` to know the current gate graph.

---

## I1 — Intent mapping

Parse the user's request against this routing table. Match on intent, not keywords.

| Intent cluster | Example requests | Skill(s) to route | Gate required |
|---|---|---|---|
| **Setup / bootstrap** | "start a new project", "set up my business folder", "create .work.biz" | `@biz-bootstrap init` | — |
| **Strategy / niche / offer** | "figure out my niche", "define my offer", "who should I target", "what should I sell" | `@biz-strategy greenfield` or `probe` | scaffold |
| **Market validation** | "test if my idea works", "validate my niche", "run an experiment" | `@biz-market-validate test` | strategy-ready |
| **Brand / LinkedIn / website** | "fix my LinkedIn", "rewrite my profile", "update my website", "make me look professional" | `@biz-brand audit` → `@biz-brand overhaul` | strategy-ready |
| **Pricing** | "how much should I charge", "set my prices", "price this project" | `@biz-pricing set` | strategy-ready |
| **Content / LinkedIn posts** | "write a LinkedIn post", "publish an article", "create content", "content calendar" | `@biz-content publish` or `plan` | brand-ready |
| **Community** | "join communities", "engage on Reddit", "find my audience" | `@biz-community engage` | brand-ready |
| **Referrals** | "ask for referrals", "get introduced" | `@biz-referrals ask` | — |
| **Discovery / sales calls** | "prepare for a call", "run a discovery call", "I have a prospect meeting" | `@biz-discovery prepare` or `run` | pipeline-ready |
| **Proposals** | "write a proposal", "scope this project" | `@biz-proposal write` | pipeline-ready + pricing set |
| **Objections** | "client said it's too expensive", "handle objections", "overcome price concerns" | `@biz-objections handle` | sales-ready |
| **Pipeline diagnosis** | "nothing is converting", "find my bottleneck", "why aren't we closing" | `@biz-pipeline-diagnosis run` | pipeline tracker with data |
| **Review / health** | "weekly review", "how are we doing", "progress check" | `@biz-review weekly` | at least one strategy doc |
| **Session management** | "start the day", "close the session", "what was I doing" | `@session-biz start` or `close` or `status` | scaffold |
| **Project orientation** | "where am I", "what should I do next", "I'm lost" | `@session-biz status` + `@biz-review status` | — |

If the request spans multiple intents (e.g., "I want to fix my LinkedIn and start posting content"), route through all matching skills in gate order.

---

## I2 — Gate check

Before invoking any skill, verify its prerequisites against `SKILL_DEPENDENCIES.md`:

```
strategy-ready → brand-ready → pipeline-ready → sales-ready
```

### Check each gate:

| Gate | How to verify | If not met |
|------|--------------|------------|
| scaffold | `.work.biz/` exists | Route to `@biz-bootstrap init` first |
| strategy-ready | `strategy_niche*.md` or equivalent exists in `.work.biz/plans/` | Route to `@biz-strategy greenfield` first |
| brand-ready | LinkedIn / website aligned (check via `@biz-brand status`) | Route to `@biz-brand overhaul` first |
| pipeline-ready | Pipeline tracker configured + pricing set | Route to `@biz-pricing set` + configure tracker |
| sales-ready | Discovery call process verified | Route to `@biz-discovery run` first |

**Blocked output shape:**

```text
⛔ BLOCKED: <skill> requires <gate>
  Why: <explanation of what's missing>
  Fix: run `@<gate-unlocking-skill>` first
```

---

## I3 — Execute

Once intent is mapped and gates are confirmed, execute the skill(s):

1. **Single skill** — invoke directly with the appropriate verb.
2. **Multi-skill chain** — execute in dependency order. After each completes, verify output before proceeding to the next.
3. **Session context** — if running within a session, load HANDOFF first and update it after completion.

For each skill invocation, follow its `skill.md` instructions completely — do not skip steps.

---

## I4 — Gap detection

If after scanning all skills no existing skill covers the user's request:

1. **State the gap clearly** — "There is no existing skill for `<request>`."
2. **Describe what a new skill would need to cover** — scope, inputs, outputs, place in gate graph.
3. **Recommend creation** — "Consider creating `.ai.biz/skills/biz-<name>/skill.md` following the conventions in `skills/README.md` and `CONVENTIONS.md`."

### Example

```text
⚠️ GAP: No skill exists for "customer onboarding tracking"

A new skill `biz-onboarding` would need to:
  - Define onboarding stages and milestones
  - Provide a tracking template (likely under .work.biz/pipeline/)
  - Gate after pipeline-ready (requires active deal)

To create: model after `biz-pipeline-diagnosis` and register in skills/README.md.
```

---

## Completion

After execution:

| Action | Detail |
|--------|--------|
| Update HANDOFF | Document what was accomplished this session |
| Update NEXT | Set the next action based on completed work |
| Update UNKNOWNS | Log any new open questions discovered |
| Report summary | Brief one-paragraph: what was done, what's next |

---

## References

- `skills/README.md` — full skill registry with descriptions and verbs
- `skills/SKILL_DEPENDENCIES.md` — gate graph and prerequisite checks
- `START_HERE.md` — operator decision tree
- `PROCESS_ROUTER.md` — quick routing table
- `CONVENTIONS.md` — naming, phases, core principles
