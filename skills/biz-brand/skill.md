---
name: biz-brand
description: >-
  Audit and overhaul your LinkedIn profile, website, and brand assets to
  match your unified offer. biz-brand audit, biz-brand overhaul, biz-brand status.
---

# Skill: biz-brand — Brand Audit & Overhaul

## Overview

This skill covers three modes:

| Mode | Command | Description |
|------|---------|-------------|
| **audit** | `biz-brand audit` | Read-only assessment of current LinkedIn, website, and brand assets against the unified offer |
| **overhaul** | `biz-brand overhaul` | Full rewrite of LinkedIn profile, website positioning, and brand asset consistency |
| **status** | `biz-brand status` | Read-only state report of current brand configuration |

---

## 1. Audit Mode — `biz-brand audit`

Run this first. It does not change anything.

### 1.1 LinkedIn Audit

Check each of these and report pass/fail:

| Check | Pass | Fail |
|-------|------|------|
| Headline tells a stranger what you do + who you help within 5 seconds | | |
| Headline contains zero skill-lists ("\|" separators, comma lists) | | |
| About section opening (first 2-3 sentences) states one clear offer | | |
| About section includes proof (specific project outcomes) | | |
| About section ends with a CTA | | |
| Featured section contains 3 items that reinforce the same offer | | |
| Banner image has text overlay matching the offer | | |
| Recent 3 posts/comments are on-topic | | |

### 1.2 Website Audit

| Check | Pass | Fail |
|-------|------|------|
| Homepage headline states one offer (not a list of services) | | |
| No generic service-box grid (SEO, Hosting, ERP, etc.) | | |
| Case studies or portfolio is present and linked from homepage | | |
| Calendly link is prominent (top nav, hero, or footer) | | |
| Analytics (Plausible, Umami, or GA4) is installed | | |
| SEO schema (JSON-LD for Person or Organization) is present | | |
| "Who I work with" is stated explicitly | | |

### 1.3 Brand Asset Audit

| Check | Pass | Fail |
|-------|------|------|
| Color palette is consistent across LinkedIn banner, website, and any PDF assets | | |
| Typography matches across platforms | | |
| Logo/avatar is the same or visually consistent | | |
| Tone of voice is consistent (not formal on website, casual on LinkedIn) | | |

### 1.4 Audit Output

After checks are run, produce a summary:

```
Brand Audit — 2026-06-21

LinkedIn:       4/8 passed
Website:        3/7 passed
Brand Assets:   2/4 passed

Overall:        9/19 passed

Next step recommended: biz-brand overhaul
```

---

## 2. Overhaul Mode — `biz-brand overhaul`

### 2.1 LinkedIn Overhaul

#### 2.1.1 Rewrite Headline

Rules:
- No skill-lists (`Project Manager | Developer | AI Enthusiast`)
- Lead with outcome: "I build custom [type] platforms for [who]"
- Under 220 characters
- Pick one pattern below

**Pattern A — Outcome-first:**
```
I build custom AI-powered platforms. Strategy → Architecture → Delivery. One person, end to end.
```

**Pattern B — Buyer-first:**
```
I help non-technical founders build custom platforms — without needing a CTO or a dev team.
```

**Pattern C — Problem-first:**
```
Custom platform development for companies that need serious engineering. 36 years shipping production software.
```

**Pattern D — Short & direct (when character count is tight):**
```
Custom AI platforms. Strategy. Architecture. Delivery. One person.
```

**How to choose:** Post one for 2 weeks. If profile views come from target buyers (founders, CEOs), keep it. If views come from recruiters, switch patterns.

#### 2.1.2 Rewrite About Section

Structure exactly:

```
[Opening — 2-3 sentences]
Who you are and what you do. State the one offer clearly.

[Problem — 1-2 sentences]
The specific problem your buyer has. Make it hurt.

[Proof — 2-4 bullet points]
Specific projects with outcomes. Numbers if possible.

[CTA — 1 sentence]
What they should do next. Link to Calendly or website.
```

Example:

```
I build custom AI-powered platforms — strategy, architecture, and delivery, end to end. One person who thinks like a CTO, designs like an architect, and ships like a developer.

You have a product idea but no technical co-founder. Agencies over-promise and under-deliver. Freelancers build the wrong thing.

Recent platforms I've built:
• AI persona clone with voice, RAG, and dual knowledge ingestion (Gemini 1.5 Pro + Qdrant)
• Multi-service platform with API gateway, WebSockets, 4 databases, and S3 storage (Kong + Redis + Cassandra + PostgreSQL)
• Digital card system with rendering engine, batch processing, and template designer

Let's talk about your product → [Calendly link]
```

#### 2.1.3 Select Featured Items

Pin exactly 3:
1. Best case study or article (proves you deliver)
2. Best GitHub repo or portfolio project (proves you ship)
3. Website or Calendly link (conversion point)

Remove any Featured item that does not reinforce the one offer.

#### 2.1.4 Update Profile Banner

- Dimensions: 1584 × 396 pixels
- Text overlay: your one offer headline
- Tool: Canva (free LinkedIn banner template)
- Avoid: generic tech patterns, stock photos, default banner
- Keep: consistent with website color palette

#### 2.1.5 Activity Section

Ensure:
- 3 most recent posts are on-topic (no random shares, no personal off-topic posts)
- Recent comments add real insight (not "great post!" — say something substantive)
- Profile visitors see consistent expertise on first scroll

### 2.2 Website Overhaul

#### 2.2.1 Homepage Rewrite

Replace the generic headline and service-box grid with:

```
Headline: I build AI-powered platforms.
Subheadline: One person, end to end. Strategy, architecture, and delivery — so you don't need to hire a CTO, an architect, and a dev team just to ship one product.
Value prop: Fixed price, milestone-gated. 36 years of engineering judgment + modern AI tooling.

What I build:
Custom AI platforms. Data dashboards. Full-stack web apps. Built to scale, deployed to production, handed over cleanly.

Case studies (linked from homepage):
• AI persona clone with voice, RAG, and dual knowledge ingestion
• Multi-service platform with API gateway, WebSockets, 4 databases, S3 storage
• Self-hosted teleprompter with PWA, QR handoff, real-time relay
• Digital card system with rendering engine, batch processing, template designer

Who I work with:
Non-technical founders and CEOs who need their product built.

Let's talk → [Calendly link]
```

#### 2.2.2 Website Audit Checklist (Post-Overhaul)

1. **Headline** — one offer, no service list
2. **Service boxes** — replaced with "What I build" + case study links
3. **Case studies** — actual portfolio items with outcomes
4. **Calendly** — prominent placement (hero, nav, or footer)
5. **Analytics** — installed and verifying with a test visit
6. **SEO schema** — JSON-LD for Person or Organization with name, description, sameAs (LinkedIn, GitHub)
7. **Who section** — explicit statement of who you work with

#### 2.2.3 Remove or Deprecate

- ❌ Generic service pages (SEO, Hosting, ERP, Infrastructure) — remove or 301-redirect
- ❌ Pricing page — every engagement is different. Use Calendly + proposals.
- ❌ "We do everything" language
- ❌ Leading with years of experience — lead with what you can do for the buyer

### 2.3 Brand Consistency

After LinkedIn and website are rewritten, verify:

| Asset | Must Match |
|-------|-----------|
| LinkedIn headline | Website headline (same core offer) |
| LinkedIn banner | Website hero background or color palette |
| About section tone | Website homepage tone |
| Featured items | Case studies on website |
| Calendly link | Same link on both platforms |
| Avatar/logo | Same or visually consistent |
| Color palette | Hex codes identical across platforms |

---

## 3. Status Mode — `biz-brand status`

Read-only. Reports the current state of all brand components.

Output template:

```
Brand Status — 2026-06-21

LinkedIn Profile:
  Headline:        [current headline]
  About:           [first 80 chars...]
  Featured items:  [3 items]
  Banner:          [has text? yes/no]
  Last overhaul:   [date or never]

Website:
  URL:             [url]
  Homepage head:   [current headline]
  Calendly:        [visible? yes/no]
  Analytics:       [installed? yes/no]
  Case studies:    [count]

Brand Assets:
  Logo variant:    [filename or none]
  Color palette:   [filename or none]
  Typography:      [font name or none]

Last audit: [date or never]
Last overhaul: [date or never]
```

---

## 4. 5-Second Test

After any overhaul, the profile/website passes only if a stranger knows within 5 seconds:

1. **What you do** (not a list of what you know)
2. **Who you help** (specific buyer, not "everyone")
3. **What to do next** (CTA is visible)

How to test:
- Show your profile/website to someone who has never seen it
- Count to 5
- Ask: "What do I do? Who do I help? What's the next step?"
- If they can't answer all three → rewrite

---

## 5. Failure Modes

| Failure | Likely Cause | Fix |
|---------|-------------|-----|
| After overhaul, still getting recruiter messages | Headline not specific enough | Show to a non-technical friend. If they don't understand, rewrite. |
| Profile views from wrong people | Headline attracts wrong audience | Switch headline pattern (A→B→C→D) |
| No inbound from target buyers | About section is generic | Rewrite starting with exact buyer problem |
| Website visitors don't book Calendly | Calendly not prominent or CTA weak | Move Calendly above the fold. Make CTA specific ("Book a 15-min call"). |
| Activity section contradicts profile | Recent posts/comments are off-topic | Remove or archive off-topic posts. Write 3 on-topic posts before overhauling. |
| No change after 2 weeks | Network doesn't know you changed | Send 10 warm messages to drive traffic to new profile |

---

## 6. Time Budget

| Step | Time |
|------|------|
| LinkedIn audit | 15 min |
| Website audit | 15 min |
| Brand asset audit | 10 min |
| Rewrite LinkedIn headline | 15 min |
| Rewrite LinkedIn About section | 30-45 min |
| Select + pin Featured items | 15 min |
| Update LinkedIn banner | 30 min |
| Rewrite website homepage | 2 hr |
| Replace service pages with case studies | 2 hr |
| Add/verify Calendly + analytics + schema | 30 min |
| Brand consistency pass | 30 min |
| Review & publish | 15 min |
| **Total overhaul** | **~6-8 hours** |

---

## 7. Success Criteria

The overhaul is complete when:

- A stranger knows within 5 seconds: what you do, who you help, and what to do next
- LinkedIn headline contains zero skill-lists
- LinkedIn Featured section shows 3 items that all reinforce the same offer
- LinkedIn banner text matches the offer
- LinkedIn recent 3 posts are on-topic
- Website homepage states one offer (no service grid)
- Website has visible case studies linked from homepage
- Website has Calendly link prominently placed
- Website analytics is installed and tracking
- Brand assets (colors, typography, tone) are consistent across LinkedIn and website

---

## 8. Files Referenced

- `.work/plans/strategy_outreach_scripts.md` §1 (headline + about templates)
- `.work/plans/strategy_website_positioning.md` (website positioning brief)
- `.work/plans/strategy_niche_decision.md` (unified offer language)
- `.work/reference/PROJECTS.md` (project descriptions for proof points)
- `.work/reference/VISUAL_GUIDE.md` (banner specs, color palette, typography)
- `.ai.promote/skills/linkedin-overhaul.md` (LinkedIn overhaul process)
- `.ai.promote/skills/content-publish.md` (posts for activity section)

---

## 9. Mode Routing (for agent implementation)

```
On "biz-brand audit":
  → Run section 1 (Audit Mode)
  → Output pass/fail table + summary
  → Do not modify anything

On "biz-brand overhaul":
  → Run section 2 (Overhaul Mode)
  → Modify LinkedIn profile (via collaborator or manual instructions)
  → Modify website files (via collaborator or manual instructions)
  → Verify consistency
  → Run 5-second test

On "biz-brand status":
  → Run section 3 (Status Mode)
  → Output current state report
  → Do not modify anything
```
