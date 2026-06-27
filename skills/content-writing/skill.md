---
name: content-writing
description: >-
  Write, plan, or improve any piece of content — articles, blog posts, LinkedIn
  posts, case studies, landing-page copy, email sequences, social threads,
  newsletters, thought-leadership pieces, technical deep dives, or any other
  written content. Produces publication-ready, professional-quality output
  calibrated to the host project's brand voice, audience, tech stack, and
  channel — not generic filler. Always use this skill for content creation
  tasks, even simple ones, because the project-context loading and structure
  guidance dramatically improve output quality regardless of the model used.
  content-writing write, content-writing plan, content-writing repurpose,
  content-writing audit, content-writing status.
---

# content-writing

**Canonical path:** `.ai.biz/skills/content-writing/skill.md`

Produce professional, publication-ready content. Generic filler and hollow marketing language are the enemy. Every sentence must earn its place. Output must be technology-grounded, specific, and credible enough that a knowledgeable reader would trust the author on first read.

This skill is **model-agnostic**: it produces high-quality results regardless of the LLM in use because it enforces evidence-first reasoning, project context loading, and a completion gate before anything is delivered.

---

## Parse invocation

| User says | Mode |
|-----------|------|
| `@content-writing write - <topic>` | Author one finished piece (default). |
| `@content-writing write - <type> about <topic>` | Author with explicit type (article, post, case study, landing page, email, thread, newsletter). |
| `@content-writing plan - <horizon>` | Build a content calendar / topic plan (e.g., `30 days`, `Q3`). |
| `@content-writing repurpose - <source>` | Spin one existing piece into 3–4 format variants. |
| `@content-writing audit - <draft or path>` | Critique an existing draft against the quality bar; output fixes, not a rewrite. |
| `@content-writing status` | Read-only: report what brand/audience context was loaded and what's missing. |

**Default:** `write` if no verb matches. If the user gives a free-text request like "write me a post about X" with no verb, treat it as `write - <their words>`.

---

## I0 — Project Context Contract (run before writing anything)

Output is only as good as the context it's grounded in. Load context in **priority order** and stop when you have enough. Do not skip to writing with no context.

### Priority 1 — Host project memory (Business OS, if present)

Read, if they exist, in this order:

| File | What it gives you |
|------|-------------------|
| `.work.biz/strategy/one-pager.md` | Niche, unified offer, target buyer, channel, price range |
| `.work.biz/strategy/target-buyer-profile.md` | Who reads this content, what they fear, what they value |
| `.work.biz/strategy/offer-scope.md` | What the offer IS / IS NOT — keeps content on-position |
| `.work.biz/strategy/channel-plan.md` | Primary channel → matching content format |
| `.work.biz/context/HANDOFF.md` | Recent decisions; avoid contradicting them |

### Priority 2 — Project identity file

Read the project root `.cursorrules` (or `AGENTS.md`) — its `REPLACE:` tokens resolve to the real `PROJECT_NAME`, `UNIFIED_OFFER`, `TARGET_BUYER`, `PRICE_RANGE`. These four values anchor voice and positioning.

### Priority 3 — Tech stack & proof (technology tilt)

These skills exist to produce **technology-related** results. Establish the operator's real tech fingerprint so content is concrete:

- `package.json`, `pyproject.toml`, `requirements.txt`, `go.mod`, `Cargo.toml`, `docker-compose*.yml` → real stack.
- `README.md` → what the project actually does.
- Any `work/`, `case-studies/`, or `docs/` folder → real projects to cite with numbers.

### Priority 4 — Brand standard

Read `standards/*BRAND-GUIDE*` and `standards/*CONTENT-STANDARD*` if present. These are binding; do not violate them.

### Priority 5 — Fallback example

If none of the above yield a usable brand/audience, load `references/project-context.example.md` (a worked example showing the expected shape and depth) and state explicitly: **"No project context found; using generic professional defaults calibrated to the example profile."** Then proceed with professional-quality defaults and the structure rules below.

### Context summary (emit briefly before drafting)

```
LOADED CONTEXT
  Project:      <name or "unnamed — generic defaults">
  Offer:        <one line or "unspecified">
  Audience:     <buyer or "general tech-aware readers">
  Stack:        <concrete tech or "unspecified — keep examples generic">
  Channel:      <primary channel or "unspecified — match request">
  Gaps:         <what's missing that the user should supply for better output>
```

If critical gaps exist (no audience, no offer, no tech proof), name them and ask **one** consolidated question only if they would materially change the output. Otherwise proceed.

---

## I1 — `write` mode

### Step 1 — Understand the assignment

Resolve these from the conversation; ask only if genuinely unclear:

| Question | Why it matters |
|---|---|
| **Content type** | Article, post, case study, landing page, email, thread, newsletter? |
| **Primary audience** | Who reads this, what do they already know? |
| **Goal** | Inform, attract leads, build trust, convert, entertain? |
| **Channel** | Blog, LinkedIn, Twitter/X, newsletter, website? |
| **Tone** | Match brand voice by default; override if specified |
| **Length** | Match channel norms unless specified |
| **CTA** | What should the reader do after reading? |

If the request already answers most, proceed without interrogating.

### Step 2 — Outline (long-form only)

For pieces over ~600 words, emit a 3–5 bullet outline and confirm direction before writing. For short-form, go straight to the draft.

### Step 3 — Universal quality rules

**Show, don't tell.** Replace adjectives with data, examples, or proof.
- Bad: "We have deep expertise in AI development."
- Good: "The RAG stack I built retrieves from 40,000 private documents in under 400ms."

**Lead with the reader's problem, not your credentials.** First paragraph makes the reader feel seen. Credentials are evidence, not the opener.

**One idea per paragraph.** If a paragraph does two jobs, split it.

**Cut the first sentence of every draft.** It's almost always a warm-up. The real opener is usually sentence two.

**Specificity beats generality every time.** "6–12 weeks to MVP" lands harder than "fast delivery." "4,900-line tax engine" beats "complex backend logic."

**No hollow intensifiers.** Remove: very, really, truly, certainly, absolutely, incredibly, amazing, game-changing, revolutionary, cutting-edge, world-class, robust, scalable (unquantified), seamless.

**Earn the CTA.** Don't ask for action until you've delivered enough value that the reader *wants* the next step.

**Technology tilt (mandatory).** At least one concrete technical detail per major section — a stack choice, a number, a tradeoff, a failure mode. If you cannot produce one, the piece is too vague; revise.

### Step 4 — Format by content type

#### Blog article / thought leadership

```
[Headline]      — specific, benefit-driven or tension-based. Not clever for its own sake.
[Subheadline]   — one sentence expanding on the headline promise.

[Hook paragraph] — 2–4 sentences. Open with the reader's problem or a
  counterintuitive claim. No "In today's fast-paced world."

[Body sections] — H2 every 300–500 words. Each makes one argument or delivers
  one insight. Use examples, numbers, or mini-case-studies.

[Conclusion]    — Restate the core insight in fresh language. Don't summarize
  what they just read. Add a forward-looking implication.

[CTA]           — One clear action. No list of options.
```

#### LinkedIn post

```
[Hook line]   — First line stops the scroll. Question, counterintuitive
  claim, or specific number. Under 12 words.

[3–6 short paragraphs] — One idea each. White space is your friend.
  Conversational but substantive. Personal angle beats generic advice.

[Insight]     — The sentence people screenshot.

[CTA / question] — Invite engagement with a specific prompt.

[Hashtags]    — 3–5 max. Relevant, not desperate.
```

#### Case study

```
[Project title + one-line result] — Lead with the outcome.

[The Problem]   — Client's situation before. Concrete about the pain.
[The Approach]  — What you built and why. Technical choices justified in
                  business terms. Avoid jargon without explanation.
[The Result]    — Numbers. Before/after. Specific outcomes.
[Stack used]    — List actual technologies with brief rationale.
[What made it hard] — Optional but powerful. Shows genuine depth.
```

#### Landing page copy

```
[Hero headline]    — One promise. Under 10 words. Specific.
[Sub-headline]     — Who it's for + what they get.
[Social proof]     — Number, client, or result.

[Problem section]  — Name the pain precisely.
[Solution section] — How you solve it differently.
[Evidence section] — Case studies, numbers, specifics.
[Objection handling] — The three reasons they'd say no.
[CTA]              — One action. Repeated 2–3x down the page.
```

#### Email (outbound or nurture)

```
Subject line:   Specific, short, no spam triggers. Under 50 chars.
Preview text:   Complements subject, adds intrigue.

[Opening]        — One sentence. Reference something real.
[Value/insight]  — 2–3 sentences of genuine usefulness.
[Bridge to offer] — Natural, not a pivot.
[CTA]            — One link, one action.
[Signature]      — Name, role, one credibility line.
```

#### Technical deep dive (article variant)

Use when the topic is genuinely technical and the reader wants depth:
- State the problem and the constraint set up front.
- Show the architecture decision and the alternatives rejected, with reasons.
- Include a concrete code/config snippet only if it earns its place (real, not illustrative filler).
- Close with the tradeoff: what this choice costs you.

### Step 5 — SEO (for web content only)

If the content publishes online, incorporate without making it obvious:

- **Primary keyword:** in headline, first paragraph, one H2, and naturally 2–4x in body.
- **Secondary keywords:** weave naturally. Never stuff.
- **Meta description:** 150–160 chars. Lead with keyword. End with benefit.
- **Internal linking opportunities:** flag where the user could link to related pages.
- **Title tag:** under 60 chars, separate from on-page H1.

Derive keywords from the loaded offer/audience, not guessed. If no offer context, ask the user for the single primary keyword before writing web content.

### Step 6 — Deliver

Provide the complete, ready-to-publish content. Then, below a divider, offer:

1. **Alternate headlines** (3 options — different angles)
2. **SEO meta description** (if web content)
3. **One-sentence summary** of what makes this piece work
4. **Optional:** a short-form variant (LinkedIn post / thread starter) if the piece is long-form

Do not pad the response with commentary about what you did. Show the work, not the commentary.

---

## I2 — `plan` mode

Build a topic plan / content calendar. Output a Markdown table:

| Week | Date range | Topic | Type | Channel | Angle / hook seed | Target keyword | Repurpose into |
|------|------------|-------|------|---------|--------------------|----------------|----------------|

Rules:
- Every topic must trace to a loaded audience pain or the operator's proven work. No orphan topics.
- Balance the four topic buckets (below) across the horizon; never repeat the same bucket three weeks in a row.
- For each topic, name a real, specific hook seed (not "TBD").

**Topic buckets (technology tilt):**

| Bucket | Description |
|--------|-------------|
| **Architecture lesson** | A design decision, a tradeoff, a mistake — with the specifics. |
| **AI in practice** | Real experience with AI/ML — not hype, not theory. |
| **Experience-based insight** | Judgment that only comes from years of doing this. |
| **Project behind-the-scenes** | Specific, credible, ships — show the work with numbers. |

For seasonal anchoring (optional, helpful for solo operators):

| Quarter | Theme |
|---------|-------|
| Q1 | "New year, new platform" — planning, architecture foundations, choosing a stack |
| Q2 | "Building in public" — behind-the-scenes, mid-build lessons |
| Q3 | "Deep dives" — architecture depth, AI integration patterns, scaling lessons |
| Q4 | "Reflections" — yearly lessons, what you'd do differently, next-year planning |

---

## I3 — `repurpose` mode

Take one existing piece and produce 3–4 format variants without losing substance:

| Format | Use |
|--------|-----|
| Original long-form | The canonical asset |
| LinkedIn post | Extract the single strongest insight |
| Thread / short-form | 4–8 punchy units, same spine |
| Lead-magnet PDF / case study | Expanded, gated version |

Rule: each variant must stand alone — no "see the full post for context."

---

## I4 — `audit` mode

Critique a draft. Do **not** rewrite wholesale. Output:

1. **Verdict:** publication-ready / needs revision / needs rewrite.
2. **What works** (2–4 bullets, specific).
3. **What fails** (bullets, each tied to a quality rule violated — quote the offending line).
4. **Concrete fixes** (line-level: "replace X with Y because Z").
5. **Missing proof:** list any section making an unproven claim and what evidence would fix it.

---

## I5 — `status` mode (read-only)

Report:
- What context was loaded (or that none exists and `.work.biz` is unbootstrapped).
- Whether a content/brand standard is present and binding.
- The operator's tech stack fingerprint as detected.
- Gaps that would improve output if supplied.

---

## Quality check before delivering (run internally; do not output the checkboxes)

- [ ] Does the first sentence earn its place, or is it a warm-up?
- [ ] Is there at least one specific number, example, or proof point per major section?
- [ ] Have I cut all hollow adjectives (amazing, cutting-edge, world-class, robust, seamless, scalable unquantified)?
- [ ] Does the CTA ask for one clear thing?
- [ ] Is the brand voice consistent throughout?
- [ ] Would the target reader find this genuinely useful, not just promotional?
- [ ] Is the length appropriate for the channel?
- [ ] Technology tilt: is there at least one concrete technical detail per major section?
- [ ] Are unproven claims either backed by a cited source or marked **Unverified**?

If any box is unchecked, fix it before delivering.

---

## Completion gate (cannot be skipped)

You may only claim the task complete when all are true:
1. The deliverable is written (or the plan/audit produced).
2. Project context was loaded per I0; any critical gaps were surfaced.
3. The quality check above passes.
4. Unproven claims are flagged **Unverified** or backed by evidence.
5. A concrete next step is proposed (e.g., "supply these proof points," "publish to channel X," "run `@content-writing repurpose` on this").

---

## Time budget

| Mode | Time |
|------|------|
| `write` (short-form) | 15–25 min |
| `write` (long-form) | 30–60 min |
| `plan` | 20–40 min |
| `repurpose` | 20–30 min |
| `audit` | 10–20 min |
| `status` | < 2 min |

---

## Gates & dependencies

This skill has **no hard prerequisite gate** — it can run any time, like an entry-level generative skill. It improves dramatically when the host project is bootstrapped (`@biz-bootstrap init`) and strategy-certified (`@biz-strategy certify`), because then audience, offer, and channel are loaded from project memory rather than guessed.

When Business OS is present and the user is publishing to attract leads, the companion ops skill `@biz-content` governs the *publishing workflow* (calendar, tracker, engagement cadence). This skill governs the *craft* of writing. They compose: use `content-writing` to draft, `biz-content` to publish and track.

---

## Related skills

| Skill | When |
|-------|------|
| `@biz-content publish` | Publishing workflow, engagement, repurpose cadence — ops layer |
| `@biz-brand overhaul` | When brand voice / profile is not yet defined |
| `@business-ideas` | Ideation that content can later amplify |
| `@product-service-ideas` | Product concepts to write case studies about |