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

## Free-text intake contract

When the user invokes `@biz-director` with natural language, follow this write/structure/format/channel discipline so the request becomes the correct `biz-*` skill invocation and is recorded in `.work.biz/` memory.

### 1. Capture
- Preserve the user's exact wording (quote it in `{HANDOFF}`).
- Do not silently rewrite a business request into engineering/UI work.

### 2. Load context
- Read `{HANDOFF}`, `{NEXT}`, `{PIPELINE_TRACKER}`, and `skills/README.md` + `skills/SKILL_DEPENDENCIES.md` before classifying.
- If `.work.biz/` is missing, route to `@biz-bootstrap init` first.

### 3. Classify (intent → skill)
- Match by intent, not keyword. Use the intent mapping table in § I1.
- If the intent is engineering/backend/DB/API, redirect to `@ai-director` or `@x-director`.
- If the intent is UI/design, redirect to `@ui-director` or `@x-director`.
- If the intent spans business + engineering/UI, route to `@x-director`.
- If unclear, run a short probe (max 3 questions) or route to `@process-router`.

### 4. Channel (intent → skill chain)
- Map the intent to the exact skill chain from § I1 and check `SKILL_DEPENDENCIES.md` gates per § I2.
- Use canonical invocation syntax: `@<skill-id> <mode>` or `@<skill-id> <mode> - <argument>` with ASCII hyphen `-`.

### 5. Structure/format the record
After the workflow completes or changes state, update `{HANDOFF}`, `{NEXT}`, and `{UNKNOWNS}` using this shape:

```markdown
## Latest action (@biz-director)
**Date:** YYYY-MM-DD
**Request:** "<user's original request>"
**Classified intent:** <intent-cluster>
**Executed:**
1. @<skill> <mode> - <arg> → <result>
2. ...
**Blockers:** <any unresolved items | none>
**Next recommended:** @<skill> <mode> - <arg>
```

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

Also read `skills/README.md` to know the full skill registry and canonical verbs, and `skills/SKILL_DEPENDENCIES.md` to know the current gate graph.

---

## I1 — Intent mapping

Parse the user's request against this routing table. Match on intent, not keywords.

| Intent cluster | Example requests | Skill(s) to route | Gate required |
|---|---|---|---|
| **Setup / bootstrap** | "start a new project", "set up my business folder", "create .work.biz" | `@biz-bootstrap init` | — |
| **Strategy / niche / offer** | "figure out my niche", "define my offer", "who should I target", "what should I sell", "certify my strategy", "check if strategy is ready", "how's my strategy looking" | `@biz-strategy` (greenfield, probe, certify, or status per parse invocation) | scaffold |
| **Market validation** | "test if my idea works", "validate my niche", "run an experiment", "design a validation test", "design an experiment" | `@biz-market-validate` (test, design, or status per parse invocation) | — (can run any time) |
| **Brand / LinkedIn / website** | "fix my LinkedIn", "rewrite my profile", "update my website", "make me look professional", "check my brand presence", "how's my LinkedIn doing" | `@biz-brand` (audit, overhaul, or status per parse invocation) | strategy-ready |
| **Pricing** | "how much should I charge", "set my prices", "price this project", "revise my pricing", "is my pricing right", "what's my current price" | `@biz-pricing` (set, revise, or status per parse invocation) | strategy-ready |
| **Content publishing ops (LinkedIn)** | "publish this on LinkedIn", "set up my LinkedIn content tracker", "LinkedIn content calendar", "LinkedIn engagement cadence" | `@biz-content publish` or `plan` | brand-ready |
| **Social media content (platform-specific)** | "write a reddit post about X", "create an instagram post for...", "draft a facebook post", "write something for LinkedIn and Reddit", "make a post for instagram about...", "linkedin post idea", "write a tweet about...", "generate social media content", "draft a twitter thread" | `@content-social` (write, repurpose, research, strategy, plan, or status per parse invocation) | — (no hard gate for write/research/repurpose; strategy-ready for strategy/plan modes) |
| **Community find & engage** | "join communities", "engage on Reddit", "find my audience", "find communities to join", "where should I participate", "find subreddits for...", "find instagram accounts in...", "find facebook groups for..." | `@biz-community` (find, engage, or status per parse invocation) | — (no hard gate; improves with strategy-ready) |
| **Referrals** | "ask for referrals", "get introduced" | `@biz-referrals ask` | — |
| **Discovery / sales calls** | "prepare for a call", "run a discovery call", "I have a prospect meeting" | `@biz-discovery prepare` or `run` | pipeline-ready |
| **Proposals** | "write a proposal", "scope this project", "review my proposal before sending", "check proposal pipeline" | `@biz-proposal` (write, review, or status per parse invocation) | pipeline-ready |
| **Objections** | "client said it's too expensive", "handle objections", "overcome price concerns", "roleplay objection responses" | `@biz-objections handle` or `roleplay` | active deal |
| **Pipeline diagnosis** | "nothing is converting", "find my bottleneck", "why aren't we closing" | `@biz-pipeline-diagnosis run` | pipeline tracker with data |
| **Review / health** | "weekly review", "quarterly review", "how are we doing", "progress check" | `@biz-review` (weekly, quarterly, or status per parse invocation) | at least one strategy doc |
| **Session management** | "start the day", "close the session", "what was I doing" | `@session-biz start` or `close` or `status` | scaffold |
| **Project orientation** | "where am I", "what should I do next", "I'm lost" | `@session-biz status` + `@biz-review status` | — |
| **Deploy to project** | "deploy to my project", "copy .ai.biz to another repo", "clone Business OS", "archive deploy to a project" | `@deploy-files copy - <path>` or `@deploy-repo` (clone, archive, or status per parse invocation) | — |
| **Content writing (craft)** | "write me a post about X", "draft an article on Y", "help me write something for LinkedIn", "write a LinkedIn post", "publish an article" (when no integration/ops needed), "case study", "landing page copy", "email sequence", "repurpose this draft", "audit my draft" | `@content-writing` (write, plan, repurpose, audit, or status per parse invocation) | — (no hard gate; improves with strategy/brand-ready) |

> **Content route disambiguation (three-tier):**
> 
> 1. **Pure writing craft** (blog articles, case studies, landing pages, emails, newsletters, technical deep dives) → `@content-writing` (no gate). Platform-agnostic, quality-gated writing.
> 
> 2. **Platform-specialized social content** (Reddit posts, Instagram captions + visual briefs, LinkedIn posts, Facebook Group posts, X/Twitter tweets + threads, cross-platform repurposing, trending topic research, platform strategy) → `@content-social` (no gate for write/research/repurpose). Each piece calibrated to platform culture, audience, and format norms.
> 
> 3. **LinkedIn publishing ops** (content tracker, posting calendar, engagement cadence tracking, A/B hook testing across posts) → `@biz-content` (brand-ready gate). Ops layer for LinkedIn specifically.
> 
> **How they compose:** `@content-writing write` produces a long-form piece. `@content-social repurpose` spins it into platform-native posts for Reddit, Instagram, LinkedIn, Facebook, X/Twitter. `@biz-content publish` tracks LinkedIn performance. `@biz-community find` discovers where to post. `@biz-community engage` handles daily comment participation.
| **Business ideas** | "give me business ideas for...", "what businesses could benefit from...", "how could I monetize...", "I want to start something in...", "pivot my business", "stress-test this idea", "new venture directions" | `@business-ideas` (generate, stress, pivot, or status per parse invocation) | — (no hard gate; improves with strategy-ready) |
| **Product / service ideas** | "what product could I build for...", "give me SaaS product ideas in...", "what features should I add", "I want a tool that...", "service package ideas", "scope an MVP for", "evaluate this product concept", "extend my platform" | `@product-service-ideas` (generate, extend, scope, audit, or status per parse invocation) | — (no hard gate; improves with strategy-ready) |

If the request spans multiple intents (e.g., "I want to fix my LinkedIn and start posting content"), route through all matching skills in gate order.

**Verb selection:** After mapping intent to a skill, read that skill's `skill.md` **Parse invocation** table to select the correct verb for the user's phrasing. The verbs listed above are the most common — the skill's own parse table is authoritative. For example, "certify my strategy" maps to `@biz-strategy` intent cluster; the director then reads `biz-strategy/skill.md` to confirm `certify` is the correct verb. If a user asks for something the skill does not support, report the gap.

**Status requests:** Free-text requests asking "how is X doing", "check X", or "what's the state of X" should route to the matching skill's `status` mode (read-only). If the user simply wants orientation ("where am I", "what's next"), use the "Project orientation" row above.

---

## I2 — Gate check

Before invoking any skill, verify its prerequisites against `SKILL_DEPENDENCIES.md`:

```
scaffold → strategy-ready → brand-ready → pipeline-ready → sales-ready → active deal
```

### Gate-exempt skills (skip the gate check entirely)

These **project-aware generative skills** have **no prerequisite gate** and may be invoked at any time — even before `@biz-bootstrap init` or on an entirely unbootstrapped project. Do **not** redirect to `@biz-bootstrap init` for them, and do **not** emit a `BLOCKED` gate report. They load the host project's own context dynamically and fall back to a bundled example profile when none exists (output improves once strategy/brand are defined).

| Skill | Verb | Note |
|------|------|------|
| `@content-writing` | `write` · `plan` · `repurpose` · `audit` · `status` | Craft of content; no gate |
| `@content-social` | `write` · `research` · `repurpose` · `status` | Platform-specialized social content; no gate (strategy/plan modes require strategy-ready) |
| `@business-ideas` | `generate` · `stress` · `pivot` · `status` | Ideation; no gate |
| `@product-service-ideas` | `generate` · `extend` · `scope` · `audit` · `status` | Concepts + MVP scoping; no gate |
| `@biz-market-validate` | `test` · `design` · `status` | (pre-existing) Validation; no gate |
| `@biz-community` | `find` · `engage` · `status` | Community discovery + engagement; no gate |

### Check each gate:

| Gate | How to verify | If not met |
|------|--------------|------------|
| scaffold | `.work.biz/` exists | Route to `@biz-bootstrap init` first |
| strategy-ready | Strategy docs exist + certified (.work.biz/plans/) | Route to `@biz-strategy greenfield` → `@biz-strategy certify` |
| brand-ready | LinkedIn / website aligned to offer (check via `@biz-brand status`) | Route to `@biz-brand audit` → `@biz-brand overhaul` |
| pipeline-ready | Pipeline tracker configured + pricing set | Route to `@biz-pricing set` + configure tracker |
| sales-ready | Discovery call process verified | Route to `@biz-discovery run` first |
| active deal | At least one deal in pipeline tracker with stage ≥ Conversation | Route to `@biz-discovery run` first to generate pipeline |

### Informal prerequisites

Some skills have lighter prerequisites that are not formal gates:

| Skill | Requires | How to verify |
|-------|---------|---------------|
| `@biz-review weekly` | At least one strategy doc exists | Check `.work.biz/plans/` for any `strategy_*.md` |
| `@biz-pipeline-diagnosis run` | Pipeline tracker has data | Check `.work.biz/pipeline/pipeline_tracker.md` has ≥1 row of deal data |

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

**Loaded during I0 (gate + registry):**
- `skills/README.md` — full skill registry with descriptions and verbs
- `skills/SKILL_DEPENDENCIES.md` — gate graph and prerequisite checks

**Operator reference (not loaded by director — available if needed):**
- `START_HERE.md` — operator decision tree; useful when user is disoriented
- `PROCESS_ROUTER.md` — quick routing table; useful as a secondary intent-matching aid
- `CONVENTIONS.md` — naming, phases, core principles; referenced during gap detection (I4)
