---
name: biz-youtube
description: >-
  YouTube publishing ops: script, thumbnail, upload, analytics, cadence, and
  consistency challenge. Modes: publish, plan, challenge, status.
  biz-youtube publish, biz-youtube plan, biz-youtube challenge, biz-youtube status.
---

# Skill: biz-youtube

## Purpose

Produce and publish YouTube videos (long-form and Shorts) that demonstrate
expertise and attract inbound leads. Covers scripting, thumbnails, upload
checklist, analytics review, and realistic cadence planning.

YouTube reaches **2.5–2.7 billion monthly active users** and processes
**500M+ daily searches**, making it the world's second-largest search engine
([GlobalMediaInsight 2026](https://www.globalmediainsight.com/blog/youtube-users-statistics/),
[Digital Applied 2026](https://www.digitalapplied.com/blog/video-marketing-statistics-2026-data-points)).
For B2B founders and experts, it is a high-trust channel:
**68% of B2B buyers watch long-form video before purchasing**
([Digital Applied 2026](https://www.digitalapplied.com/blog/video-marketing-statistics-2026-data-points)).

> **Platform scope:** This skill covers YouTube publishing operations (tracker,
> calendar, production-capacity gating, retention/CTR diagnosis, and 30-day
> challenges). For script drafting, invoke `@content-social write youtube`. For
> platform/channel strategy, use `@biz-strategy`. For brand-voice checks, use
> `@biz-brand`.

---

## Parse invocation

| User says | Mode |
|-----------|------|
| `@biz-youtube publish` | Run the publish workflow (topic → script → thumbnail → upload → engage) |
| `@biz-youtube plan` | Build a 30/60/90-day calendar mixing long-form and Shorts |
| `@biz-youtube challenge` | 30-day upload challenge with daily/weekly targets and tracker |
| `@biz-youtube status` | Read the YouTube/content tracker and diagnose bottlenecks |

**Default:** `publish` if no verb matches and the user wants to create/post a
video now.

---

## Production capacity check

Run this check before setting a cadence. It gates unrealistic plans, not
starting.

| Question | Your answer | Cadence impact |
|----------|-------------|----------------|
| **Time per week for video work** | <2h / 2–5h / 5–10h / 10h+ | Determines max output |
| **Editing help** | None / templates / outsourced / dedicated editor | Determines polish and turnaround |
| **Camera comfort** | Reluctant / okay / confident | Determines face-to-camera ratio and retakes |
| **Budget for tools/outsourcing** | $0 / ~$50/mo / ~$200/mo / $500+/mo | Determines thumbnails, B-roll, editing support |

**Recommended cadence by capacity:**

| Capacity | Long-form | Shorts | Notes |
|----------|-----------|--------|-------|
| **Low** (<2h/week, no help) | 1×/month | 1×/week | Keep videos simple; batch shorts on one block |
| **Medium** (2–5h/week) | 1×/2 weeks | 2×/week | One deep video + repurposed shorts |
| **High** (5–10h/week) | 1×/week | 3×/week | Room for series/playlist experiments |
| **Pro** (10h+/week + editor) | 1–2×/week | 5×/week | Can run multiple series simultaneously |

AI-assisted editing, captioning, and thumbnail tools have reduced video
production costs by roughly **40%**
([Digital Applied 2026](https://www.digitalapplied.com/blog/video-marketing-statistics-2026-data-points)),
but time and on-camera consistency remain the binding constraints. Pick a cadence you can sustain for 90 days.

---

## Mode: publish — End-to-end video workflow

### 1. Choose topic

Pick from one of the four canonical topic buckets in `concepts/content-topic-buckets/prompt.md` (BIZ-09):

| Bucket | YouTube title / hook angle |
|--------|----------------------------|
| **Architecture lesson** | A design decision, tradeoff, or mistake — with the specifics. |
| **AI in practice** | Real AI/ML experience — not hype, not theory. |
| **Experience-based insight** | Judgment that only comes from years of doing this. |
| **Project behind-the-scenes** | Specific, credible, ships — show the work with numbers. |

**Title rule:** If another expert could swap their name into the title and it
still works, it's too generic. Make the angle specific to you.

### 2. Run the production capacity check

Use the check above. If capacity is low, publish this idea as a **Short** or
split a long-form idea into a mini-series rather than one 20-minute video.

### 3. Script the video

Invoke `@content-social write youtube - <title/angle>`.

For long-form, request:
- **Hook** (first 30 seconds): problem + promise + credibility
- **3–5 sections**, each with one clear takeaway
- **Pattern interrupts** at 4, 9, and 18 minutes where retention typically dips
- **End CTA**: one action (subscribe, comment, watch next)

**Length guidance:**
- Long-form sweet spot: **8–15 minutes**. Beyond 18 minutes, retention pressure
  rises sharply; plan extra value or break into parts.
- Shorts: **30–60 seconds**, one idea, strong first 1–3 seconds.

### 4. Thumbnail concept

| Element | Rule |
|---------|------|
| **Face** | Close-up, expressive, high contrast; readable at 154×86px |
| **Text** | 1–4 words max; large bold font; brand color accent |
| **Background** | Simple, not busy; one focal object or visual metaphor |
| **Curiosity gap** | Show the problem, not the full answer |

Generate 2–3 thumbnail concepts and pick the one that stands out in the
subscription feed.

### 5. Upload checklist

- [ ] Title: front-load keyword, under 60 characters, includes curiosity
- [ ] Description: first 2 lines with hook + keyword, then timestamps, links, CTA
- [ ] Tags: 3–5 focused tags (broader SEO value is low, but helps clustering)
- [ ] Thumbnail uploaded at 1280×720px, <2MB
- [ ] End screen + info cards to related video/playlist
- [ ] Pinned comment with question or resource link
- [ ] Subtitles/captions added (algorithm and accessibility boost)
- [ ] Playlist assigned
- [ ] Premiere or scheduled publish time set

### 6. Engage in the first 60 minutes

- Reply to every comment in the first hour
- Pin one question to spark discussion
- Share in relevant communities/email list if applicable
- Note performance checkpoints: 1h, 24h, 48h, 7 days

### 7. Repurpose

Turn one long-form video into:

| Asset | Timeline | Channel |
|-------|----------|---------|
| 2–5 Shorts | Same week | YouTube Shorts |
| LinkedIn/X post | Day of publish | Social feed |
| Newsletter section | Week of publish | Email |
| Blog/landing page | Following week | Website |

---

## Mode: plan — 30/60/90-day calendar

### Long-form vs Shorts cadence

| Format | Role | Ideal cadence | Notes |
|--------|------|---------------|-------|
| **Long-form** | Trust, authority, search, subscriptions | 1×/week (or 1×/2 weeks if capacity-limited) | 8–15 min sweet spot; plan pattern interrupts at 4/9/18 min |
| **Shorts** | Discovery, algorithm fuel, topic testing | 2–5×/week | 30–60s; use as teasers, standalone tips, or clips from long-form |

A sustainable split for most operators: **70% of production time on long-form,
30% on Shorts**. Shorts should feed the long-form playlist, not compete with it.

### Series / playlist planning

Plan 3–5 video series rather than one-off videos. Series train the algorithm
and the audience:

1. **Foundations series** — core concepts your buyer must understand
2. **Build series** — behind-the-scenes of a current project
3. **Mistakes series** — common errors and how to avoid them
4. **Tooling series** — specific tools/workflows you use
5. **Q&A series** — answers to repeated customer/audience questions

### Worked example: 30-day calendar

Assumes medium capacity: 1 long-form every 2 weeks + 2–3 Shorts/week.

| Day | Format | Topic / title | Playlist | Deliverable |
|-----|--------|---------------|----------|-------------|
| 1 | Long-form | "Why I chose Postgres over Mongo for a finance platform" | Architecture lessons | Publish + 2 Shorts cut from it |
| 2 | Short | "3 signs your database choice is wrong" | Architecture lessons | Clip upload |
| 3 | — | — | — | Engage: reply to comments |
| 4 | Short | "The $40k infra mistake (30s version)" | Architecture lessons | Upload |
| 5 | — | — | — | Research next topic |
| 6 | Short | "Ask me anything: database tradeoffs" | Q&A | Upload |
| 7 | — | — | — | Analytics check |
| 8 | Long-form | "RAG retrieval pipeline I run in production" | AI in practice | Publish |
| 9 | Short | "RAG isn't magic — here's why" | AI in practice | Clip upload |
| 10 | — | — | — | Engage |
| 11 | Short | "One prompt that improved my retrieval" | AI in practice | Upload |
| 12 | — | — | — | Thumbnail test review |
| 13 | Short | "Common RAG failure mode #1" | AI in practice | Upload |
| 14 | — | — | — | Rest / batch next scripts |
| 15 | Long-form | "Solo-built a tax platform in 7 months" | Project behind-the-scenes | Publish |
| 16 | Short | "7-month solo build: stack reveal" | Project behind-the-scenes | Clip upload |
| 17 | — | — | — | Engage |
| 18 | Short | "The hardest bug I fixed this year" | Project behind-the-scenes | Upload |
| 19 | — | — | — | Community comment round |
| 20 | Short | "What I'd do differently on the tax platform" | Project behind-the-scenes | Upload |
| 21 | — | — | — | Analytics check |
| 22 | Long-form | "4 hype cycles later: what tech survives" | Experience-based insight | Publish |
| 23 | Short | "The hype cycle most founders fall for" | Experience-based insight | Clip upload |
| 24 | — | — | — | Engage |
| 25 | Short | "One scalable pattern from each hype cycle" | Experience-based insight | Upload |
| 26 | — | — | — | Plan next 30 days |
| 27 | Short | "The #1 scalability mistake junior engineers make" | Experience-based insight | Upload |
| 28 | — | — | — | Rest |
| 29 | Short | "Recap: biggest lesson from 30 days" | — | Upload |
| 30 | — | — | — | Run `@biz-youtube status` |

Save the active calendar to `.work.biz/plans/youtube-calendar.md` and the running tracker to `.work.biz/pipeline/youtube-tracker.md`.

---

## Mode: challenge — 30-day upload challenge

Time-boxed program to **publish consistently, learn the algorithm, and build
a reusable production rhythm**. Modeled on `@biz-content challenge`, but
video-native.

### Before you start

1. Run the **production capacity check** above.
2. Optional but recommended:
   - `@biz-brand audit` — profile/channel banner communicates one expertise area
     in 5 seconds
   - `@biz-strategy` — confirm YouTube fits the target buyer and channel plan
3. Create the tracker file (see template below) at
   `.work.biz/pipeline/youtube-tracker.md`.

### Format mix (non-negotiable)

| Format | Frequency | Why |
|--------|-----------|-----|
| **Long-form** | 2–4× over 30 days | Builds authority and subscriber conversion |
| **Shorts** | 8–12× over 30 days | Discovery, algorithm fuel, low-friction testing |
| **Engagement** | Daily | Reply to every comment; comment on 3–5 peer videos |

### Daily/weekly targets

| Week | Long-form | Shorts | Engagement target |
|------|-----------|--------|-------------------|
| 1 | 1 | 2–3 | Reply to every comment within 1h |
| 2 | 1 | 2–3 | Add pinned question to each video |
| 3 | 1 | 2–3 | Test 2 thumbnail variants on one video |
| 4 | 0–1 | 2–3 | Run `@biz-youtube status` and plan next 30 days |

### Weekly review (end of weeks 1–4)

| Question | Action if no |
|----------|--------------|
| Any video hit **>6% CTR**? | Study its title/thumbnail/topic; repeat the pattern |
| Long-form **AVD retention >35%**? | Tighten hooks and cut slower sections |
| Shorts getting **>50% of long-form views**? | Increase Shorts ratio and use them as teasers |
| Comments from target buyers? | Revisit topic buckets and `@biz-strategy` hooks |
| Production time per video decreasing? | Document your workflow; AI tooling can cut costs ~40% ([Digital Applied 2026](https://www.digitalapplied.com/blog/video-marketing-statistics-2026-data-points)) |

### Challenge completion

After 30 days: run `@biz-youtube status`, identify the best title × thumbnail ×
format combo, then continue at a sustainable cadence using `@biz-youtube plan`.

---

## Mode: status — Read the tracker and diagnose bottlenecks

### YouTube analytics literacy

| Metric | What it means | Benchmark | Action |
|--------|---------------|-----------|--------|
| **CTR (click-through rate)** | % of impressions that become views | **<3%** problem, **3–6%** average, **6–12%** good (typical for small channels), **>12%** excellent. Shorts: 8–15%. | Low → rewrite title, redesign thumbnail, test curiosity gap |
| **AVD (average view duration)** | Average minutes/seconds watched | Depends on length; **40–50% retention** is strong | Low → tighten first 30s, cut fluff, add pattern interrupts |
| **Retention %** | % of video the average viewer watches | Check 30s, 50%, and end; dips common at **4/9/18 min** | Dips → insert B-roll, zoom, or chapter break at those points |
| **Impressions** | How often YouTube showed the video | Absolute matters less than CTR + AVD | High impressions + low CTR = title/thumbnail problem |
| **Subscriber conversion** | Subscribers gained per 1,000 views | ~0.5–2% typical for niche channels | Low → stronger niche statement, clearer CTA, better end screen |
| **Likes / comments / shares** | Engagement signals | Rising trend matters more than absolute | Low → ask one specific question; reply fast to boost signal |

### Content tracker template

Save this as `.work.biz/pipeline/youtube-tracker.md` (same location as the challenge tracker):

| Video | Format | Topic bucket | Publish date | Thumbnail variant | CTR | AVD | Retention % | Impressions | Subs from video | Likes / Comments / Shares | Notes |
|-------|--------|--------------|--------------|-------------------|-----|-----|-------------|-------------|-----------------|---------------------------|-------|
| | long / short | | | | | | | | | | |

Log each video at 24h, 48h, 7 days, and 30 days. After 8–10 videos, look for
patterns:

- Which title/thumbnail combo has the highest CTR? → Double down on that style.
- Which topic bucket drives the most subscriber conversions? → Make a series.
- Which videos have high CTR but low AVD? → Title/thumbnail overpromises; align
  hook with content.
- Which videos have low CTR but high AVD? → Good content hidden behind weak
  packaging; test new thumbnails.

### Bottleneck diagnosis

| Symptom | Most likely cause | Fix |
|---------|-------------------|-----|
| High impressions, low CTR | Weak title/thumbnail | Rewrite title, redesign thumbnail, add curiosity gap |
| High CTR, low AVD | Hook overpromises or intro drags | Cut first 30s, start with the result, remove setup |
| Low impressions, decent CTR | Topic demand or SEO is weak | Research search volume, use stronger keywords/tags |
| Good views, low subs | Niche/value proposition unclear | State channel promise in first 10s; stronger subscribe CTA |
| Good AVD, low comments | No invitation to engage | Ask one concrete question; pin first comment |

---

## Gate rules

- **No hard gate for write/research.** You can draft a YouTube script or topic
  list anytime with `@content-social write youtube`.
- **`plan` and `challenge` benefit from strategy-ready and brand-ready state.**
  Best results come from having `.work.biz/strategy/target-buyer-profile.md`,
  a channel plan, and a `@biz-brand audit`. If those are missing, still
  proceed but flag assumptions.
- **Production capacity gates cadence, not starting.** If capacity is low, start
  with Shorts or a monthly long-form cadence rather than skip the channel.

---

## Time budget

### Long-form video

| Step | Time | Notes |
|------|------|-------|
| Topic + script | 60–90 min | Use `@content-social write youtube` |
| Record | 60–120 min | Includes retakes; teleprompter reduces this |
| Edit | 120–240 min | Captions, B-roll, graphics, sound |
| Thumbnail | 30–45 min | Design 2–3 concepts, pick strongest |
| Upload + SEO | 30 min | Title, description, tags, cards, end screen |
| Engage | 30 min | First-hour replies + pinned comment |
| **Total per long-form** | **5.5–9.5 hrs** | Batch scripting/recording to save setup time |

### Short

| Step | Time | Notes |
|------|------|-------|
| Idea + script | 10–15 min | One clear takeaway |
| Record | 15–30 min | Phone + good light is enough |
| Edit + captions | 15–30 min | Use AI caption templates |
| Thumbnail | 5–10 min | Frame grab + big text |
| Upload | 10 min | Title, hashtags, pinned comment |
| Engage | 10 min | Reply in first hour |
| **Total per short** | **1–2 hrs** | Batch 5–10 shorts in one session |

---

## Success criteria

A YouTube video is successful when:

- It passes the "would I hire the person who made this?" test
- It contains at least one specific detail only real experience provides
- The title/thumbnail promise matches the first 30 seconds
- It earns **>3% CTR** and **>35% average view duration** within 7 days
- It drives at least one inbound question, comment, or subscriber who fits the
  target buyer profile

---

## Failure mode: "I uploaded and got zero views"

This is normal for the first 5–10 videos while the algorithm learns who you
serve.

If after 10 videos you still see:

- **CTR <3%** → redesign every thumbnail and rewrite titles around a curiosity
  gap
- **AVD <25%** → cut the first 60 seconds, start with the result, remove
  preamble
- **Impressions <100/video** → check topic demand, SEO keywords, and whether
  the niche is too broad
- **Views but no subs** → clarify the channel promise in the first 10 seconds
  and repeat the subscribe CTA

If you reach 20 videos with consistent low CTR and low AVD despite testing,
YouTube may not fit your niche or your offer positioning needs revision. Run
`@biz-strategy` before producing more.
