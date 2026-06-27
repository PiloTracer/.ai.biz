---
name: business-ideas
description: >-
  Generate business ideas, business-model suggestions, go-to-market strategies,
  pivot ideas, new venture concepts, revenue-model options, niche
  identification, or any exploration of "what kind of business could I build
  around X." Produces structured, research-grounded, honest business thinking
  — never a list of vague buzzword-adjacent concepts. Ideas are technology-tilted
  and stress-tested before delivery, so output survives contact with reality
  regardless of the model used. business-ideas generate, business-ideas stress,
  business-ideas pivot, business-ideas status.
---

# business-ideas

**Canonical path:** `.ai.biz/skills/business-ideas/skill.md`

Produce business ideas that are **specific, defensible, and honest** — not a list of "what if you built an AI-powered X for Y" suggestions that evaporate on contact with reality.

This skill is **model-agnostic**: it enforces project-context loading, evidence-first reasoning, an assumption ledger, and a completion gate, so output quality holds across any LLM.

---

## Parse invocation

| User says | Mode |
|-----------|------|
| `@business-ideas generate - <domain / seed>` | Produce 5–8 structured ideas across archetypes. |
| `@business-ideas generate - <domain> - count <n>` | Produce exactly n ideas. |
| `@business-ideas stress - <idea name or index>` | Stress-test one idea: market, moat, ramp, risks. |
| `@business-ideas pivot - <current situation>` | Generate pivot directions from an existing business. |
| `@business-ideas status` | Read-only: report loaded operator context and constraints. |

**Default:** `generate` if no verb matches. A free-text request like "give me business ideas for logistics" is treated as `generate - logistics`.

---

## I0 — Project Context Contract (run before ideating)

Ideas must play to real operator strengths, not hypothetical ones. Load in **priority order**; stop when you have enough.

### Priority 1 — Operator profile & constraints (host project memory)

| File | What it gives you |
|------|-------------------|
| `.work.biz/strategy/one-pager.md` | Niche, offer, buyer, channel, price range — the active business to build around or pivot from |
| `.work.biz/strategy/target-buyer-profile.md` | Who the operator already sells to |
| `.work.biz/strategy/offer-scope.md` | What the offer IS / IS NOT — constrains adjacent ideas |
| `.work.biz/strategy/assumption-ledger.md` | What's confirmed vs inferred vs unknown — reuse confirmed facts |
| `.work.biz/context/HANDOFF.md` | Recent direction; don't propose ideas that contradict it |
| `.work.biz/pipeline/pipeline_tracker.md` | Real deals — evidence of where the operator already wins |

### Priority 2 — Project identity

Read the project root `.cursorrules` / `AGENTS.md`. Resolve `REPLACE:` tokens: `PROJECT_NAME`, `UNIFIED_OFFER`, `TARGET_BUYER`, `PRICE_RANGE`. These anchor the operator's real capabilities and market.

### Priority 3 — Tech fingerprint (technology tilt — mandatory)

These skills produce **technology-related** results. Establish what the operator can actually build:

- `package.json`, `pyproject.toml`, `requirements.txt`, `go.mod`, `Cargo.toml`, `docker-compose*.yml`
- `README.md`, any `work/` or `case-studies/` folder.
- Derive: real stack, proven domains (e.g., FinTech, AI, multi-tenant SaaS, EdTech), and ship cadence.

An idea that the operator cannot build with this stack is not an idea for them — it's a wish. Discard or reframe it.

### Priority 4 — Standards

Read `standards/*BUSINESS-CONVENTIONS*` and `standards/*PRICING-STANDARD*` if present (binding — fixed-price, milestone-gated, no hourly).

### Priority 5 — Fallback example

If none of the above exist, load `references/project-context.example.md` and state explicitly: **"No project context found; using generic professional defaults calibrated to the example profile."** Proceed with the brief the user gave plus professional defaults.

### Context summary (emit before ideating)

```
LOADED CONTEXT
  Operator:     <solo / agency / team — or "unspecified">
  Existing offer: <one line or "unspecified">
  Stack:        <concrete tech or "unspecified — keep ideas tech-generic">
  Market:       <B2B/B2C, geo — or "unspecified">
  Constraints:  <capital / time / avoid-zones — or "unspecified">
  Gaps:         <what to ask the user for better ideas>
```

If operator profile or stack is missing, ask **one** consolidated question only if it would materially change the ideas. Otherwise proceed with the user's stated brief.

---

## I1 — `generate` mode

### Step 1 — Understand the brief

Resolve these (infer from context; ask only if critical):

| Dimension | What to determine |
|---|---|
| **Operator profile** | Solo founder? Agency? Team? What do they already know how to do? |
| **Resource constraints** | Capital? Time? Technical ability? |
| **Market preference** | B2B, B2C, B2B2C? Enterprise, SMB, consumer? |
| **Geography** | Global SaaS, regional, specific country/industry? |
| **Ambition level** | Lifestyle? VC-backable? Productized service? |
| **Time horizon** | Revenue in 90 days? Building for 3 years? |
| **Avoid zones** | Industries, models, or commitments they can't or won't do |

### Step 2 — Idea generation framework

Generate ideas across **at least 3 distinct strategic archetypes**. Quantity without archetype diversity is a list, not strategy.

#### Archetype A — Productize the skill
Take an existing capability and sell the output as a product rather than a service.
- What can the operator do that clients repeatedly pay for?
- Can it be packaged, templatized, or automated into a scalable product?
- What's the minimum feature set that delivers the core value?

#### Archetype B — Serve an underserved niche
Find a vertical where the general solution is too expensive, too complex, or too generic.
- Who is currently underserved by existing software?
- What niche has high willingness to pay but low attention from big vendors?
- Where does domain expertise + technical skill create a moat?

#### Archetype C — Leverage the AI moment
Identify workflows AI can automate or radically improve — where the operator's technical judgment is the differentiator, not just the AI tool itself.
- What expensive human process can now be 10× faster with the right AI stack?
- Where are businesses paying for labor that AI can replace, if someone builds the wrapper?
- What data-heavy or document-heavy industries lack a proper AI layer?

#### Archetype D — Platform / infrastructure play
Build the layer others build on top of.
- What does every company in a space need but nobody has built well?
- What common infrastructure problem creates a captive long-term customer?
- Where does multi-tenant SaaS make sense with the existing stack?

#### Archetype E — Geographic / regulatory arbitrage
Where a specific region or regulatory regime is underserved by US/EU-standard tooling.
- Which verticals in LATAM / emerging markets run on legacy or Excel?
- Where does local compliance + modern stack create a defensible wedge?

Use at least 3 of A–E in every `generate`. Never produce 5 ideas that are all the same archetype in disguise.

### Step 3 — Output format

For each idea, produce a structured entry. Aim for **5–8 ideas** unless the user specifies otherwise. Quality over quantity — ideas that can't survive a basic stress test are cut before delivery.

```
### [Idea Name] — [One-line positioning]

**Category:** [Archetype A/B/C/D/E or combination]
**Target buyer:** [Specific role + company type + size]
**The problem it solves:** [Concrete pain, not abstract opportunity]
**How it works:** [2–4 sentences. What does the user actually get?]
**Revenue model:** [SaaS / fixed-fee / usage / retainer / hybrid]
**Why now:** [What market condition, technology shift, or gap makes this viable today?]
**Unfair advantage for this operator:** [Why this operator specifically can win here — trace to loaded stack/proven work]
**Realistic first customer:** [Who would pay first, and why would they trust you?]
**Biggest risk:** [The honest thing most likely to kill this idea — be blunt]
**Estimated ramp:** [Time and minimum investment to first paying customer]
**Buildability with this stack:** [Yes / partial extension / no — name what's missing]
```

The `Buildability` field is the technology tilt gate. If the answer is "no" and no extension path exists, cut the idea or reframe it.

### Step 4 — Ranking and honest assessment

After listing, produce a **ranked shortlist** of the top 3 with rationale. Rank by:

1. **Speed to first revenue** — How quickly could this generate $5K–$25K?
2. **Fit with operator capabilities** — No pivot required; build on what already exists.
3. **Defensibility** — Is there a moat, or will 40 competitors appear in 6 months?
4. **Market size** — Large enough to matter, focused enough to win.

Be honest. If an idea is attractive but needs skills, capital, or connections the operator doesn't have, say so. A business idea that wastes 12 months is worse than no idea.

### Step 5 — Assumption ledger (for the top 3)

For each ranked idea, list the assumptions under its recommendation, graded:

| Category | Meaning |
|----------|---------|
| **Confirmed** | Direct evidence (operator docs, stated constraints, real deals) |
| **Inferred** | Reasonable but unverified — flag for stress mode |
| **Unknown** | No evidence — must be tested before committing |

Mark any market-size, pricing-norm, or "what works" claim that is not sourced as **Unverified**.

---

## I2 — `stress` mode

Take one idea (by name or index) and try to kill it. The goal is honesty, not validation.

1. **Market reality** — Is the buyer real? Named? Funded? Reaching them: is the named channel realistic for the price?
2. **Moat test** — What stops a funded competitor from cloning this in 90 days?
3. **Ramp test** — Can the operator realistically reach first paying customer in the stated time with stated resources?
4. **Stack test** — Can they build it with the loaded stack? What extension is needed?
5. **Risk ranking** — Rank the top 3 failure modes by likelihood × impact.

Output: a **Go / Refine / Kill** verdict, the single highest-leverage thing to de-risk first, and one low-cost validation experiment to run this week.

---

## I3 — `pivot` mode

Given an existing business situation (revenue plateau, channel exhaustion, model fatigue), generate pivot directions that **preserve existing assets** (audience, stack, reputation, data) while changing one of: offer, buyer, channel, or revenue model.

Output the same structured entry as `generate`, plus a **"what this preserves / what this abandons"** pair for each pivot.

---

## I4 — `status` mode (read-only)

Report:
- Operator profile and constraints as loaded.
- Tech stack fingerprint.
- Whether strategy docs / pipeline data exist (evidence availability).
- Gaps to supply for stronger ideation.

---

## Quality check before delivering (run internally)

- [ ] Is every "problem" statement concrete, not abstract?
- [ ] Does every idea have a realistic named first buyer?
- [ ] Have I been honest about the biggest risk for each idea?
- [ ] Are revenue model and pricing realistic for the market (sourced or marked Unverified)?
- [ ] Does the ranking reflect genuine conviction, not hedging?
- [ ] Have I avoided buzzword ideas that don't survive a second question?
- [ ] Technology tilt: does every idea trace to the operator's real stack or a clearly named extension?
- [ ] Are archetypes diverse (≥3 used)?
- [ ] Is every unproven claim graded in the assumption ledger?

If any box is unchecked, fix it before delivering.

---

## Completion gate (cannot be skipped)

You may only claim the task complete when all are true:
1. 5–8 structured ideas delivered (or the count the user specified).
2. ≥3 distinct archetypes represented.
3. Project context loaded per I0; buildability assessed per idea.
4. Top-3 ranking + assumption ledger produced.
5. Biggest risk stated honestly for each idea.
6. A concrete next step is proposed (e.g., "run `@business-ideas stress - #2`", "validate with `@biz-market-validate test`").

---

## Time budget

| Mode | Time |
|------|------|
| `generate` | 30–60 min |
| `stress` | 15–25 min per idea |
| `pivot` | 25–40 min |
| `status` | < 2 min |

---

## Gates & dependencies

No hard prerequisite gate. Runs any time. Strongly improves when the host project is bootstrapped and strategy-certified, because ideas then build on the operator's real offer, buyer, and stack rather than hypotheticals.

In a Business OS project, this skill feeds naturally into:
- `@biz-market-validate test` — cheaply test a top idea before committing.
- `@product-service-ideas` — drill a business idea into a concrete product/service concept.
- `@content-writing` — turn an idea into thought-leadership content.

---

## Related skills

| Skill | When |
|-------|------|
| `@biz-market-validate test` | Test a top idea before building |
| `@product-service-ideas` | Turn a business idea into a buildable product/service concept |
| `@biz-strategy greenfield` | Formalize a chosen idea into the project's strategy |
| `@content-writing` | Turn the idea into content that attracts early buyers |