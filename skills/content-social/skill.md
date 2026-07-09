---
name: content-social
description: >-
  Platform-specialized social media content generation across Reddit, Instagram,
  LinkedIn, Facebook, X (Twitter), and YouTube (long-form + Shorts). Produces
  content calibrated to each platform's unique audience, culture, formatting
  norms, and engagement mechanics — always grounded in the host project's
  strategy, brand voice, and target buyer. For community discovery (finding
  subreddits, Instagram accounts, Facebook groups), use @biz-community find. For
  pure writing craft and long-form content (blog articles, case studies, landing
  pages, email sequences), use @content-writing.
  content-social write, content-social research, content-social repurpose,
  content-social strategy, content-social plan, content-social icp,
  content-social status.
  LinkedIn: write linkedin, write linkedin carousel, write linkedin video.
  YouTube: write youtube, write youtube shorts.
---

# content-social

**Canonical path:** `.ai.biz/skills/content-social/skill.md`

**Platform guides:** `skills/content-social/platforms/{reddit,instagram,linkedin,facebook,x,youtube}.md` — loaded on demand for the requested platform.

Generate platform-native social media content. Every platform has a different culture, audience expectation, and consumption pattern. A LinkedIn post pasted into a Reddit subreddit will be deleted — or worse, mocked. A Facebook group post formatted like an Instagram caption will be ignored. This skill produces content that belongs on each platform.

**Core principle:** Every piece of content must deliver genuine value to the specific audience on that platform. No cross-posting identical content. No generic marketing language dressed up as a platform post.

**Jump to section:** [Parse invocation](#parse-invocation) · [I0 Project context](#i0--project-context-contract-run-before-writing-anything) · [Platform matrix](#platform-culture--audience-matrix) · [Universal format](#universal-platform-format) · [R1 Reddit](#r1--reddit-content) · [R2 Instagram](#r2--instagram-content) · [R3 LinkedIn](#r3--linkedin-content) · [R3V LinkedIn Video](#r3v--linkedin-native-video) · [R4 Facebook](#r4--facebook-content) · [R5 X](#r5--x-twitter-content) · [R6 YouTube](#r6--youtube-content) · [I2 Research](#i2--research-mode) · [I3 Repurpose](#i3--repurpose-mode) · [I4 Strategy](#i4--strategy-mode) · [I5 Plan](#i5--plan-mode) · [ICP mode](#linkedin-icp-mode)

---

## Parse invocation

| User says | Mode |
|-----------|------|
| `@content-social write reddit - <topic>` | Generate a Reddit post (self-post, comment, AMA thread) |
| `@content-social write instagram - <topic>` | Generate Instagram content (caption + visual brief, carousel script, story) |
| `@content-social write linkedin - <topic>` | Generate a LinkedIn text post calibrated to professional audience |
| `@content-social write linkedin carousel - <topic>` | Generate a LinkedIn document/carousel (slide copy + caption + first comment) |
| `@content-social write linkedin video - <topic>` | Generate a complete LinkedIn native video package (script, shot list, captions, post copy, posting ritual) |
| `@content-social write facebook - <topic>` | Generate Facebook content (group post, page update, community post) |
| `@content-social write x - <topic>` | Generate an X (Twitter) post (tweet, thread, reply) calibrated to real-time, concise format |
| `@content-social write youtube - <topic>` | Generate a YouTube long-form script (8–15 min educational video) |
| `@content-social write youtube shorts - <topic>` | Generate a YouTube Shorts script (15–60 sec, up to 3 min when justified) |
| `@content-social research reddit - <topic/keyword>` | Find trending discussions, active threads, and content gaps on Reddit |
| `@content-social research instagram - <topic/keyword>` | Find trending formats, audio, hashtags, and competitor content on Instagram |
| `@content-social research linkedin - <topic/keyword>` | Find active conversations, trending posts, and content white space on LinkedIn |
| `@content-social research facebook - <topic/keyword>` | Find active group discussions, trending topics, and content opportunities on Facebook |
| `@content-social research x - <topic/keyword>` | Find trending topics, active conversations, hashtag movements, and content gaps on X/Twitter |
| `@content-social research youtube - <topic/keyword>` | Find trending topics, title gaps, thumbnail gaps, and competitor content on YouTube |
| `@content-social research <platform>` | General topic/trend research for a platform (without a specific keyword) |
| `@content-social repurpose - <source> to <platform>` | Adapt existing content for a different platform |
| `@content-social repurpose - <source>` | Repurpose one piece into formats for all 7 platforms |
| `@content-social strategy` | Assess which platforms fit the project's target buyer; recommend platform mix |
| `@content-social icp` | Run BIZ-08 LinkedIn ICP analysis and save to `.work.biz/strategy/linkedin-icp.md` |
| `@content-social plan <platform> - <horizon>` | Platform-specific content calendar (e.g., `30 days`, `Q3`) |
| `@content-social status` | Read-only: report loaded project context and platform readiness |

**Default:** `write` if no verb matches. If the user gives a free-text request like "write me a reddit post about X" with no verb, treat it as `write reddit - <their words>`.

---

## I0 — Project Context Contract (run before writing anything)

Load context in priority order. Stop when you have enough. Platform calibration is only as good as the audience profile it's built on.

### Priority 1 — Host project strategy (Business OS)

Read, if they exist:

| File | What it gives you |
|------|-------------------|
| `.work.biz/strategy/target-buyer-profile.md` | Who consumes this content, their fears, values, vocabulary |
| `.work.biz/strategy/linkedin-icp.md` | How the buyer shows up on LinkedIn — titles, hook language, format preference |
| `.work.biz/strategy/one-pager.md` | Niche, unified offer, price range, geography |
| `.work.biz/strategy/channel-plan.md` | Primary channel — determines which platforms are primary vs secondary |
| `.work.biz/context/HANDOFF.md` | Recent decisions; avoid contradicting them |

### Priority 2 — Project identity

Read `.cursorrules` — its `REPLACE:` tokens resolve to `PROJECT_NAME`, `UNIFIED_OFFER`, `TARGET_BUYER`, `PRICE_RANGE`. These anchor tone and positioning across all platforms.

### Priority 3 — Tech stack fingerprint

- `package.json`, `pyproject.toml`, `go.mod`, `Cargo.toml`, `docker-compose*.yml` → real tech to cite
- `README.md` → what the project actually does
- Any `work/`, `case-studies/`, or `docs/` folder → real proof points

### Priority 4 — Brand standard

Read `standards/*BRAND-GUIDE*`, `standards/*CONTENT-STANDARD*`, and `standards/*PLATFORM-ALGORITHM-STANDARD*` if present. These are binding.

### Priority 5 — Fallback example

If none of the above yield a usable brand/audience, load `references/project-context.example.md` (a worked example showing the expected shape and depth) and state explicitly: **"No project context found; using generic professional defaults calibrated to the example profile."** Then proceed with professional-quality defaults and the structure rules below.

### Context summary (emit briefly before drafting)

```
LOADED CONTEXT
  Project:      <name or "unnamed — generic defaults">
  Offer:        <one line or "unspecified">
  Audience:     <buyer persona or "general tech-aware readers">
  Stack:        <concrete tech or "unspecified">
  Primary channel: <from channel-plan or "unspecified">
  LinkedIn ICP:   <titles + hook vocabulary or "unspecified — using BIZ-08 defaults">
  Gaps:         <what's missing that the user should supply for better output>
```

If critical gaps exist (no audience, no offer), name them and ask **one** consolidated question only if they would materially change platform selection or content direction. Otherwise proceed with profession-quality defaults.

**LinkedIn only:** If `linkedin-icp.md` is missing but LinkedIn is the platform, note the gap and apply BIZ-08 defaults (specific hooks, carousel for save-worthy frameworks, no buzzwords). Suggest `@biz-content challenge` or running BIZ-08 after delivery if the user is building a cadence.

---

## Platform Culture & Audience Matrix

Before writing for any platform, understand who you're writing for and the cultural norms.

| Platform | Primary audience signals | Content consumption pattern | Trust mechanics | Self-promotion tolerance |
|----------|--------------------------|----------------------------|-----------------|--------------------------|
| **Reddit** | Niche communities (subreddits), topic-first, pseudonymous | Deep reading in chosen subs; browse by Hot/Top | Demonstrated expertise over time; karma history; post history | **Extremely low.** 9:1 ratio rule — 90% participation, 10% or less self-reference. Violators are banned. |
| **Instagram** | Visual-first, younger skew (18-34 dominant), discovery-driven | Rapid scroll; 1-3 second attention grab; Reels dominate reach | Aesthetic consistency; authenticity; social proof (follower count, engagement) | Moderate. Acceptable if value-first. "Link in bio" model. |
| **LinkedIn** | Professional, career-motivated, B2B decision-makers | Feed scroll; article reading; native video; industry-aware but busy | Credentials, track record, mutual connections, specificity, on-camera presence | **Higher than others.** Thought leadership is the format. Pitch tolerated after value delivery. |
| **Facebook** | Groups are hyper-engaged communities; Pages are broadcast | Groups: threaded, conversational. Pages: feed scroll. | Community membership; consistent helpful presence; local relevance | Varies wildly. Groups: low tolerance, moderator-enforced. Pages: moderate. |
| **X (Twitter)** | Real-time, news-driven, tech/VC/journalist-heavy, high velocity | Rapid-fire feed; 280-char limit shapes consumption; threads for depth | Wit, speed, insider knowledge, being first to insight. Followers/lists = credibility. | Moderate-low. Self-promotion is common but must be wrapped in value. Quote-tweet culture rewards sharp takes. |
| **YouTube** | Search-driven, education/entertainment hybrid, high intent | Long-form: intentional viewing. Shorts: rapid scroll in vertical feed. | Consistency, production value, proof of expertise, community interaction | Moderate. Pitch only after value delivery; CTAs must be earned. |

---

## Platform Audience Specialization

The same person behaves differently on each platform. Content must account for this.

### How the same target buyer shows up per platform

| Element | Reddit | Instagram | LinkedIn | Facebook | X (Twitter) | YouTube |
|---------|--------|-----------|----------|----------|-------------|---------|
| **Identity** | Pseudonymous, interest-based | Curated, visual identity | Real name, professional identity | Real name, personal + community identity | Real name or pseudonymous; persona-based | Anonymous or persona-based; intent-driven |
| **Mindset** | Learning, debating, problem-solving | Discovery, inspiration, entertainment | Career growth, industry awareness, hiring | Community belonging, local connection, peer support | Real-time awareness, breaking news, hot takes, networking | Learning, entertainment, research before purchase |
| **Attention span** | Willing to read long-form if valuable | Seconds. Visual hook or scroll past. | Moderate. Will read 200-300 words; will watch 30–90 sec video if hook earns it. | Variable. Groups: moderate. Feed: short. | Seconds per tweet. Threads earn sustained reading if hook is strong. | Long-form: 8–15 min if value is sustained. Shorts: 0–3 sec hook. |
| **Trust trigger** | Specific, verifiable claims. No marketing language. | Visual authenticity, social proof, consistency. | Deep expertise demonstrated. Specific results. Named clients. On-camera authenticity. | Peer validation. Group membership. Mutual friends. | Insider knowledge, speed, contrarian-but-correct takes, consistency over time. | Demonstrated expertise, consistent uploads, transparent proof, community engagement. |
| **Rejection trigger** | Self-promotion, vagueness, link-dropping | Overt selling, inauthentic polish, stock imagery | Thought leadership without proof. Buzzword bingo. Low-energy or over-polished video. | Spammy posts. Breaking group rules. Uninvited pitching. | Over-polished corporate voice, threadbois, engagement farming, stale takes. | Clickbait, wasted time, sales-first openings, low production value that undermines expertise. |

**Rule:** Never use a LinkedIn post as a Reddit post. Never use an Instagram caption as a Facebook group post. Each platform gets purpose-built content.

---

## Universal Platform Format

The seven platforms share a common anatomy. Start from this skeleton, then apply the platform-specific deltas in R1–R6.

### Universal post structure

```
HOOK
  — The first thing the audience sees. It must earn attention in under 3 seconds.
  — Specificity > mystery. Lead with the reader's problem, a concrete result, or a tension.
  — No clickbait, no ALL CAPS, no hollow intensifiers, no "you won't believe."

BODY
  — One idea per paragraph or segment. White space and rhythm matter.
  — Show, don't tell: replace adjectives with data, examples, names, numbers.
  — Include at least one specific proof point per post (a number, a tradeoff, a hard-won lesson).
  — Technology tilt (mandatory for tech-positioned projects): cite concrete stack, failure mode, or metric.
  — Remove marketing language: solution, platform, revolutionary, game-changing, cutting-edge, best-in-class, scalable, robust, seamless, innovative.

CTA / ENGAGEMENT PROMPT
  — One clear action, platform-appropriate. Earned, not tacked on.
  — Invite conversation, save, share, or a channel-native next step. No "DM me" where it violates culture.
```

### Universal anti-patterns (DO NOT)

- Cross-post identical content across platforms without rewriting structure, tone, and emphasis.
- Use hollow intensifiers: very, really, truly, game-changing, revolutionary, cutting-edge, robust, scalable (unquantified).
- Lead with credentials or product instead of the reader's problem.
- Drop unearned self-promotion or external links where the platform penalizes them.
- Use engagement bait ("Agree?", "Tag someone who...", "Share if you agree...", "Upvote if...").
- Post low-resolution visuals, heavy text overlays, or stock imagery that signals inauthenticity.
- Post and disappear. The first 30–120 minutes after publishing determine reach on most platforms.

### Universal posting cadence principles

- **Consistency > frequency.** A predictable rhythm outperforms sporadic bursts.
- **The first hour is critical.** Reply to comments, engage with replies, and signal algorithmic momentum early.
- **Batch creation, single-platform adaptation.** Create the core insight once; rewrite the packaging per platform.
- **Leave reactive slots open.** 20–30% of calendar slots should be reserved for trending topics, comments, and community replies.

Platform-specific posting windows and frequency live in each R-section below.

---

## I1 — `write` mode

### Step 1 — Determine platform + type

Resolve from the request:

1. **Platform** — reddit, instagram, linkedin, facebook, x, youtube (required)
2. **Content type** — depends on platform (see each platform section below)
3. **Goal** — educate, build trust, demonstrate expertise, start conversation, attract leads
4. **CTA** — what action should the reader take (if any)? Platform-appropriate CTA only.

### Step 2 — Load platform-specific rules

Load the platform guide from `skills/content-social/platforms/<platform>.md` for formatting, structure, anti-patterns, and posting cadence. The R1–R6 markers below are thin pointers; the detailed rules live in the platform files.

### Step 3 — Draft with quality rules

Apply the [Universal Platform Format](#universal-platform-format), plus the platform-specific deltas from the loaded platform guide.

Before finalizing, run an **AI-artifact scan**: check for em-dash overuse, hedging fillers, generic transitions, passive-voice defaults, empty intensifiers, and other tics listed in `standards/20260621-CONTENT-STANDARD.md` § Anti-AI-artifact rules. Rewrite any flagged sentence into plain, specific language.

### Step 4 — Deliver

Provide the complete, ready-to-post content. Below a divider, offer:

1. **Platform notes** — why this post works for this platform specifically
2. **Alternate hooks** (2 options — different angles)
3. **Posting time suggestion** — best window for this platform + audience
4. **Engagement plan** — 1-2 sentences on what to do after posting

---

## R1 — Reddit Content

Load `skills/content-social/platforms/reddit.md` and apply its platform-specific rules when writing, researching, planning, or repurposing for reddit.

---

## R2 — Instagram Content

Load `skills/content-social/platforms/instagram.md` and apply its platform-specific rules when writing, researching, planning, or repurposing for instagram.

---

## R3 — LinkedIn Content

Load `skills/content-social/platforms/linkedin.md` and apply its platform-specific rules when writing, researching, planning, or repurposing for linkedin.

---

## R3V — LinkedIn Native Video

Load `skills/content-social/platforms/linkedin-video.md` for the complete LinkedIn video mentor guide: scripting, shooting, editing, captions, first-frame optimization, analytics, and the 30-day video challenge. Apply it when invoking `@content-social write linkedin video` or when coaching the operator through LinkedIn native video production.

---

## R4 — Facebook Content

Load `skills/content-social/platforms/facebook.md` and apply its platform-specific rules when writing, researching, planning, or repurposing for facebook.

---

## R5 — X (Twitter) Content

Load `skills/content-social/platforms/x.md` and apply its platform-specific rules when writing, researching, planning, or repurposing for x.

---

## R6 — YouTube Content

Load `skills/content-social/platforms/youtube.md` and apply its platform-specific rules when writing, researching, planning, or repurposing for youtube.

---

## I2 — `research` mode

Discover trending topics, active discussions, and content gaps on a specific platform — grounded in the project's target buyer and niche. Use this mode before writing to ensure relevance, or when looking for content ideas.

### Research workflow

1. **Load project context** per I0. The target buyer profile determines which communities and topics are relevant.
2. **Identify the research target** — platform + optional keyword/topic from the user's request.
3. **Survey the landscape** using the platform-specific research methods below.
4. **Output a research brief** with actionable content opportunities.

### Research output format

```markdown
## Research Brief — {Platform} — {Topic/Keyword}

### Trending now
| Thread/Post/Trend | Why it's trending | Relevance to {PROJECT_NAME} |
|-------------------|-------------------|------------------------------|
| [description] | [context] | [high / medium / low — reason] |

### Content gaps (questions people are asking with no good answers)
| Question / Pain point | Where found | Content opportunity |
|----------------------|-------------|---------------------|
| [specific question] | [subreddit / hashtag / group / search query] | [what a good answer would cover] |

### What competitors/peers are posting
| Source | What they posted | What's missing | Our angle |
|--------|-----------------|----------------|-----------|
| [account / subreddit / group / channel] | [summary] | [gap or weakness] | [how we'd do it better] |

### Recommended content for this platform
1. **[Hook seed]** — [why it would work]
2. **[Hook seed]** — [why it would work]
3. **[Hook seed]** — [why it would work]

### Timing
- Best posting window: [day + time]
- Urgency: [evergreen / trending now — act within 48 hours / seasonal]
```


### Platform-specific research methods

For the platform being researched, load the corresponding platform guide from `skills/content-social/platforms/<platform>.md` and use the Research methods section at the end of that file.

### Research quality rules

1. **Research must be grounded in the project's target buyer.** Don't report trending topics that are irrelevant to the project's niche, even if they're popular.
2. **Label confidence.** Distinguish between: "Confirmed active discussion (linked thread with 200+ comments this week)" and "Inferred interest (topic appears in comments but no dedicated thread yet)."
3. **No fabricated data.** Do not invent specific threads, usernames, or engagement numbers. Describe patterns and types of discussions observed. If live web research is not possible, explicitly state: **"Unable to perform live platform research. Recommendations below are based on known patterns for this niche/platform. Verify with live research before committing to topics."**
4. **Prioritize content gaps over saturated topics.** A question with 50 upvotes and no good answer is higher value than a topic with 5,000 upvotes and 500 comprehensive responses.
5. **Time-stamp trending items.** Anything flagged as "trending now" should include: "Act within 48 hours or verify it's still active before creating content."

---

## I3 — `repurpose` mode

Take one piece of content and produce platform-adapted versions. Each must stand alone — no "see original post for context."

### Repurpose workflow

1. **Identify the core insight.** What's the single most valuable idea in the source content? Reduce it to one sentence.
2. **Map to each platform using the transformation table below.**
3. **Rewrite, don't reformat.** Platform adaptation means changing the structure, tone, and emphasis — not just the length.

### Platform transformation table

| From | To | What changes |
|------|----|--------------|
| Blog article / long-form | **Reddit** | Extract one compelling finding. Lead with the problem, not the solution. Add discussion prompt. Remove all marketing language. |
| Blog article | **Instagram** | Distill to one visual concept. Carousel or reel script. Short caption with hook + key point + CTA. |
| Blog article | **LinkedIn** | Extract the single strongest insight. Personal framing. Story-led structure. 200-300 words. |
| Blog article | **LinkedIn video** | Turn the strongest lesson into a 60–90 sec talking-head or screen-recording script with one proof point. |
| Blog article | **Facebook Group** | Frame as a lesson learned. Community-oriented language. Discussion prompt at end. |
| Blog article | **X (Twitter)** | Extract 5-7 key points. Lead with the most counterintuitive. Build a thread. One insight per tweet. |
| Blog article | **YouTube long-form** | Build a scripted 8–15 min video with segmented body, retention resets, and search-optimized title. |
| Blog article | **YouTube Shorts** | Extract the single most visual or counterintuitive takeaway. 15–60 sec hook → proof → loop-friendly CTA to long-form. |
| LinkedIn post | **Reddit** | Strip professional framing. Add technical detail. More detached, analytical tone. |
| LinkedIn post | **Instagram** | Convert the insight into a carousel narrative. Add visual brief. Shorten caption by 60%. |
| LinkedIn post | **LinkedIn video** | Turn the insight into a 30–90 sec talking-head script; use the post as post copy and add a conversation CTA. |
| LinkedIn post | **X (Twitter)** | Condense to 280 characters or a 5-8 tweet thread. Sharpen the hook. Add speed. |
| LinkedIn post | **YouTube Shorts** | Turn the insight into a 30–60 sec talking-head or screen-recording hook with one proof point. |
| Reddit post | **LinkedIn** | Add professional context. Soften blunt/technical language. Add career/business implications. |
| Reddit post | **Instagram** | Extract the most visual/counterintuitive element. Build a reel script around one "aha" moment. |
| Reddit post | **X (Twitter)** | Extract the strongest claim. Build a thread around it. Speed up the pacing. |
| Reddit post | **YouTube long-form** | Expand the thread into a structured tutorial with timestamps and screen proof. |
| Instagram content | **Reddit** | Strip visual references. Add technical depth and written explanation. Longer form. |
| Instagram content | **LinkedIn** | Add business context. Connect insight to professional outcomes. |
| Instagram content | **X (Twitter)** | Convert visual concept to text thread. Describe what the visual shows. Distill to key takeaway. |
| Instagram content | **YouTube Shorts** | Reuse the Reel as a Short directly if vertical + under 3 min; otherwise re-cut the core hook. |
| X (Twitter) thread | **Reddit** | Expand into self-post. Add context, deeper analysis, discussion prompts. |
| X (Twitter) thread | **LinkedIn** | Convert to 200-300 word post. Add professional framing. Slightly softer tone. |
| X (Twitter) tweet | **Instagram** | Visualize the takeaway. Carousel or quote card. Short caption. |
| X (Twitter) thread | **YouTube long-form** | Turn the thread into a scripted video, one tweet ≈ one segment, with title from the hook tweet. |
| Video/podcast transcript | **All platforms** | Extract 3-5 quotable insights. Each becomes one platform-adapted post. Long-form video → blog/LinkedIn; Shorts clips → Instagram/YouTube Shorts/X. |
| YouTube long-form | **Reddit** | Extract one technical lesson. Lead with problem, include code/screenshots, end with discussion prompt. |
| YouTube long-form | **LinkedIn** | Summarize the core insight in 200–300 words with professional framing. |
| YouTube long-form | **LinkedIn video** | Cut one 60–90 sec segment with a strong standalone hook and native-first captions. |
| YouTube long-form | **X (Twitter)** | Turn each segment into a tweet; hook tweet = title promise; thread builds the case. |
| YouTube long-form | **Instagram** | Carousel from segments or Reel from the strongest 60-sec clip. |
| YouTube long-form | **YouTube Shorts** | Cut one counterintuitive moment or quick win per Short; CTA back to the full video. |
| YouTube Shorts | **Instagram Reel** | Repost directly if under 90 sec and vertical; trim to Instagram's strongest 30–60 sec otherwise. |
| YouTube Shorts | **X (Twitter)** | Extract the spoken hook as a tweet; attach the video or a GIF. |
| YouTube Shorts | **LinkedIn** | Add business context to the takeaway; keep under 150 words. |
| YouTube Shorts | **LinkedIn video** | Upload natively; add LinkedIn-specific first-frame text and conversation CTA. |
| LinkedIn video | **LinkedIn text post** | Transcribe the core insight and proof point into a 200–300 word post. |
| LinkedIn video | **LinkedIn carousel** | Expand the video's 3–5 beats into 6–12 slides with the hook on slide 1. |
| LinkedIn video | **YouTube Shorts** | Re-export vertical version if needed; ensure the 0–3 sec hook is self-contained. |
| LinkedIn video | **Instagram Reel** | Use as-is if vertical/under 90 sec; otherwise re-cut the strongest 30–60 sec. |
| LinkedIn video | **X (Twitter)** | Extract the screenshot-worthy line as a tweet; attach the video or quote card. |

### Multi-platform repurpose output

When repurposing to all 7 platforms, produce:

```
CORE INSIGHT: [one sentence — the DNA of all versions]

REDDIT VERSION
  Subreddit suggestion: [which community]
  Title: [hook]
  Body: [full post]

INSTAGRAM VERSION
  Format: [reel / carousel / story]
  Caption: [full caption]
  Visual brief: [what to create]

LINKEDIN VERSION
  Hook: [first line]
  Body: [full post]

LINKEDIN VIDEO VERSION
  Format: [talking head / screen + voice / BTS]
  0–3 sec hook: [first spoken line]
  Body beats: [3–5 bullet points]
  On-screen text: [key overlays]
  Caption note: [burned-in captions required]
  CTA: [conversation prompt]

X (TWITTER) VERSION
  Format: [single tweet / thread]
  Hook tweet: [first tweet — the thread anchor]
  Body: [remaining tweets or full tweet]
  Media suggestion: [image/video if applicable]

FACEBOOK VERSION
  Context: [Group or Page? Which group?]
  Body: [full post]

YOUTUBE VERSION
  Format: [long-form / Shorts / both]
  Long-form title: [title]
  Long-form segment outline: [3–4 segments with retention points]
  Shorts hook: [0–3 sec hook]
  Thumbnail concept: [3–5 words + visual focal point]
```

---

## I4 — `strategy` mode

Assess which platforms fit the project's target buyer profile. Output a platform recommendation matrix.

### Strategy workflow

1. Load target buyer profile from `.work.biz/strategy/target-buyer-profile.md`
2. Load channel plan from `.work.biz/strategy/channel-plan.md`
3. Assess each platform against:
   - Does the target buyer spend meaningful time here?
   - Does the platform support the price range?
   - Does the platform's content format match the offer's proof points?
   - What's the operator's existing presence on each platform?

### Output format

```markdown
## Platform Strategy — {PROJECT_NAME}

**Primary platform:** {platform} — {rationale in one sentence}
**Secondary platforms:** {list}
**Skip for now:** {list with brief reasons}

### Reddit
  Fit: {EXCELLENT / GOOD / POOR}
  Recommended subreddits: {list based on buyer profile}
  Content approach: {one sentence}

### Instagram
  Fit: {EXCELLENT / GOOD / POOR}
  Content format recommendation: {reels / carousels / stories}
  Visual style: {one sentence}

### LinkedIn
  Fit: {EXCELLENT / GOOD / POOR}
  Post frequency: {recommendation}
  Format mix: {text / carousel / video / combination}
  Video readiness: {ready now / needs minimum setup / defer until text+carousel proven}
  Content pillars: {2-3 themes}

### Facebook
  Fit: {EXCELLENT / GOOD / POOR}
  Approach: {Groups first / Pages / Skip}
  Group suggestions: {if applicable}

### X (Twitter)
  Fit: {EXCELLENT / GOOD / POOR}
  Tweet frequency: {recommendation}
  Thread cadence: {1-2x/week recommended for deep content}
  Content pillars: {2-3 themes}

### YouTube
  Fit: {EXCELLENT / GOOD / POOR}
  Format mix: {long-form / Shorts / both}
  Upload cadence: {capacity-dependent: e.g., 1 long-form + 3–5 Shorts/week at medium-high capacity; 1 long-form/2 weeks + 2 Shorts/week at low-medium capacity}
  Content pillars: {2-3 themes}
  Search vs. discovery emphasis: {one sentence}

### 30-day action plan
  Week 1: {action}
  Week 2: {action}
  Week 3: {action}
  Week 4: {action}
```

---

## I5 — `plan` mode

Build a platform-specific content calendar. Output a Markdown table.

### Plan table format

| Day | Date | Platform | Type | Topic | Hook seed | Visual needed | Repurpose source |
|-----|------|----------|------|-------|-----------|---------------|-----------------|

### Planning rules

- Every topic must trace to a loaded audience pain or the operator's proven work
- Vary content types — don't post the same format 5 days in a row
- Leave 2-3 slots per week for reactive/trending content (especially Instagram and YouTube Shorts)
- For Reddit: plan 1-2 posts per week max. Focus on comment engagement daily.
- For Instagram: 3-5 feed posts + 5-7 stories per week
- For LinkedIn: 2-4 posts per week; include 1 native video every 1–2 weeks once minimum setup is available
- For X (Twitter): 3-5 tweets + replies daily. 1-2 threads per week.
- For Facebook Groups: 2-3 posts + daily comment engagement
- For YouTube: 1 long-form video per week + 3–7 Shorts; schedule Shorts on non-upload days to maintain consistency signal

---

## Platform Image Dimension Quick Reference

| Platform | Feed post (square) | Feed post (vertical) | Story | Profile pic | Cover/banner |
|----------|-------------------|---------------------|-------|-------------|--------------|
| **Reddit** | N/A (text-first) | N/A | N/A | 256x256px | Banner: 1920x384px (10:1) |
| **Instagram** | 1080x1080px (1:1) | 1080x1350px (4:5) | 1080x1920px (9:16) | 320x320px | N/A |
| **LinkedIn** | 1080x1080px | 1080x1350px (4:5) | N/A | 400x400px | 1584x396px (personal) |
| **Facebook** | 1080x1080px | 1080x1350px (4:5) | 1080x1920px | 320x320px | 851x315px (page) |
| **X (Twitter)** | 1080x1080px (1:1) | 1080x1350px (4:5) | N/A | 400x400px | 1500x500px (banner) |
| **YouTube** | 1280x720px thumbnail (16:9 preview) | N/A | N/A | 800x800px | 2560x423px (desktop safe: 1546x423px) |

---

## Cross-Platform Content Value Ladder

Different platforms support different levels of depth. Structure your content pyramid:

```
        ▲
       /  \
      / DEEP \         Blog article, case study, technical paper, YouTube long-form
     /  1x/mo  \       → One insight, fully explored
    /───────────\
   /   EXPAND    \     LinkedIn carousel, Reddit self-post, newsletter, YouTube playlist
  /    2-4x/mo    \    → One insight, structured explanation
 /─────────────────\
/    SOCIAL LAYER    \ Instagram reel, LinkedIn post, X tweet/thread, Facebook Group, YouTube Shorts
      3-5x/week       → One insight, one takeaway, platform-native format
```

**Rule:** Every piece of deep content should generate 3-5 social-layer posts. Don't write everything from scratch — ladder it.

---

## Quality check before delivering (run internally)

- [ ] Is the content calibrated to this specific platform's culture and audience?
- [ ] Does the first line/frame/hook earn its place?
- [ ] Is there at least one specific number, name, or proof point?
- [ ] Have I removed all hollow adjectives and marketing language?
- [ ] Is the length appropriate for this platform?
- [ ] Is the CTA platform-appropriate (no "DM me" on Reddit, no external links in body on Instagram)?
- [ ] **LinkedIn:** Are all external links stripped from the post body and placed as a first-comment suggestion?
- [ ] **LinkedIn:** Has the operator been reminded to post the link as the first comment?
- [ ] **LinkedIn carousel:** One idea per slide, ≤40 words/slide, hook on slide 1, no links on slides?
- [ ] **LinkedIn video:** Is the first frame a silent hook? Are captions burned in? Is there one clear takeaway, one proof point, and a conversation-prompt CTA?
- [ ] **YouTube:** Are title + thumbnail evaluated as a pair and CTR-optimized?
- [ ] **YouTube long-form:** Are retention resets planned every 3–4 minutes?
- [ ] **YouTube Shorts:** Is the 0–3 second hook present and is there a clear CTA to long-form/channel?
- [ ] Would this post be upvoted/liked/shared by the target audience, not just the author?
- [ ] Is the technology tilt present (for tech-positioned projects)?
- [ ] Are self-references earned and disclosed, not promotional?
- [ ] Would this content survive 30 seconds of scrutiny by a skeptical platform-native user?

If any box is unchecked, fix it before delivering.

---

## Completion gate (cannot be skipped)

You may only claim the task complete when all are true:
1. The deliverable is written, platform-appropriate, and ready to post.
2. Project context was loaded per I0; any critical gaps were surfaced.
3. The quality check above passes.
4. Platform-specific anti-patterns were avoided.
5. A concrete next step is proposed (e.g., "post to r/subredditname on Tuesday AM," "design the carousel slides in Canva," "run @content-social repurpose on this for Instagram," "create the thumbnail in 1280x720px before upload").

---

## Time budget

| Mode | Time |
|------|------|
| `write` (single platform, short-form) | 15-25 min |
| `write linkedin carousel` | 25-35 min |
| `write linkedin video` (script + shot list + captions + post copy + posting ritual) | 30-45 min |
| `write youtube` (long-form script + title/thumbnail/description) | 35-50 min |
| `write youtube shorts` | 15-25 min |
| `write` (single platform, long-form, e.g. Reddit self-post) | 30-45 min |
| `research` (single platform, focused topic) | 15-25 min |
| `research` (single platform, broad scan) | 25-40 min |
| `repurpose` (one source → one platform) | 15-20 min |
| `repurpose` (one source → all 7 platforms) | 60-80 min |
| `strategy` | 10-15 min |
| `plan` | 20-30 min |
| `icp` | 15-25 min |
| `status` | < 2 min |

---

## LinkedIn ICP mode

`@content-social icp` runs the BIZ-08 LinkedIn Ideal Customer Profile analysis and saves the output to `.work.biz/strategy/linkedin-icp.md`.

This is **not** a content-writing mode. It produces the targeting brief that makes LinkedIn content and outreach precise.

### Workflow

1. Read `.work.biz/strategy/one-pager.md` and `.work.biz/strategy/target-buyer-profile.md`.
2. If they are missing, run a short probe (≤5 questions) to capture:
   - The niche / target buyer
   - The unified offer
   - The buyer's job titles, seniority, and company stage
   - The buyer's LinkedIn behavior (what they post, comment on, save, share)
   - The pain points and trigger events that make them buy
3. Draft the ICP document following `concepts/linkedin-icp/prompt.md`.
4. Save to `.work.biz/strategy/linkedin-icp.md`.
5. Report: ICP saved; next steps (`@biz-content challenge`, `@content-social write linkedin`).

### Output format

```markdown
# LinkedIn ICP — {PROJECT_NAME}

## Profile signal
- Titles: [list]
- Seniority: [e.g., VP / Director / Founder]
- Company stage: [seed / Series A / established]
- Geography: [if relevant]

## Behavioral signal
- Posts about: [topics]
- Comments on: [topics]
- Saves/shares: [content types]
- Active times: [days / times]

## Pain & trigger
- Top 3 pains: [list]
- Buying triggers: [events that make them look for help]

## Hook language
- Words they use: [list]
- Words that repel them: [list]

## Content fit
- Best formats: [text / carousel / video / newsletter]
- Proof they need: [case studies, metrics, credentials]
```

---

## Sources and caveats

Benchmarks in this skill are a mix of platform-reported data, widely cited industry studies, and directional rules of thumb observed across creators. Because social-platform algorithms and audience behavior change frequently:

- Treat percentages, multipliers, and reach estimates as **hypotheses to validate**, not guarantees.
- Always cross-check claims against your own analytics, niche data, and primary sources where a business decision depends on them.
- Marks like `[Source: ...]` point to the origin of a specific claim; marks like `[Unverified — directional benchmark]` are heuristics that should be tested in your own account before scaling.

---

## Gates & dependencies

**No hard gate:** `write`, `research`, `repurpose`, `icp`, and `status` modes can run at any time, like `content-writing`. Output improves dramatically when the host project is bootstrapped (`@biz-bootstrap init`) and strategy-certified (`@biz-strategy certify`).

**Requires `strategy-ready`:** `strategy` and `plan` modes need a certified strategy (`@biz-strategy certify`) because they commit to a platform mix and publishing calendar.

### Composing with other skills

| Skill | When |
|-------|------|
| `@content-writing write` | Draft the core long-form content first, then use `@content-social repurpose` to platform-adapt it |
| `@biz-community find` | Find communities (subreddits, groups, accounts) to post in. Run before `@content-social write reddit` or `write facebook` |
| `@biz-community engage` | Day-to-day comment engagement — complements platform-specific posts |
| `@biz-content publish` | LinkedIn publishing ops (calendar, tracker, challenge, engagement cadence) |
| `@biz-content challenge` | 30-day LinkedIn plan — run before a batch of `write linkedin` / `write linkedin carousel` / `write linkedin video` drafts |
| `@biz-content challenge - video` | 30-day LinkedIn video challenge — run to build the video habit and gather performance data |
| `@biz-youtube publish` | YouTube publishing ops (tracker, calendar, challenge, status) |
| `@biz-youtube plan` | Capacity-appropriate YouTube cadence and series planning |
| `@biz-strategy certify` | Ensure target buyer and channel plan are defined before committing to a platform strategy |
| `@content-writing audit` | Audit a draft before platform-adapting it |
| `@content-social research` | Research trending topics and content gaps before writing |

---

## Related skills

| Skill | When |
|-------|------|
| `@biz-community` | Find and engage with communities across all platforms |
| `@content-writing` | Draft core content (articles, case studies, long-form) to repurpose |
| `@biz-content` | LinkedIn-specific publishing ops and tracking |
| `@biz-youtube` | YouTube-specific publishing ops, tracker, and 30-day challenge |
| `@biz-brand` | Brand voice, visual identity, and presence audit |
| `@biz-strategy` | Target buyer definition, channel plan |
