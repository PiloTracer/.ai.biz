---
name: product-service-ideas
description: >-
  Generate, refine, or evaluate specific product or service concepts — SaaS
  features, new product lines, service packages, API products, AI-powered tools,
  platform extensions, digital products, productized services, or add-ons to an
  existing offering. Also handles improving or extending an existing product.
  Produces structured product concepts with enough depth to evaluate
  feasibility, prioritize a roadmap, and scope a build — not vague feature
  wishlists. Concepts are technology-tilted and buildability-checked against the
  operator's real stack, regardless of the model used. product-service-ideas
  generate, product-service-ideas extend, product-service-ideas scope,
  product-service-ideas audit, product-service-ideas status.
---

# product-service-ideas

**Canonical path:** `.ai.biz/skills/product-service-ideas/skill.md`

Generate product and service concepts that are **buildable, differentiated, and grounded in real user pain** — not feature ideas dressed up as products.

The test for every idea: *Could a founder use this to write a one-page spec and start building next Monday?* If not, it's not specific enough.

This skill is **model-agnostic**: project-context loading, buildability checks against the real stack, a prioritization matrix, and a completion gate keep output useful across any LLM.

---

## Parse invocation

| User says | Mode |
|-----------|------|
| `@product-service-ideas generate - <space / seed>` | Produce 5–8 structured product/service concepts. |
| `@product-service-ideas generate - <space> - count <n>` | Produce exactly n concepts. |
| `@product-service-ideas extend - <existing product>` | Add-ons / extension concepts for an existing product. |
| `@product-service-ideas scope - <concept name>` | Produce a ruthlessly minimal MVP definition for one concept. |
| `@product-service-ideas audit - <concept name>` | Evaluate one concept against the quality bar; output Go/Refine/Kill. |
| `@product-service-ideas status` | Read-only: report loaded stack, market, and proof points. |

**Default:** `generate` if no verb matches. "What product could I build for logistics?" → `generate - logistics`.

---

## I0 — Project Context Contract (run before ideating)

Product ideas must be buildable with existing skills or a clearly defined extension of them. Load in **priority order**; stop when you have enough.

### Priority 1 — Operator capabilities & market (host project memory)

| File | What it gives you |
|------|-------------------|
| `.work.biz/strategy/offer-scope.md` | What the offer IS / IS NOT — products must extend, not contradict |
| `.work.biz/strategy/target-buyer-profile.md` | The real user AND the real buyer |
| `.work.biz/strategy/channel-plan.md` | How this product reaches the market |
| `.work.biz/pipeline/pipeline_tracker.md` | Real requests — what buyers actually ask for |
| `.work.biz/context/HANDOFF.md` | Recent direction |

### Priority 2 — Project identity

Read the project root `.cursorrules` / `AGENTS.md`. Resolve `REPLACE:` tokens: `PROJECT_NAME`, `UNIFIED_OFFER`, `TARGET_BUYER`, `PRICE_RANGE`.

### Priority 3 — Tech fingerprint (technology tilt — mandatory)

These skills produce **technology-related** results. Buildability is the core gate, so establish the stack precisely:

- `package.json`, `pyproject.toml`, `requirements.txt`, `go.mod`, `Cargo.toml`, `docker-compose*.yml`
- `README.md`; any `work/`, `case-studies/`, or `docs/` folder.
- Derive: frameworks, databases, queues, AI/LLM providers, infra, and integrations already proven in production.

A concept that doesn't map to this stack must state explicitly which missing piece is needed and how it's obtained (buy / partner / build).

### Priority 4 — Standards

Read `standards/*PRICING-STANDARD*` and `standards/*BUSINESS-CONVENTIONS*` if present (binding).

### Priority 5 — Fallback example

If none of the above exist, load `references/project-context.example.md` and state explicitly: **"No project context found; using generic professional defaults calibrated to the example profile."** Proceed with the user's brief plus professional defaults.

### Context summary (emit before ideating)

```
LOADED CONTEXT
  Build target:  <new product / extension / service package — or "from request">
  User & buyer:  <roles — or "unspecified">
  Stack:         <concrete tech or "unspecified — keep concepts stack-portable">
  Build capacity: <solo / small team; 6–12 wk envelope — or "unspecified">
  Price point:   <target — or "unspecified">
  Gaps:          <what to ask the user for better concepts>
```

If user/buyer or stack is missing, ask **one** consolidated question only if it would materially change the concepts.

---

## I1 — `generate` mode

### Step 1 — Clarify the design space

Establish (from context or ask):

| Dimension | Determine |
|---|---|
| **Build target** | New standalone product, extension to existing platform, service package? |
| **User** | Who uses it day-to-day? (role, company type, technical level) |
| **Buyer** | Who pays? (may differ from user) |
| **Core problem** | What specific workflow or pain point does this address? |
| **Stack constraint** | Any platform, language, or integration requirements? |
| **Build capacity** | What can realistically ship in 6–12 weeks solo / small team? |
| **Price point** | Free tool for leads? $99/mo SaaS? $5K project? |

### Step 2 — Ideation framework

Generate across these lenses. Use at least 3.

#### Lens 1 — Workflow automation
Collapse a multi-step manual process into one product action.
- Map the steps someone does today by hand.
- Separate rule-based (automatable) vs judgment-based (AI-assistable).
- Build around the most painful or time-consuming step.

#### Lens 2 — Data → insight
Make data that already exists useful.
- Document processing (invoices, contracts, reports, logs).
- Operational data (ERP exports, spreadsheets, databases that don't talk to each other).
- Compliance data (tax, audit, HR, safety).

#### Lens 3 — AI layer over legacy
Replace spreadsheet/PDF/legacy-software workflows with a modern AI-native interface.
- Target: industries with 10–20 year-old tooling and high document volume.
- The moat is domain knowledge + AI integration, not the AI itself.

#### Lens 4 — Missing middleware
Close the integration gap that keeps companies from using tools they already own.
- What data can't talk to what other data?
- What workflow crosses three SaaS tools and still needs a human to copy-paste?

#### Lens 5 — Service → product
Templatize what's currently delivered as a bespoke engagement.
- What does the operator build repeatedly that could become a configurable product?
- What onboarding/setup/consulting could be self-served?

#### Lens 6 — Platform extension
Add a layer to a platform the operator already built/owns.
- White-label admin dashboards.
- AI reporting layers over existing databases.
- RAG-over-documents add-on for an existing SaaS.

### Step 3 — Output format

For each concept, deliver a structured entry. Target **5–8 concepts** unless scope is specified. Cut weak ideas — do not pad the list.

```
### [Product Name] — [One-line description]

**Type:** [SaaS / API / PWA / CLI tool / Service package / Platform add-on / Other]
**Primary user:** [Specific role, e.g., "Operations manager at a 20-person logistics company"]
**Core problem:** [The specific thing that frustrates them today]
**What it does:** [3–5 sentences. Inputs, outputs, interfaces — concrete.]
**Key features (MVP scope):**
  1. [Feature — why it's core, not nice-to-have]
  2. [Feature]
  3. [Feature]
**Integrations:** [APIs, platforms, or data sources this must connect to]
**Tech fit:** [Which parts of the operator's existing stack this builds on — name them; "extension needed: X" if partial]
**Pricing model:** [Specific — e.g., "$199/mo per workspace, up to 5 users"]
**How to validate in 2 weeks:** [Concrete validation step before building anything]
**MVP build estimate:** [Weeks, assuming solo full-stack developer]
**The thing that makes it hard:** [Honest statement of the core technical or market challenge]
**Why this hasn't been built already:** [Or: why existing solutions fall short]
```

The `Tech fit` field is the technology-tilt gate. If it's "no fit," reframe or cut.

### Step 4 — Prioritization matrix

Produce a 2×2 matrix in text:

```
HIGH VALUE / LOW EFFORT  → Build first
HIGH VALUE / HIGH EFFORT → Plan for phase 2
LOW VALUE / LOW EFFORT   → Quick wins / lead-gen tools
LOW VALUE / HIGH EFFORT  → Don't build
```

Assign each concept to a quadrant with a one-sentence rationale. Be decisive — no "it depends" without a clear condition.

### Step 5 — MVP scoping (for the top concept)

Produce a brief MVP definition:

- **Problem statement:** one sentence. What pain does this solve?
- **Core user story:** `As a [user], I want to [action] so that [outcome].`
- **MVP feature set:** exactly what ships in v1 — ruthlessly minimal.
- **Explicitly OUT of scope for MVP:** prevents scope creep.
- **Definition of done:** how do you know the MVP is working?
- **First 3 users:** who specifically would test this?
- **Success metric at 30 days:** one measurable outcome.

---

## I2 — `extend` mode

For an existing product, generate extensions/add-ons. Same output format as `generate`, plus:
- **Dependency:** what in the existing product this requires.
- **Monetization shape:** upsell, tier unlock, usage add-on, or free-differentiator.

Weight toward the loaded existing platform's real surfaces (admin dashboards, existing DBs, existing auth).

---

## I3 — `scope` mode

Take one named concept and produce the MVP definition described in Step 5 above, in full depth, plus:
- **Open technical questions** (graded Confirmed / Inferred / Unknown).
- **One low-cost validation experiment** to run before any build.
- A **"what would make me abandon this"** kill-criterion.

---

## I4 — `audit` mode

Evaluate one concept against the quality bar. Output a **Go / Refine / Kill** verdict with:
1. **Buildability verdict** — maps to stack / needs extension / not buildable.
2. **Problem reality** — is the pain concrete and the buyer named?
3. **MVP discipline** — is scope ruthlessly minimal, or gold-plated?
4. **Pricing realism** — sourced or marked Unverified.
5. **The single change most likely to make this succeed.**

---

## I5 — `status` mode (read-only)

Report:
- Loaded stack fingerprint.
- Confirmed user/buyer.
- Existing platform surfaces that extensions could attach to.
- Proof points available (real projects, numbers).
- Gaps to supply for stronger concepts.

---

## Quality check before delivering (run internally)

- [ ] Is every concept specific enough to write a one-page spec from?
- [ ] Does every MVP ship in under 12 weeks for one developer?
- [ ] Have I named a concrete first user/buyer for each concept?
- [ ] Is the pricing model realistic for the described market (sourced or Unverified)?
- [ ] Have I honestly stated what makes each concept hard?
- [ ] Is the prioritization matrix decisive, not hedging?
- [ ] Does the top concept's MVP pass the "ruthlessly minimal" test?
- [ ] Technology tilt: does every concept trace to the operator's real stack (or name the extension)?
- [ ] Are ≥3 ideation lenses used?

If any box is unchecked, fix it before delivering.

---

## Completion gate (cannot be skipped)

You may only claim the task complete when all are true:
1. 5–8 structured concepts delivered (or the requested count).
2. ≥3 ideation lenses represented.
3. Project context loaded per I0; tech-fit assessed per concept.
4. Prioritization matrix produced; top concept MVP-scoped.
5. Each concept states honestly what makes it hard.
6. A concrete next step is proposed (e.g., "run `@product-service-ideas scope - <top>`", "validate with `@biz-market-validate test`", "spec with `@biz-proposal write`").

---

## Time budget

| Mode | Time |
|------|------|
| `generate` | 35–60 min |
| `extend` | 25–45 min |
| `scope` | 20–35 min |
| `audit` | 15–25 min |
| `status` | < 2 min |

---

## Gates & dependencies

No hard prerequisite gate. Runs any time. Strongly improves when the host project is bootstrapped and strategy-certified (real user/buyer + real stack = buildable concepts instead of feature wishlists).

In a Business OS project, this skill composes with:
- `@business-ideas` — upstream; a business idea can be drilled into a product concept here.
- `@biz-market-validate test` — validate the top concept cheaply before building.
- `@biz-proposal write` — turn the scoped MVP into a fixed-price proposal.
- `@content-writing` — write a case study or launch post for the concept.

---

## Related skills

| Skill | When |
|-------|------|
| `@business-ideas` | Upstream business-idea layer |
| `@biz-market-validate test` | Validate the top concept before building |
| `@biz-pricing set` | Set real prices for the productized concept |
| `@biz-proposal write` | Scope the MVP into a fixed-price proposal |
| `@content-writing` | Case study / launch content for the concept |