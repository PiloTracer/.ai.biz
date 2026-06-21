---
name: biz-strategy
description: >-
  Define your niche, unified offer, target buyer, and channel strategy.
  Produces strategy docs that guide all other business development.
  Certifies strategy-ready gate. biz-strategy greenfield, biz-strategy probe,
  biz-strategy certify, biz-strategy status.
---

# biz-strategy

**Canonical path:** `.ai.biz/skills/biz-strategy/skill.md`

Define your niche, unified offer, target buyer, channel plan, and pricing range. This is the foundational Business OS skill — every other skill depends on the strategy docs this skill produces. Run before anything else.

**Research basis:** Niche specialization commands 20-30% premium pricing over generalists. Specialists convert at 2-3x the rate of multi-service agencies. Single-offer positioning reduces choice overload (Hick's Law) and increases conversion. See `RESEARCH_APPENDIX.md` §1 for full sourcing.

---

## Core Frameworks

### One Block Method (5 Elements)

| Element | Question | Clarification |
|---------|----------|---------------|
| **One Person** | Who is the target buyer? | A specific person with a title, context, and pain. Not a demographic. |
| **One Problem** | What is the real problem? | The root cause, not the symptom. What keeps them up at night. |
| **One Offer** | What is the unified service? | One service that bundles expertise, guidance, and execution. Not a menu. |
| **One Channel** | Where do they look for help? | Primary channel to reach them. Not every possible channel. |
| **Price range** | What do they expect to pay? | Value-aligned range. Not hourly. Not too wide. |

The 5 elements must be internally consistent — each constrains the others. A $80k platform buyer does not discover you on TikTok. A local service business owner does not pay $20k for a landing page.

### Assumption Ledger

Every strategy decision rests on a mix of:

| Category | Meaning | Action |
|----------|---------|--------|
| **Confirmed** | Direct evidence exists | Document the evidence. Use as foundation. |
| **Inferred** | Reasonable but unverified | Flag for probe mode. Test before certifying. |
| **Unknown** | No evidence either way | Gap to fill. May block certification. |

Rule of thumb: If more than 30% of your strategy assumptions are "unknown", run `@biz-strategy probe` before certifying.

### Geography (Where You Operate)

| Scope | Implication |
|-------|-------------|
| Local | Same-city only. High trust. Limited deal size. |
| Regional | Multi-city within country. Moderate trust. Moderate scale. |
| Global (remote) | Anywhere. English-working. Timezone-flexible. Lowest trust overhead but highest competition. |

Choice constrains channel, price, and offer structure.

---

## Parse invocation

| User says | Mode |
|-----------|------|
| `@biz-strategy greenfield` | Generate full strategy from scratch. Walk through all 6 elements. |
| `@biz-strategy greenfield - from <file>` | Generate strategy using an existing document as seed. |
| `@biz-strategy probe` | Adaptive gap-filling questioning. Targets unknown/inferred assumptions. |
| `@biz-strategy probe - <element>` | Probe a specific element (person, problem, offer, channel, price, geography). |
| `@biz-strategy certify` | Deep consistency check. Promotes strategy-ready gate on pass. |
| `@biz-strategy certify - why` | Explain why current strategy would fail certification (without attempting it). |
| `@biz-strategy status` | Read-only state report. What's defined, what's missing, gate status. |

**Default:** `status` if no verb matches.

---

## Work tree

All strategy files live under `{WORK_BUSINESS_ROOT}` (`.work.biz/`):

| File | Purpose |
|------|---------|
| `strategy/one-pager.md` | Single-page summary of all 6 elements |
| `strategy/assumption-ledger.md` | Full assumption ledger with evidence |
| `strategy/offer-scope.md` | Detailed offer definition, what it IS and IS NOT |
| `strategy/target-buyer-profile.md` | Detailed buyer persona |
| `strategy/channel-plan.md` | Primary channel + supporting channels |
| `strategy/certification.md` | Gate certification record (certify mode writes here) |

---

## I0 — Pre-checks

| Condition | Action |
|-----------|--------|
| `{WORK_BUSINESS_ROOT}` does not exist | **Block**: "Run `@biz-bootstrap init` first to scaffold the work tree." |
| Strategy files exist and mode is `greenfield` | Warn: "Strategy already exists at `{WORK_BUSINESS_ROOT}/strategy/`. Run `@biz-strategy probe` to refine, or overwrite with `greenfield - force`." |
| Mode is `certify` and no strategy files exist | **Block**: "No strategy defined. Run `@biz-strategy greenfield` first." |

---

## I1 — Greenfield mode

Walk through all 6 elements in sequence. Each produces a section for `strategy/one-pager.md`. After each element, summarize the choice before proceeding.

### Element 1: One Person (Target Buyer)

Walk the user through:

1. **Job title / role** — Who writes the check? (Not the user, the buyer.)
2. **Company context** — Stage (seed, growth, enterprise), size (revenue, headcount), industry.
3. **What they already tried** — Before coming to you. What alternatives have they explored?
4. **What they value most** — Speed? Quality? Trust? Cost? Expertise?
5. **What they fear most** — What goes wrong if they pick the wrong person?

**Output:** Write `strategy/target-buyer-profile.md` with the detailed persona.

**Sharpness test:** Can you name 3 real people who fit this description? If not, the persona is too vague.

### Element 2: One Problem (The Real Problem)

Walk through:

1. **Surface request** — What they say they want ("I need a website").
2. **Real problem** — What they actually need ("I need leads before I run out of runway").
3. **Why current solutions fail** — Consultants advise but don't ship. Freelancers ship but don't think. Agencies are expensive and slow.
4. **Cost of inaction** — What happens if they don't solve this in 90 days?

**Output:** Append to `strategy/one-pager.md`.

**Sharpness test:** If the problem can be stated in under 14 words, it's sharp enough. "I need someone who can design and build my platform, not just one or the other."

### Element 3: One Offer (The Unified Service)

Walk through:

1. **The headline** — One sentence that packages strategy + architecture + delivery.
2. **What it IS** — Specific deliverables, outcomes, process.
3. **What it is NOT** — Explicitly list the adjacent offers you are NOT selling (critical for focus).
4. **Proof** — What existing work demonstrates you can deliver this.

**Output:** Write `strategy/offer-scope.md`.

**Format example:**

| What this IS | What this is NOT |
|--------------|------------------|
| Custom platform development (strategy + build) | Fractional CTO (consulting-only) |
| Fixed-price, milestone-gated | Hourly billing or retainer |
| End-to-end delivery | Code review of someone else's work |
| Single point of contact | Team management layer |

**Sharpness test:** Can a stranger read the headline and know within 5 seconds whether they're the right buyer? If they say "wait, do you also do X?", the offer is fuzzy.

### Element 4: One Channel (Primary Channel)

Walk through:

1. **Where the buyer looks** — When they need this problem solved, where do they start?
2. **Where the buyer trusts** — Which platform/community has their attention and trust?
3. **Your existing footprint** — Where do you already have presence, network, or content?
4. **Channel fit** — Does the channel support the price range? (LinkedIn for $20k+ B2B. Referrals for high-trust. Cold email for low-ticket. YouTube for broad awareness.)

**Output:** Write `strategy/channel-plan.md`.

**Channel credibility (source: validated research):**

| Channel | Best for | Trust path |
|---------|----------|------------|
| LinkedIn + warm referrals | High-ticket B2B ($20k+) | Warm introduction → case study → call |
| Community engagement | Mid-ticket expertise plays | Helpful answers → profile → DM |
| Content marketing | Inbound positioning | Post → profile view → website → call |
| Cold outreach | Volume plays under $5k | Message → call (low conversion) |
| YouTube / podcast | Long-term brand building | Content → subscribe → wait (6-18 months) |

**Rule:** Pick ONE primary channel. Everything else is secondary. Split channel focus kills momentum.

### Element 5: Price Range

Walk through:

1. **Value-based floor** — What is the problem costing the buyer per month/quarter? Your price should be a fraction of that.
2. **Effort-based ceiling** — At your minimum viable rate ($X/hr), what does the effort cost? That's your floor, not your price.
3. **Market alternatives** — What would an agency charge? A freelancer? A hire?
4. **Research benchmarks:** For custom platform development, solo operators charge $20k-$80k per engagement. Senior developer hourly: $100-$180/hr. SaaS MVP: $25k-$80k. Enterprise web apps: $50k-$250k+.
5. **Range shape** — Fixed-price, milestone-gated. 50% upfront standard.

**Output:** Append price range to `strategy/one-pager.md`.

**Rule:** Price range should be a 2-4x spread, not 10x. "$20k-$80k" is good. "$5k-$200k" means you don't know who you serve.

### Element 6: Geography

Walk through:

1. **Where can you legally work?** — Visa, tax, entity constraints.
2. **Where does your buyer expect you to be?** — Local buyers may require local presence. Global buyers may not care.
3. **Timezone compatibility** — 4+ hour overlap minimum for synchronous work.
4. **Language** — Primary business language of engagement.

**Output:** Append geography to `strategy/one-pager.md`.

**Common defaults:**
- Technical solo operators: Global (remote), English-working
- Local service agencies: Same metro area
- Niche consulting: Regional or same-country

---

### Element 7: Assumption Ledger (Build)

After the 6 elements are drafted, build the assumption ledger:

1. For each element, list every factual claim underpinning the decision.
2. Grade each: **Confirmed** (direct evidence), **Inferred** (reasonable but not verified), **Unknown** (no evidence).
3. Write to `strategy/assumption-ledger.md`.

**Ledger format:**

```markdown
| Category | Assumption | Evidence | Element |
|----------|-----------|----------|---------|
| Confirmed | [assumption] | [file, source, or observation] | [element] |
| Inferred | [assumption] | [what makes it reasonable] | [element] |
| Unknown | [assumption] | [gap description] | [element] |
```

### Greenfield completion

When all 6 elements + ledger are written:

```text
✓ Strategy one-pager:    {WORK_BUSINESS_ROOT}/strategy/one-pager.md
✓ Target buyer profile:  {WORK_BUSINESS_ROOT}/strategy/target-buyer-profile.md
✓ Offer scope:           {WORK_BUSINESS_ROOT}/strategy/offer-scope.md
✓ Channel plan:          {WORK_BUSINESS_ROOT}/strategy/channel-plan.md
✓ Assumption ledger:     {WORK_BUSINESS_ROOT}/strategy/assumption-ledger.md

Next: @biz-strategy certify  (validate consistency and promote gate)
```

---

## I2 — Probe mode

Adaptive questioning to fill gaps. When assumptions are "inferred" or "unknown", or when an element feels fuzzy.

**Probe behavior:**

1. If no element specified, scan `strategy/assumption-ledger.md` for the highest-severity gap (unknown > inferred). Probe that.
2. If element specified (`@biz-strategy probe - person`), probe only that element.
3. Ask ONE question at a time. Wait for answer before next question.
4. After 3-5 answers, summarize the updated picture and propose a revision.

**Probe question bank (by element):**

| Element | Probe questions |
|---------|----------------|
| **Person** | "Who specifically has this problem and the budget to solve it?" "Have you talked to 3 of them?" "What title do they have on LinkedIn?" "What did they try before finding you?" "What would make them say 'not now'?" |
| **Problem** | "What happens if they do nothing for 6 months?" "Is the problem painful enough to pay $X for?" "Who else is solving this, and why isn't it working?" "Is this the real problem or a symptom?" |
| **Offer** | "If you could only offer ONE thing, what would it be?" "What adjacent offers are you willing to walk away from?" "Does the offer fit a fixed-price milestone model?" "What does success look like for the buyer after delivery?" |
| **Channel** | "Where does your buyer currently get advice?" "Which platform have you been most active on historically?" "What content format does your buyer consume?" "If you could only do ONE channel for 90 days, which?" |
| **Price** | "What number would make you excited to take the project?" "What number would make them say yes without negotiation?" "What does the alternative (agency / hire / build in-house) cost?" |
| **Geography** | "Where are your last 5 clients or employers based?" "Can you legally invoice a client in that country?" "What timezone overlap do you need for the work style you prefer?" |

**Probe completion:** When all assumption-ledger gaps tagged "unknown" are resolved to at least "inferred", or when remaining unknowns are explicitly flagged as acceptable risk.

---

## I3 — Certify mode

Deep consistency check. Produces a pass/fail verdict and promotes the **strategy-ready** gate on pass.

### Certification checklist

Each check must pass. First failure stops the check.

| # | Check | What it verifies | Fail if |
|---|-------|------------------|---------|
| 1 | **Files exist** | All 5 strategy files present | Any file missing |
| 2 | **Ledger complete** | All elements have at least one assumption recorded | An element has zero entries |
| 3 | **Unknown tolerance** | Unknown assumptions ≤ 30% of total | More than 30% unknown (run probe first) |
| 4 | **Internal consistency** | Each element constrains and is constrained by the others | Person can't afford price. Channel doesn't reach person. Problem doesn't match offer. Geography blocks channel. |
| 5 | **Person specificity** | Buyer is a specific person, not a demographic | "Small business owners" (too vague) vs "Seed-stage SaaS founders who raised $500k and need their MVP built" (specific) |
| 6 | **Problem sharpness** | Problem is the root cause, stated in under 14 words | Problem is vague ("they need help with technology") or stated as a solution ("they need a website") |
| 7 | **Offer focus** | Offer is ONE thing with explicit IS / IS NOT | Offer lists 3+ services. No "what this is NOT" section. |
| 8 | **Channel primary** | One primary channel identified. Others are secondary. | 3+ channels listed as equal priority. No primary channel named. |
| 9 | **Price range** | Range is 2-4x spread. Floor covers minimum viable rate. | Range is wider than 4x. Floor below minimum viable rate. |
| 10 | **Geography defined** | Geography is explicit (local, regional, or global). | No geography stated. "Everywhere" without timezone/language constraints. |

### Consistency check: Element web

Every pair of elements must be consistent:

```
Person ── Problem:  Does this person actually have this problem?
Person ── Offer:    Would this person buy this offer?
Person ── Channel:  Does this person spend time on this channel?
Person ── Price:    Can this person afford this price range?
Person ── Geography: Is this person in the geography?

Problem ── Offer:   Does this offer solve this problem?
Problem ── Channel: Do people with this problem seek help on this channel?
Problem ── Price:   Is the problem painful enough to justify the price?

Offer ── Channel:   Can this offer be sold through this channel?
Offer ── Price:     Does the offer economics support the price?
Offer ── Geography: Can this offer be delivered in this geography?

Channel ── Price:   Does this channel support this price range?
Channel ── Geography: Does this channel reach buyers in this geography?

Price ── Geography: Does the geography's market support this price?
```

### Failure modes (specific)

| Failure | Pattern | Fix |
|---------|---------|-----|
| **The everything shop** | 3+ services listed equally | Cut to ONE. Move others to "case study" or "what I've built" |
| **The demographic trap** | "Small business owners" or "startups" | Add constraints: funded? non-technical? seed-stage? B2B? |
| **The price mismatch** | $5k offer sold on LinkedIn (works) vs $5k offer sold via YouTube (channel too slow) or $80k offer sold via cold email (trust too low) | Adjust channel to match price, or price to match channel |
| **The geography gap** | Global remote but no timezone statement | Add minimum overlap (e.g. "4hr overlap with US Eastern") |
| **The symptom problem** | "They need a website" instead of "They need leads" | Probe deeper. Ask "why do they need a website?" 3x. |
| **The wishful channel** | "I'll use all of them" | Force single primary channel selection. Others are secondary at most. |

### Pass

If all checks pass:

1. Write `strategy/certification.md` with:
   - Date of certification
   - Check results (all pass)
   - Assumption ledger summary (counts: confirmed, inferred, unknown)
   - Certified by: `@biz-strategy certify`

2. Promote **strategy-ready** gate in `{WORK_BUSINESS_ROOT}/gates.md`:

```markdown
## strategy-ready
**Status:** PASS
**Certified:** {date}
**By:** @biz-strategy certify
**Next gate:** brand-ready (@biz-brand audit)
```

3. Output:

```text
✓ CERTIFIED: strategy-ready
  All 10 checks passed. No critical consistency failures.
  Next: @biz-brand audit  (audit LinkedIn + website alignment)
         @biz-pricing set  (set specific prices for engagements)
```

### Fail

If any check fails:

```text
✗ FAILED: strategy-ready not certified
  Failed at check #{n}: {check name}
  Reason: {specific failure}
  To proceed: {specific action — e.g., "Run @biz-strategy probe - person to clarify the buyer"}
  Current unknown count: {n} of {total} ({pct}%) — {'must be ≤30%' if over}
```

Do NOT write `certification.md`. Do NOT promote the gate.

### Explain mode (`certify - why`)

Read-only analysis of why the current strategy would fail certification, without modifying any files or attempting certification. Outputs the expected failure point and what to fix.

---

## I4 — Status mode

Read-only state report. Reads existing strategy files and reports:

```
Strategy status — {WORK_BUSINESS_ROOT}/strategy/

  One-pager:            {exists/missing}  ({last modified date if exists})
  Target buyer profile: {exists/missing}
  Offer scope:          {exists/missing}
  Channel plan:         {exists/missing}
  Assumption ledger:    {exists/missing}
  Certification:        {exists/missing}

  Gate: strategy-ready  {PASS / FAIL / NOT ATTEMPTED}

  Assumption summary:
    Confirmed: {n}   Inferred: {n}   Unknown: {n}   ({pct}% unknown — {'pass' if ≤30% else 'over threshold'})

  Element summary:
    Person:   {defined/missing} — {one-line summary if defined}
    Problem:  {defined/missing} — {one-line summary if defined}
    Offer:    {defined/missing}
    Channel:  {defined/missing}
    Price:    {defined/missing}
    Geography: {defined/missing}

  Quick actions:
    @biz-strategy greenfield        (if missing or wants full rewrite)
    @biz-strategy probe - <element> (to fill a gap)
    @biz-strategy certify           (to promote gate)
```

---

## Time budget

| Mode | Estimated time | Notes |
|------|---------------|-------|
| `greenfield` | 45-90 minutes | Full walkthrough. Schedule a block. |
| `greenfield - from <file>` | 20-40 minutes | Faster if seed doc is detailed. |
| `probe` | 5-15 minutes | Per element. Variable based on gaps. |
| `certify` | 5-10 minutes | Quick if strategy is clean. |
| `status` | < 1 minute | Read-only. Near-instant. |

---

## Gates unlocked

| Gate | Unlocked by | Enables |
|------|-------------|---------|
| **strategy-ready** | `@biz-strategy certify` (pass) | `@biz-brand audit`, `@biz-pricing set`, `@biz-content publish`, `@biz-market-validate test` |
| — | (strategy-ready must pass before any downstream skill) | All biz-* skills check this gate implicitly |

See `SKILL_DEPENDENCIES.md` for the full gate graph.

---

## When to re-run

| Situation | Action |
|-----------|--------|
| Adding a new service line | `@biz-strategy greenfield - force` (restart from scratch) |
| First 90 days are up and no traction | `@biz-strategy probe - person` (is the buyer real?) then `@biz-strategy probe - problem` (is the problem painful enough?) |
| First client signed but market feels different from strategy | `@biz-strategy probe` (scan for new assumptions from real market feedback) |
| Buyer conversations consistently confuse the offer | `@biz-strategy probe - offer` then `@biz-strategy certify` |
| 6+ months since last certification | `@biz-strategy probe` then `@biz-strategy certify` (re-certify quarterly) |

---

## Related skills

| Skill | When |
|-------|------|
| `@biz-bootstrap init` | Before strategy — scaffolds the work tree |
| `@biz-brand audit` | After certification — align LinkedIn/website to the strategy |
| `@biz-pricing set` | After certification — set specific engagement prices |
| `@biz-content publish` | After brand-ready gate — publish content aligned to strategy |
| `@biz-market-validate test` | Anytime — run experiments to validate strategy assumptions |

---

## Files to reference

- `{WORK_BUSINESS_ROOT}/strategy/one-pager.md`
- `{WORK_BUSINESS_ROOT}/strategy/target-buyer-profile.md`
- `{WORK_BUSINESS_ROOT}/strategy/offer-scope.md`
- `{WORK_BUSINESS_ROOT}/strategy/channel-plan.md`
- `{WORK_BUSINESS_ROOT}/strategy/assumption-ledger.md`
- `{WORK_BUSINESS_ROOT}/strategy/certification.md`
- `{WORK_BUSINESS_ROOT}/gates.md`
- `.ai.biz/skills/SKILL_DEPENDENCIES.md`
- `.work/reference/RESEARCH_APPENDIX.md` (external references)
