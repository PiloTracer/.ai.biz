---
name: biz-content
description: >-
  Write and publish content that demonstrates expertise and attracts inbound
  leads. Supports LinkedIn posts, articles, 30-day challenges, and repurposing.
  biz-content publish, biz-content plan, biz-content challenge, biz-content status.
---

# Skill: biz-content

## Purpose
Write and publish one piece of content (LinkedIn post or article) that demonstrates your expertise and attracts inbound leads. No pitching. No "DM me."

> **Platform scope:** This skill covers LinkedIn publishing ops (tracker, calendar, engagement cadence, A/B hook testing, consistency challenges). For generating content calibrated to other platforms (Reddit, Instagram, Facebook), use `@content-social`. For pure writing craft (blog articles, case studies, landing pages, email sequences), use `@content-writing`. For drafts, invoke `@content-social write linkedin` or `write linkedin carousel` after planning.

## Parse invocation

| User says | Mode |
|-----------|------|
| `@biz-content publish` | Run the publish workflow (topic → draft → review → post → engage) |
| `@biz-content plan` | Seasonal calendar + batch scheduling |
| `@biz-content challenge` | 30-day LinkedIn consistency plan (default) |
| `@biz-content challenge - createimpact` | Same plan framed for LinkedIn #CreateImpact |
| `@biz-content challenge - 30d linkedin` | Explicit 30-day LinkedIn challenge |
| `@biz-content status` | Content performance tracker review |

**Default:** `publish` if no verb matches and the user wants to create/post content now.

---

## Mode: publish — Write and post one piece

### 1. Choose Topic

Pick from one of the four canonical topic buckets in `concepts/content-topic-buckets/prompt.md` (BIZ-09):

| Bucket | LinkedIn hook angle |
|--------|---------------------|
| **Architecture lesson** | A design decision, tradeoff, or mistake — with the specifics. |
| **AI in practice** | Real AI/ML experience — not hype, not theory. |
| **Experience-based insight** | Judgment that only comes from years of doing this. |
| **Project behind-the-scenes** | Specific, credible, ships — show the work with numbers. |

**Rule of thumb for hooks:** If you can replace your company name with anyone else's and the hook still works, it's too generic. Your hook should be specific enough that only YOU could have written it.

### 2. A/B/C Hook Testing
For the same story idea, draft 3 different hooks and pick the strongest:

| Style | Example |
|-------|---------|
| **Hook A: Question-based** | "What's the #1 mistake founders make when choosing a tech stack?" |
| **Hook B: Result-first** | "How I built a financial platform in 7 months — solo" |
| **Hook C: Controversy-light** | "I don't use serverless for production platforms. Here's why." |

Test across posts: track which style gets the most engagement in your content tracker. After 8 posts, double down on what works.

### 3. Structure the Post
- **Hook** (1 line): Makes them want to read. Specific > general.
- **Story** (3-5 lines): What happened. Specific details (tech, timeline, problem).
- **Lesson** (1-2 lines): What you learned or what matters.
- **No pitch.** No CTA. Just value.

**Visual specs (if adding an image):**
- LinkedIn post image: 1200×628px, PNG or JPG, <5MB
- Carousel: 4-8 slides, 1080×1080px per slide, left-aligned text
- Use brand colors, no stock photos

### 4. Write First Draft
- Write like you talk. No jargon where plain English works.
- Use line breaks. Walls of text don't get read.
- Keep it under 300 words for posts, 1500 for articles.

### 5. Review Against Rules
- Does it demonstrate expertise? ✅
- Does it include specific details? ✅
- Is there zero pitching? ✅
- Would you want to hire the person who wrote this? ✅

### 6. Publish + Engage
- Post it
- Within 30 min of posting, comment on 5-10 relevant posts from your target audience
- Reply to every comment on your post within 24 hours

### 7. Repurpose (Get 4 Assets From 1 Effort)

After publishing, repurpose the same content into different formats:

| Format | When | Where |
|--------|------|-------|
| Original LinkedIn post | Day 1 | LinkedIn |
| Expanded LinkedIn article (1500 words) | Day 3 | LinkedIn Articles |
| Short Loom/video (3 min, same story) | Day 5 | LinkedIn video post |
| PDF version (case study or guide) | Day 7 | Website lead magnet |

**Why repurpose:** Each format reaches a different audience segment. The video watchers may not read the post. The article readers want depth. One core insight = 4 assets.

## Mode: plan — Content Calendar

### Seasonal Content Calendar (Q1-Q4)

| Quarter | Theme | Focus |
|---------|-------|-------|
| **Q1 (Jan-Mar)** | "New year, new platform" | Planning, architecture foundations, choosing the right stack |
| **Q2 (Apr-Jun)** | "Building in public" | Behind-the-scenes of current projects, lessons learned mid-build |
| **Q3 (Jul-Sep)** | "Deep dives" | Technical architecture deep-dives, AI integration patterns, scaling lessons |
| **Q4 (Oct-Dec)** | "Reflections" | Yearly lessons, what you'd do differently, planning for next year |

Align your posts to the current quarter's theme. It makes your content feel timely and deliberate.

### Batch Scheduling
Block 2-3 hours to write 4 posts at once. Follow the 45-60 min per post time budget, but save setup/context-switching time by doing all topic selection and hook drafting in one pass.

## Mode: challenge — 30-day LinkedIn consistency

Time-boxed posting program for **share expertise, grow impact, post consistently**. Use for LinkedIn official programs (e.g. #CreateImpact) or any 30-day cadence.

### Before you start

1. **`@biz-brand audit`** — profile communicates one expertise area in 5 seconds
2. **LinkedIn ICP** — if `.work.biz/strategy/linkedin-icp.md` is missing, run BIZ-08 (`concepts/linkedin-icp/prompt.md`) first
3. Read `standards/*PLATFORM-ALGORITHM-STANDARD*` — binding link and format rules

### Format mix (non-negotiable)

| Format | Frequency | Why |
|--------|-----------|-----|
| **Text post** | 2–3× / week | Stories, lessons, hot takes |
| **Carousel (document)** | ≥1× / week | Highest organic reach on LinkedIn (3–5× text) |
| **Video** | Optional 1× / 2 weeks | Behind-the-scenes, quick tips |

Draft carousels with `@content-social write linkedin carousel - <topic>`. Draft text with `@content-social write linkedin - <topic>`.

### 30-day plan table

Output this table. Rotate topic buckets; no same bucket 3 days in a row.

| Day | Format | Topic bucket | Hook seed | Challenge tag | Draft command |
|-----|--------|--------------|-----------|---------------|---------------|
| 1 | text | Architecture lesson | Opening expertise statement | #CreateImpact if createimpact mode | `@content-social write linkedin - …` |
| 2 | — | — | Rest / engage only | — | Comment on 5 ICP posts |
| … | … | … | … | … | … |

**Cadence:** 3 posts per week (e.g. Tue / Thu / Sat or Mon / Wed / Fri). Non-post days = comment engagement on target buyer posts (10 min).

**#CreateImpact mode:** Add `#CreateImpact` on **one post per week** (days 1, 8, 15, 22, 29). Do not tag every post.

### Posting ritual (every publish day)

1. Post body — **no external links**
2. First comment within 60 seconds — links if needed
3. First 60 minutes — reply to every comment; comment on 5–10 ICP posts
4. Log in tracker (`status` mode): format, hook style, impressions at 48h

### Weekly review (end of weeks 1–4)

| Question | Action if no |
|----------|--------------|
| Carousel outperformed text? | Increase carousel ratio next week |
| Comments from target titles? | Revisit `linkedin-icp.md` hooks |
| <200 impressions after 6 posts? | Change hook style or posting time (see Failure Mode below) |

### Challenge completion

After 30 days: run `@biz-content status`, identify best hook × format combo, continue at 2–4 posts/week using `@biz-content plan`.

## Mode: status — Content Performance Tracking

### Content Tracker Template

| Post | Topic Bucket | Format | Hook Style | Impressions | Engagement | Inbounds | Notes |
|------|-------------|--------|------------|-------------|------------|----------|-------|
| | | text / carousel / video | A/B/C | | | | |

After 8 posts, look for patterns:
- Which hook style gets the most engagement? → Use that more.
- Which topic bucket gets the most inbounds? → Double down.
- What got zero engagement? → Stop doing that topic.

### Content Benchmarks
- B2B LinkedIn posts average **1,688–1,877 impressions** per post (Oktopost, 9,346 posts analyzed)
- Individual profiles typically get less reach than company pages
- **500+ impressions** is a fair starting threshold

## Time Budget

| Step | Time | Notes |
|------|------|-------|
| Choose topic | 5 min | Pick from the 4 buckets |
| Write hook | 5 min | Must be specific enough that only you could write it |
| Write body | 15-20 min | Keep under 300 words |
| Review against rules | 5 min | Checklist above |
| Publish + engage | 15 min | Post + 5-10 comments on others' posts |
| **Total per post** | **45-60 min** | Can batch 4 posts in 2-3 hours |

## Success Criteria

A post is successful when:
- It passes the "would I hire the person who wrote this?" test
- It has **zero pitching**, zero "DM me", zero self-promotion
- It contains at least one specific detail that only someone with real experience would know
- **500+ impressions** within 48 hours with comments that are not from bots

## Failure Mode: "I posted and got zero engagement"

This is normal for the first 3-5 posts. LinkedIn's algorithm needs to learn who your audience is.

If after 6 posts you're still getting <200 impressions:

1. **Change your hook style** — if you used questions, try controversy-light. If you used results, try questions.
2. **Change your posting time** — try 7-8am or 12-1pm in your target timezone (US Eastern)
3. **Engage more** — LinkedIn amplifies people who give engagement. Spend 10 min/day commenting on others' posts before publishing your own
4. **Check your network size** — <500 connections limits your reach. Add 10 relevant connections/week
5. **Consider the content itself** — are you sharing a lesson or stating an opinion? Opinion + evidence outperforms pure lessons

If you reach 10 posts with consistent <200 impressions despite trying all of the above, the channel may not work for your niche. Test on a different platform — if you get the same result, the problem is the offer, not the channel.
