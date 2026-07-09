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
  LinkedIn: write linkedin, write linkedin carousel.
  YouTube: write youtube, write youtube shorts.
---

# content-social

**Canonical path:** `.ai.biz/skills/content-social/skill.md`

Generate platform-native social media content. Every platform has a different culture, audience expectation, and consumption pattern. A LinkedIn post pasted into a Reddit subreddit will be deleted — or worse, mocked. A Facebook group post formatted like an Instagram caption will be ignored. This skill produces content that belongs on each platform.

**Core principle:** Every piece of content must deliver genuine value to the specific audience on that platform. No cross-posting identical content. No generic marketing language dressed up as a platform post.

**Jump to section:** [Parse invocation](#parse-invocation) · [I0 Project context](#i0--project-context-contract-run-before-writing-anything) · [Platform matrix](#platform-culture--audience-matrix) · [Universal format](#universal-platform-format) · [R1 Reddit](#r1--reddit-content) · [R2 Instagram](#r2--instagram-content) · [R3 LinkedIn](#r3--linkedin-content) · [R4 Facebook](#r4--facebook-content) · [R5 X](#r5--x-twitter-content) · [R6 YouTube](#r6--youtube-content) · [I2 Research](#i2--research-mode) · [I3 Repurpose](#i3--repurpose-mode) · [I4 Strategy](#i4--strategy-mode) · [I5 Plan](#i5--plan-mode) · [ICP mode](#linkedin-icp-mode)

---

## Parse invocation

| User says | Mode |
|-----------|------|
| `@content-social write reddit - <topic>` | Generate a Reddit post (self-post, comment, AMA thread) |
| `@content-social write instagram - <topic>` | Generate Instagram content (caption + visual brief, carousel script, story) |
| `@content-social write linkedin - <topic>` | Generate a LinkedIn text post calibrated to professional audience |
| `@content-social write linkedin carousel - <topic>` | Generate a LinkedIn document/carousel (slide copy + caption + first comment) |
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
| **LinkedIn** | Professional, career-motivated, B2B decision-makers | Feed scroll; article reading; industry-aware but busy | Credentials, track record, mutual connections, specificity | **Higher than others.** Thought leadership is the format. Pitch tolerated after value delivery. |
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
| **Attention span** | Willing to read long-form if valuable | Seconds. Visual hook or scroll past. | Moderate. Will read 200-300 words if relevant. | Variable. Groups: moderate. Feed: short. | Seconds per tweet. Threads earn sustained reading if hook is strong. | Long-form: 8–15 min if value is sustained. Shorts: 0–3 sec hook. |
| **Trust trigger** | Specific, verifiable claims. No marketing language. | Visual authenticity, social proof, consistency. | Deep expertise demonstrated. Specific results. Named clients. | Peer validation. Group membership. Mutual friends. | Insider knowledge, speed, contrarian-but-correct takes, consistency over time. | Demonstrated expertise, consistent uploads, transparent proof, community engagement. |
| **Rejection trigger** | Self-promotion, vagueness, link-dropping | Overt selling, inauthentic polish, stock imagery | Thought leadership without proof. Buzzword bingo. | Spammy posts. Breaking group rules. Uninvited pitching. | Over-polished corporate voice, threadbois, engagement farming, stale takes. | Clickbait, wasted time, sales-first openings, low production value that undermines expertise. |

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

Jump to the platform's section below (R1–R6) for formatting, structure, and anti-patterns.

### Step 3 — Draft with quality rules

Apply the [Universal Platform Format](#universal-platform-format), plus the platform-specific deltas in the relevant R-section.

### Step 4 — Deliver

Provide the complete, ready-to-post content. Below a divider, offer:

1. **Platform notes** — why this post works for this platform specifically
2. **Alternate hooks** (2 options — different angles)
3. **Posting time suggestion** — best window for this platform + audience
4. **Engagement plan** — 1-2 sentences on what to do after posting

---

## R1 — Reddit Content

### Reddit culture fundamentals

Reddit is a collection of communities (subreddits), each with its own rules, culture, and moderators. The site operates on a fundamental principle: **content is upvoted or downvoted by the community based on its value to that community.** Marketing language is sniffed out instantly. Self-promotion without community contribution results in post removal, downvotes into oblivion, and potentially a subreddit or site-wide ban.

**The 9:1 self-promotion rule (Reddit-wide guideline):** For every 1 post that references your own work, you should have ~9 posts or comments that contribute value with no self-reference whatsoever. This is not optional — it's enforced by moderators and the community.

### Reddit content types

| Type | Use case | Structure |
|------|----------|-----------|
| **Self-post (text)** | Sharing expertise, asking for feedback, telling a story, AMA-style | Title (hook) + body (value) + optional discussion prompt. No links in body unless earned. |
| **Comment** | Answering questions in threads, contributing to discussions | Direct, helpful, specific. Cite experience. No "DM me." |
| **Link post** | Sharing a genuinely useful resource (rare) | Must be high-value, not your own site (unless you've earned it). |
| **Crosspost** | Sharing relevant content across related subreddits | Only if it genuinely belongs in both communities. |

### Reddit post structure

Apply the Universal Platform Format with these deltas:

```
TITLE (max 300 characters)
  — Specific, benefit-driven, or tension-based.
  — No clickbait. No "you won't believe." No ALL CAPS.
  — Good: "I built a tax engine that handles 4,900 rules. Here's what I'd do differently."
  — Bad: "Check out my new SaaS platform!!!"

BODY
  — Open with WHY this matters to the reader, not what you did.
  — Use short paragraphs. White space is critical for readability.
  — Formatting: **bold** for emphasis, *italics* for secondary, bullet points for lists.
  — Code snippets or technical details are welcomed in tech subreddits.

DISCUSSION PROMPT (optional)
  — End with an open-ended question to invite conversation.
  — "What tradeoffs have you made on similar problems?"
  — "Has anyone else dealt with [specific edge case]?"

SELF-REFERENCE (only if earned)
  — If mentioning your own work: "For context, I run [name] where we [one-line description] — but this post is about the technical decision, not the product."
  — Never end with "Check out my site at [link]."
```

### Reddit-specific quality rules

1. **Read the subreddit rules before posting.** Every subreddit has a sidebar with rules. Violate them and the post is removed. Check for: self-promotion policy, content format requirements, flair requirements.
2. **Know the subreddit culture.** Spend 30+ minutes reading the top posts from the past month before posting. Understand the inside jokes, the preferred tone, and what gets upvoted vs downvoted.
3. **Title is everything.** On Reddit, most users never click into the body. The title must deliver value or raise genuine curiosity on its own.
4. **No marketing words.** Remove: solution, platform, revolutionary, game-changing, cutting-edge, best-in-class, scalable, robust, seamless, innovative. These words trigger instant downvotes.
5. **Be wrongable.** Reddit rewards intellectual honesty. If there's a limitation or tradeoff, state it upfront. "This approach costs us X in latency, but gains Y in reliability" lands better than "our system is perfect."
6. **AMA format works.** "I built X that does Y. AMA" (Ask Me Anything) threads perform well when you have genuine depth.
7. **Comment value > post value.** The real reputation-building on Reddit happens in the comments, not the posts. A single insightful comment in a popular thread can drive more profile views than 10 posts.
8. **Never delete and repost.** If a post flops, let it die. Deleting and reposting is viewed as spam.

### Reddit anti-patterns (DO NOT)

- Post a link to your own site without extensive community participation history
- Use a brand account name to post (use a personal account)
- Ask for upvotes ("Upvote if you agree!")
- Post the same content to multiple subreddits without customizing for each
- Respond defensively to criticism
- Include "Edit: thanks for the gold!" or any meta-commentary about votes
- Mention your product/service in the first 80% of the post
- Use link shorteners (automatically removed by Reddit's spam filter)

### Reddit posting time

- Best: Tuesday-Thursday, 6-9 AM US Eastern
- Subreddit-specific: check the sub's traffic stats if available
- Avoid: weekends (lower engagement on professional/tech subs), late night

---

## R2 — Instagram Content

### Instagram culture fundamentals

Instagram is a visual-first, mobile-first platform where content competes for attention in under 2 seconds. The dominant content format is now Reels (short-form vertical video), followed by Carousels and Stories. The audience is discovery-oriented — they're scrolling to find interesting, entertaining, or useful content from accounts they may not follow.

**The Instagram promise:** Your content must deliver value visually and conceptually within the first frame. Unlike Reddit (where depth is rewarded) or LinkedIn (where professional insight is valued), Instagram rewards immediate emotional or intellectual payoff.

### Instagram content types

| Type | Best for | Format specs |
|------|----------|--------------|
| **Reel (video)** | Maximum reach, new audience discovery, trends | 9:16 (1080x1920px), 15s-3min. Vertical video. Audio recommended. |
| **Carousel** | Educational deep-dives, tutorials, storytelling, testimonials | 4:5 (1080x1350px) recommended. Up to 20 slides. First slide = hook. |
| **Single image post** | High-impact visual, quote, announcement | 1:1 (1080x1080px) or 4:5 (1080x1350px). Vertical outperforms square. |
| **Story** | Behind-the-scenes, polls, Q&A, casual updates, urgency posts | 9:16 (1080x1920px). 24-hour lifespan (unless saved to highlights). |
| **Note** | Driving traffic to new posts, quick announcements | 60 characters max. Appears at top of DM inbox. |

### Instagram caption structure

Apply the Universal Platform Format with these deltas:

```
HOOK (first line — the only line visible without "more")
  — Under 125 characters. Must stop the scroll.
  — Question, contradictory statement, specific number, or benefit promise.
  — "I spent 6 months building a RAG pipeline. Here's the one mistake that cost me 3 weeks."

BODY (visible after "more" is tapped)
  — 3-6 short paragraphs or bullet points.
  — Conversational tone. Write like you're talking to a smart friend.
  — Use emojis sparingly as visual anchors (max 3-5 per caption).
  — Line breaks between every 1-2 sentences. Walls of text don't get read.

CTA (call to action)
  — What should they do? Comment, save, share, or visit link in bio.
  — "Save this for your next system design interview."
  — "Which approach do you prefer — A or B? Let me know in the comments."

HASHTAGS
  — 5-10 relevant hashtags. Mix of broad (100k+ posts) and niche (5k-50k).
  — Place at end of caption or in first comment.
  — Research: check what hashtags similar creators in your space use.
```

### Instagram visual brief (for image/carousel/reel design)

For each post, include a visual brief describing what the image/video/carousel should show:

```
VISUAL BRIEF
  Type: [reel / carousel / single image / story]
  Style: [clean technical / behind-the-scenes casual / data visualization / text-overlay]
  
  Slide 1 (Hook): [description]
  Slide 2-3 (Problem): [description]  
  Slide 4-5 (Solution/Breakdown): [description]
  Slide 6 (Result/CTA): [description]
  
  Text overlay (if applicable): [key text for each slide]
  Audio suggestion (if reel): [type of audio — trending speech, instrumental, original voiceover]
  Brand colors: [hex codes if known]
```

### Instagram-specific quality rules

1. **The first frame/line decides everything.** Instagram shows your content in-feed with no context. The hook must work in isolation.
2. **Carousels get second chances.** If someone doesn't swipe through all slides, Instagram may show them the carousel again starting from the slide they left on. Structure accordingly — each slide should be satisfying enough to stand alone but intriguing enough to continue.
3. **Audio is not optional for Reels.** Reels without audio underperform significantly. Use trending audio when possible, or add voiceover.
4. **Save = algorithm gold.** "Save this post for later" CTAs work because Instagram's algorithm weights saves heavily. Create content people want to reference.
5. **Share = growth mechanic.** Content shared via DM ("send to a friend") is the fastest growth lever on Instagram. Create content people want to send to someone.
6. **No link in captions.** Instagram does not make caption links clickable. Use "link in bio" and update your bio link for specific posts.
7. **Accessibility matters.** Add alt text to images. Write captions that work when read aloud.
8. **Posting consistency > posting frequency.** 3-5 quality posts per week outperform 14 mediocre ones.

### Instagram anti-patterns (DO NOT)

- Post screenshots of text (hard to read, algorithm downranks)
- Use obvious stock photography
- Over-polish to the point of inauthenticity
- Post low-resolution images (<1080px wide)
- Use more than 30 hashtags (looks desperate, may trigger spam detection)
- Buy followers or engagement (destroys algorithmic reach)
- Post only promotional content

---

## R3 — LinkedIn Content

### LinkedIn culture fundamentals

LinkedIn is a professional network where content is consumed in the context of career, industry, and business. The audience is busy, skeptical of marketing, but hungry for genuine insight that makes them better at their job or helps them understand their industry.

**The LinkedIn content shift:** LinkedIn has moved from "resume platform" to "professional content platform." Text-only posts, carousels (PDF-style documents), and short videos all perform. The algorithm heavily rewards early engagement — the first 60 minutes after posting are critical.

### LinkedIn content types

| Type | Best for | Format specs |
|------|----------|--------------|
| **Text post** | Insights, lessons, stories, hot takes | 100-300 words. Short paragraphs. No external links in body (add in comments). |
| **Carousel / Document post** | Educational deep-dives, frameworks, guides | PDF upload. 4:5 (1080x1350px) or square. Up to 300 pages, but 6-12 is optimal. |
| **Image post** | Data visualization, quote card, announcement | 1.91:1 to 4:5. 1080px minimum width. |
| **Article** | Long-form thought leadership | Native LinkedIn articles. 800-2,000 words. |
| **Video** | Behind-the-scenes, quick tips, personal stories | 30s-5min. Square or vertical. Captions mandatory (most watch without sound). |
| **Poll** | Engagement bait, audience research | 4 options max. 1-2 week duration. |

### LinkedIn post structure

Apply the Universal Platform Format with these deltas:

```
HOOK (first 1-2 lines — this is the only text visible before "see more")
  — Stop the scroll. Specificity > mystery.
  — Bad: "I learned something important today..."
  — Good: "I chose PostgreSQL over MongoDB for a $40k financial platform. Here's why — and what I almost got wrong."

BODY (3-6 short paragraphs)
  — Personal angle: "I" statements build trust faster than "we" or impersonal analysis.
  — Include specific numbers, named technologies, real timelines.
  — Conversational but substantive.

INSIGHT / THE LESSON
  — The sentence people screenshot and share.
  — Must be specific enough that it feels earned, not generic.
  — "The biggest lesson: when your database has 4,900 rules, normalization isn't optional — it's survival."

CTA / ENGAGEMENT PROMPT (optional, context-dependent)
  — Invite conversation, not clicks.
  — "What's your experience with [technology/approach]?"
  — "Has anyone else solved [specific problem] differently?"

COMMENT WITH LINK (if applicable)
  — If you reference a case study, article, or resource, put the link in the first comment.
  — LinkedIn's algorithm penalizes posts with external links in the body.
```

### LinkedIn-specific quality rules

1. **Personal > corporate.** Posts from individual profiles consistently outperform company page posts. Write as a person, not a brand.
2. **The first 60 minutes decide reach.** LinkedIn tests your post with a small audience. If it gets engagement, it expands. Post when your audience is active and engage with comments immediately.
3. **No external links in post body.** LinkedIn deprioritizes posts that lead users off-platform. Put links in the first comment or use native features (articles, documents).
4. **Reply to every comment within the first 2 hours.** This signals high engagement to the algorithm and builds relationship with commenters.
5. **Carousels (document posts) are the highest-reach format.** LinkedIn's algorithm currently favors document uploads. A well-designed 6-12 slide carousel can outperform text-only posts 3-5x [Unverified — directional benchmark based on LinkedIn creator reports; test with your own analytics].
6. **Tag strategically.** Tag relevant people only if they would genuinely want to see the post. Random tagging = spam.
7. **Hashtags: 3-5 max.** LinkedIn recommends focusing on a few relevant hashtags rather than shotgun-blasting 20.

### LinkedIn anti-patterns (DO NOT)

- "Agree?" posts (engagement bait, algorithm now penalizes)
- "Copy-paste this if you agree" (spam, penalized)
- Personal stories with no professional insight payoff
- Political/religious content unless directly relevant to your professional niche
- Posting more than 2x/day (diminishing returns, audience fatigue)
- Using the same hashtags on every post (looks automated)

### LinkedIn posting time

- Best: Tuesday-Thursday, 8-10 AM or 12-1 PM local audience time
- Second-best: Monday and Friday, same windows
- Avoid: weekends, late nights
- Test and verify for your specific audience

### LinkedIn carousel (document post)

Use when the topic is a **framework, checklist, or step-by-step** — content the ICP would save. Invoke via `write linkedin carousel - <topic>`.

**Specs:** 6–12 slides · 1080×1350px (4:5) or 1080×1080px · PDF upload · ≤40 words per slide

**Deliverable structure:**

```
SLIDE 1 — HOOK
  Title only. The reason to swipe. Specificity > mystery.

SLIDES 2–N — ONE IDEA PER SLIDE
  Headline (≤8 words) + 1–2 supporting lines max.
  Progressive logic: problem → insight → steps → outcome.

FINAL SLIDE — INSIGHT + CTA
  The screenshot-worthy line + conversation prompt (not "DM me").

COMPANION CAPTION (for the post above the document)
  2–4 lines max. Restates hook. No external links.

FIRST COMMENT (if links needed)
  "Links to [resource]: [URLs]"

DESIGN NOTES
  Left-aligned text, high contrast, one visual concept per slide.
  No stock photos. Brand colors if loaded from brand guide.
```

**Carousel quality rules:**

1. Slide 1 must work without context — it's the thumbnail in feed.
2. Each slide must be satisfying alone (partial swipes happen).
3. Prefer numbered frameworks ("3 mistakes…", "5-step…") when the topic allows.
4. Same external-link rule: URLs in first comment only, never on slides or caption.

---

## R4 — Facebook Content

### Facebook culture fundamentals

Facebook content strategy is split into two distinct domains: **Groups** (community-first, high-engagement, threaded) and **Pages** (broadcast-first, lower organic reach, ad-amplified). The approach and rules differ significantly between them.

**The Facebook reality in 2026:** Organic reach on Facebook Pages is extremely limited (1-5% of followers typically see posts) [Unverified — widely reported industry rule of thumb; verify in your own Page insights]. Groups, however, have high organic reach — members often see every post. For service businesses and B2B operators, Facebook Groups in your target niche are often the highest-ROI Facebook strategy.

### Facebook content types

| Type | Best for | Context |
|------|----------|---------|
| **Group post** | Building authority in niche communities | High organic reach. Must follow group rules. Value-first. No linking unless permitted. |
| **Page post** | Broadcast updates, content distribution | Low organic reach. Best used for brand presence + ad amplification. |
| **Facebook Story** | Casual updates, polls, behind-the-scenes | 24-hour lifespan. Lower competition than Instagram Stories. |
| **Event** | Webinars, launches, live sessions | Can drive high engagement if your audience is Facebook-native. |
| **Live video** | Q&A, tutorials, launches | High engagement during broadcast. Facebook notifies followers. |
| **Long-form post** | Detailed explanations, personal stories, case studies | Only works in Groups or with highly engaged Page audiences. |

### Facebook Group post structure

Apply the Universal Platform Format with these deltas:

```
INTRO (1-2 sentences)
  — Acknowledge the community. Show you understand the group's purpose.
  — "I've seen a few people here asking about [problem]. Thought I'd share what worked for me."

VALUE BODY
  — 3-5 paragraphs. Conversational, helpful, specific.
  — Use line breaks generously. Facebook mobile is merciless on long paragraphs.
  — If referencing externals: describe the concept fully in the post. Link only if rules allow and it's genuinely additive.

DISCUSSION PROMPT
  — End with a question to the community.
  — "What's worked for you on this? Any tools I should try?"
  — "Has anyone dealt with [edge case variation]?"

SELF-REFERENCE (only if genuinely relevant AND rules permit)
  — "Full disclosure: I run [name] where we [one-line]. But genuinely curious how others approach this."
```

### Facebook Page post structure

Apply the Universal Platform Format with these deltas:

```
SHORT HOOK (1 line)
  — Mobile-first. Under 80 characters ideally.
  — Lead with the value or insight.

BODY (2-4 short paragraphs)
  — Even shorter than LinkedIn. Mobile feed is crowded.
  — One clear takeaway per post. Don't try to cover multiple topics.

VISUAL (image or video required for any meaningful reach)
  — 1:1 (1080x1080px) or 4:5 (1080x1350px)
  — Text on image should be minimal — Facebook's algorithm downranks images with heavy text overlay
  — Video: 1:1 or 4:5. Under 2 minutes. Captions mandatory.

CTA
  — One clear action. Comment, share, or click.
  — "What's your experience with [X]?"
```

### Facebook-specific quality rules

1. **Groups are the organic reach play.** If your target buyers are in Facebook Groups, prioritize group participation over Page posting. Build reputation through consistent helpfulness.
2. **Read and follow group rules exactly.** Many groups have strict rules about self-promotion, link sharing, or post format. Violate them and you're removed.
3. **Video gets reach on Pages.** Facebook's algorithm currently favors native video (not YouTube links). Short, captioned, value-dense videos work best.
4. **Personal profile > Page for Groups.** Post in Groups from your personal profile, not your Page. People trust people, not brands.
5. **No external link in post body (if possible).** Put links in the first comment. Facebook deprioritizes posts that lead off-platform.
6. **Engage in the comments.** Facebook rewards posts with active comment threads. Respond to every comment.
7. **Local relevance matters.** If your business has a geographic component, leverage local Groups and local Page features.

### Facebook anti-patterns (DO NOT)

- Join a Group and immediately post your offer (instant ban in most well-moderated groups)
- Post Page content to Groups without adapting it to the Group culture
- Share external links without summarizing the value in the post body
- Post political/divisive content (unless your business explicitly operates in that space)
- Use engagement bait ("Tag someone who...", "Share if you agree...")
- Post identical content to multiple Groups in rapid succession

### Facebook posting time

- Best: Wednesday-Thursday, 9 AM-12 PM local audience time
- Groups: check when moderators and active members are most active
- Avoid: late night, weekends (Group dependent — some hobby Groups are weekend-heavy)

---

## R5 — X (Twitter) Content

### X/Twitter culture fundamentals

X is a real-time, high-velocity platform where brevity, timing, and sharpness are rewarded. The 280-character limit (4,000 for X Premium) forces concise thinking. The platform is dominated by tech, media, VC, journalism, and political discourse — but niche communities (via Lists and Communities) are deeply engaged.

**The X content reality in 2026:** The platform rewards engagement velocity. The first 30 minutes after posting are critical. Quote-tweets amplify reach dramatically. Threads (tweetstorms) are the primary format for long-form thought. Visual content (images, video) significantly boosts engagement. The audience is skeptical of marketing and rewards genuine insight delivered with personality.

### X/Twitter content types

| Type | Best for | Structure |
|------|----------|-----------|
| **Single tweet** | Quick insight, observation, hot take, announcement | 1-2 sentences. Standalone value. Can include one image or link. |
| **Thread** | Deep dives, stories, technical breakdowns, lessons learned | 5-20 tweets threaded. Hook tweet first. Number tweets for readability. |
| **Quote tweet** | Adding insight to someone else's post, building on a conversation | Quote + your take. Adds value to the original, doesn't just amplify. |
| **Reply** | Engaging in conversations, building relationships, visibility | Direct, valuable, specific. Avoid "great thread!" without substance. |
| **Image/video tweet** | Visual proof, demos, data viz, behind-the-scenes | Image: 16:9 or 1:1. Video: under 2:20, captioned. Must work without sound. |
| **Poll** | Audience engagement, market research, conversation starter | 2-4 options. Duration: 1 day typical. Reply to voters to build engagement. |

### Single tweet structure

Apply the Universal Platform Format with these deltas:

```
BODY (max 280 characters)
  — Lead with the insight. No warm-up.
  — One clear idea. If it needs two, make it a thread.
  — Specific > clever. Numbers and names earn trust.
  — Good: "I chose Postgres over Mongo for a 4,900-rule tax engine. The normalization alone saved 6 weeks of debugging."
  — Bad: "Excited to announce our new platform! Check it out at [link]"

MEDIA (optional but recommended)
  — One image or short video. Dramatically increases engagement.
  — Image: 1600x900px (16:9) or 1080x1080px (1:1). No heavy text overlay.
  — Video: Under 2:20. Square or 16:9. Captioned.

HASHTAGS (1-2 max)
  — Use sparingly. 1-2 relevant hashtags. Overuse signals desperation.
```

### Thread structure

Apply the Universal Platform Format with these deltas:

```
TWEET 1 (HOOK — the one that determines whether the thread is read)
  — Counterintuitive claim, specific result, or compelling question.
  — Must contain enough value to stand alone (it will be screenshot and shared independently).
  — Under 280 characters. Include "🧵" or "A thread:" at the end.
  — Good: "I spent 6 months rebuilding a RAG pipeline from scratch. Here are the 7 decisions I'd make differently: 🧵"

TWEETS 2–N (BODY)
  — One idea per tweet. Number them (2/12, 3/12) for readability.
  — Mix lengths for rhythm. Short punchy tweets between longer explanatory ones.
  — Include specific data, examples, tradeoffs, and hard-won lessons.
  — Each tweet should deliver value on its own (in case someone only sees one via retweet).

FINAL TWEET (CONCLUSION + CTA)
  — Restate the core insight. Invite discussion.
  — "What's the most surprising lesson you've learned from [domain]?"
  — Optionally link to a longer resource: "I wrote a deeper breakdown here: [link]"

NOTE: Post the full thread within 2-3 minutes. Do not leave gaps between tweets.
```

### X/Twitter-specific quality rules

1. **First tweet is everything.** If the first tweet doesn't earn engagement, the thread dies. Lead with the strongest, most counterintuitive statement.
2. **Write for the algorithm.** Early engagement (likes, retweets, replies in first 30 min) determines reach. Post when your audience is active.
3. **One idea per tweet.** Even in threads. If you need two tweets to make one point, rewrite it.
4. **Delete the first sentence.** It's almost always a warm-up. The real opener is sentence two.
5. **Visuals are not optional.** Tweets with images or video get 3-5x more engagement [Unverified — directional benchmark; verify against X analytics]. Every thread should have at least one visual.
6. **Quote-tweet with value.** Only QRT if you're adding genuine insight. "This" + link is spam.
7. **Engagement timing matters.** Reply to comments within the first hour. QRTs of your content are signals — engage with them.
8. **Lists > timeline.** Build private Lists of target buyers, peers, and industry voices. Engage with their content daily.
9. **Community Notes awareness.** X's Community Notes feature can add context to misleading posts. Ensure claims are specific and verifiable. Vague boasts can get noted.
10. **No threadboi energy.** Don't start threads with "Most people don't know..." or "The truth about X nobody talks about..." unless you have genuinely novel insight. The audience has pattern-matched these openers.

### X/Twitter anti-patterns (DO NOT)

- "Please retweet" or "RT for reach" (engagement farming, penalized)
- Threads that start with "1/20" without a strong hook (nobody cares how long it is until they care about the topic)
- Corporate-speak or overly polished language (X rewards authentic voice)
- Posting links without commentary (link-dropping)
- Ratio-baiting (deliberately posting controversial takes for engagement without substance)
- Tagging influencers unnecessarily for visibility
- Using engagement pods or buying followers (Community Notes + algorithmic detection)
- Repeating the same tweet format every day (the algorithm rewards variety)

### X/Twitter posting time

- Best: Tuesday-Thursday, 8-10 AM or 12-1 PM US Eastern
- Tech/VC audience: Tuesday-Wednesday, 9-11 AM US Eastern
- European audience: 2-4 PM CET
- Avoid: weekends (lower professional engagement), Friday afternoons
- Threads: post mid-morning on Tuesday/Wednesday for maximum pickup
- Test: X analytics will tell you when YOUR followers are most active

---

## R6 — YouTube Content

### YouTube culture fundamentals

YouTube is the world's second-largest search engine and the only major platform where content compounds for years. With 2.5–2.7 billion monthly active users and 500+ million daily search queries [Source: YouTube platform data — 2.5–2.7B MAU, 500M+ daily searches], it rewards intent-driven discovery: viewers search for answers, binge playlists, and subscribe when a channel reliably solves a problem or entertains.

The platform has two distinct modes:

- **Long-form:** Educational, search-rankable, trust-building. Long-form video ranks for 3.2x more keywords and generates 41% higher lead-generation rates than short-form [Source: video SEO / lead-gen benchmark data — long-form 3.2x keywords, 41% higher lead gen]. 68% of B2B buyers watch long-form videos before purchasing [Source: B2B buyer behavior data — 68% watch long-form before purchase].
- **Shorts:** Discovery, reach, audience conversion to long-form and subscribers. Short-form video has been the #1 ROI format for three consecutive years and generates 2.5x more engagement per impression than long-form [Source: short-form video ROI data — #1 ROI 3 years running, 2.5x engagement per impression]. YouTube extended Shorts to 3 minutes in October 2024 [Source: YouTube product update — Shorts extended to 3 min, Oct 2024].

**The YouTube promise:** Every video must deliver on the promise of the title and thumbnail. Clickbait destroys trust and retention; under-delivery kills channel growth.

### YouTube content types

| Type | Best for | Format specs |
|------|----------|--------------|
| **Long-form video** | Education, deep tutorials, case studies, thought leadership, search ranking | 8–15 min sweet spot. 16:9 (1920x1080px). Retention dips around 4, 9, and 18 minutes [Source: retention benchmark data — dips at 4, 9, 18 min]. |
| **Shorts** | Discovery, quick wins, hooks, converting viewers to long-form/channel | 15–60 sec standard; up to 3 min when the idea genuinely justifies it. 9:16 vertical (1080x1920px). |
| **Community post** | Polls, updates, behind-the-scenes, driving engagement between uploads | Text, image, poll, or video. Lightweight. |
| **Live stream** | Q&A, launches, workshops, real-time community building | Long-form; can be repurposed into clips and Shorts. |
| **Playlist** | Session duration, topic clustering, binge-watching | Curated grouping of long-form videos around a problem or learning path. |

### `@content-social write youtube` — Long-form script (8–15 min)

Apply the Universal Platform Format with these deltas:

```
TITLE + THUMBNAIL (evaluate as a pair)
  — Title: front-load the keyword; promise a specific outcome or answer.
  — Thumbnail: 3–5 words max, high contrast, one facial or visual focal point, readable at small size.
  — CTR target: <3% = rewrite title/thumbnail; 3–6% = average; 6–12% = good (typical for small channels); >12% = excellent. Shorts: 8–15%.

HOOK (0:00–0:30)
  — Restate the title promise in spoken form. No preamble, no "welcome back."
  — Show the outcome or stakes: "In the next 10 minutes I'll show you how we cut API latency from 1.2s to 90ms."
  — Preview the structure so viewers know the video delivers.

SEGMENTED BODY (8–15 min total; retention reset every 3–4 min)
  — Break into 3–4 named segments. Each segment opens with a mini-hook.
  — Insert a retention point every 3–4 minutes: "Stay for segment 3 — that's where most teams fail."
  — Use proof points, screen recordings, code snippets, or real numbers every 60–90 seconds.
  — Address retention dips around 4, 9, and 18 min with a pattern interrupt, visual change, or explicit value restatement.

CTA (final 30–60 sec)
  — One primary action: subscribe, watch the next video, or download a resource.
  — Connect the CTA to the video's topic: "If you want the checklist I used, it's in the description."
  — Keep it short. The value has already been delivered.

END-SCREEN CUE
  — Verbally cue the next logical video 10–15 sec before the end screen appears.
  — "Next, watch this breakdown of how we load-tested the same API."
```

### `@content-social write youtube shorts` — Shorts script (15–60 sec, up to 3 min)

Apply the Universal Platform Format with these deltas:

```
0–3 SECOND HOOK
  — Start mid-sentence or with a strong visual. No intro logo, no "Hey guys."
  — Hook must match the title/thumbnail promise instantly.
  — Example: "This one Postgres setting cut our query time 40%."

SINGLE TAKEAWAY BODY
  — One idea only. Strip sub-points and nuance.
  — Use text-on-screen to reinforce the spoken point.
  — Show the proof: a screen recording, a number, a before/after.

LOOP-FRIENDLY ENDING
  — End on the same energy or visual beat you opened with so the loop feels natural.
  — Avoid a hard stop; let the viewer want to re-watch or swipe to the next Short.

CTA TO LONG-FORM / CHANNEL
  — "Full 12-min breakdown is on the channel — link in description."
  — "Subscribe for the longer tutorial tomorrow."
  — Keep CTAs brief; the Short itself is the ad for the channel.
```

### Thumbnail + title strategy

Treat the title and thumbnail as a single unit. They must answer one question: "Why should I click instead of the other 9 results?"

**Title rules:**

1. Front-load the keyword or the curiosity driver.
2. Use specific numbers or timeframes: "8 minutes," "3 mistakes," "$40k."
3. Avoid question-bait titles that the video doesn't fully answer.

**Thumbnail rules:**

1. **3–5 words maximum.** Thumbnails are not paragraphs.
2. **High contrast.** Test readability on a phone screen in bright light.
3. **One focal point.** Face, product, or diagram — not a collage.
4. **Evaluated as a pair.** If you change the title, re-check the thumbnail and vice versa.
5. **CTR optimization.** Test variations when possible. Benchmarks: <3% rewrite title/thumbnail, 3–6% average, 6–12% good (typical for small channels), >12% excellent. Shorts: 8–15%.

### Description + timestamps + pinned comment template

```
DESCRIPTION
  — First 2 lines: hook restatement + value promise (visible before "Show more").
  — Include target keyword naturally in the first 2 lines.
  — Links: resources, related video, lead magnet, social/channel subscribe.
  — Hashtags: 2–3 max, relevant.

TIMESTAMPS
  0:00 Hook / what you'll learn
  0:45 Segment 1: [topic]
  3:20 Segment 2: [topic]
  6:45 Segment 3: [topic]
  10:10 Key mistake to avoid
  12:30 CTA and next steps

PINNED COMMENT
  — Restate the core insight in one sentence.
  — Ask one question to drive comments.
  — Link to the most relevant resource or next video.
  — Example: "The biggest surprise in this build was the indexing choice. What's the most counterintuitive optimization you've found? [link to checklist]"
```

### `@content-social research youtube` — Research methods

| Method | How to execute |
|--------|---------------|
| **Trending topic scan** | Search the project's niche keywords on YouTube. Filter by "This month" and "This year." Note which topics are getting consistent new uploads and high view velocity. |
| **Title gap analysis** | For target keywords, compare the top 10 video titles. Look for outdated angles, missing sub-topics, or titles that promise more than they deliver. |
| **Thumbnail gap analysis** | Screenshot the top 10 thumbnails for a target keyword. Identify visual patterns to avoid and whitespace to own (e.g., all blue → use orange; all faces → use a clean UI shot). |
| **Competitor analysis** | Audit 5–10 channels in the niche. Note upload frequency, most-viewed videos, comment questions that go unanswered, and playlist structure. |
| **Comment desire mapping** | Read comments on popular videos in the niche. What do viewers ask for next? What do they say was missing? These are the highest-value content gaps. |
| **Search suggest mining** | Type the niche keyword into YouTube search and note autocomplete suggestions. These are real user queries with search intent. |

### YouTube-specific quality rules

1. **Title + thumbnail > everything else.** A great video with a weak title/thumbnail dies. A good video with a strong title/thumbnail grows.
2. **Retention is the algorithm.** YouTube promotes videos that keep viewers on the platform. Structure every video to earn watch time and session time.
3. **Front-load value.** The first 30 seconds must deliver the promise of the title. No long intros, no channel housekeeping.
4. **One video, one promise.** Don't pack three topics into one video. One clear outcome per video.
5. **Use chapters/timestamps.** They improve UX and help YouTube understand topic relevance.
6. **Pinned comment drives engagement.** Ask a specific question in the first comment and reply to early commenters.
7. **Shorts feed the long-form.** Shorts should convert viewers to subscribers and long-form videos, not exist in isolation.
8. **Accessibility matters.** Add captions, clear audio, and readable on-screen text.

### YouTube anti-patterns (DO NOT)

- Clickbait titles/thumbnails that the video under-delivers on
- Long intro sequences, animated logos, or "sorry I haven't posted"
- Asking for likes/subscribes before delivering value
- Packing multiple unrelated topics into one video
- Ignoring retention analytics and continuing to make videos with the same weak pattern
- Treating Shorts as miniature long-form videos instead of standalone hooks
- Publishing without timestamps for educational content
- Neglecting the description and pinned comment

### YouTube posting cadence

- **Long-form:** 1 high-quality video per week minimum; 2 per week if production capacity allows.
- **Shorts:** 3–7 per week for discovery and subscriber growth.
- **Best upload windows:** Thursday-Sunday, 2–4 PM US Eastern for general audiences; B2B/tech audiences often perform well Tuesday-Thursday mornings. Test with your own analytics.
- **Consistency signal:** Same day/time each week trains subscribers and the algorithm.

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

### Reddit research methods

| Method | How to execute |
|--------|---------------|
| **Subreddit scan** | Browse the top posts from the past week and month in 3-5 relevant subreddits. Note what topics get high upvote-to-comment ratios (indicates strong resonance). |
| **Comment mining** | In relevant subreddits, sort by "Top" → "Past Week." Read the top 20 comment threads. Find questions that got partial answers, conflicting advice, or no resolution. These are content gaps. |
| **AMA archaeology** | Search for past AMAs by people in the field. What questions got the most upvotes? What went unanswered? |
| **Pain point detection** | Search for phrases like "how do I...", "has anyone...", "struggling with...", "can't figure out..." in relevant subreddits. |
| **Trending topic surfacing** | Check r/all filtered by topic, Reddit's "rising" sort, and cross-reference with project's niche to find emerging conversations. |

### Instagram research methods

| Method | How to execute |
|--------|---------------|
| **Trending audio** | Check Instagram's Reels tab for audio with ↗ arrows (trending). Note which audio formats match your niche's visual style. |
| **Competitor scan** | Review the last 20 posts from 5-10 creators/accounts in your niche. Note which formats, hooks, and topics get the highest engagement. |
| **Hashtag exploration** | Search key hashtags in the project's niche. Note the top posts — what patterns repeat? What's missing? |
| **Comment desire mapping** | Read comments on popular posts in your niche. What do people ask for? What do they want explained? What frustrates them? |
| **Format trend detection** | Note which content formats are surging: carousels with dense text? Face-to-camera reels with captions? Screen recordings? Behind-the-scenes? |

### LinkedIn research methods

| Method | How to execute |
|--------|---------------|
| **Industry conversation scan** | Search relevant industry terms on LinkedIn. Sort by "Top" and "Latest." What are the active debates? Who's driving conversation? |
| **Competitor content audit** | Review last 20 posts from 5 accounts in the project's space. Note hook styles, formats, engagement patterns, and comment quality. |
| **Content white space** | Identify topics that the project's target buyer cares about but no one is covering well on LinkedIn. Look for shallow posts with high engagement — these are opportunities to go deeper. |
| **Hashtag analysis** | Search 3-5 niche hashtags. What content performs best? What's oversaturated? What's absent? |
| **Poll & question mining** | Find polls and question posts in the space. What gets votes? What gets comments? What reveals audience uncertainty? |

### Facebook research methods

| Method | How to execute |
|--------|---------------|
| **Group discussion scan** | In relevant Groups, sort by "Most Recent" and "Top Posts." Note which post types get the most comments and reactions. |
| **Recurring question detection** | In Groups, search for "any advice on...", "looking for...", "recommendations for...". Questions that appear weekly are highest-value content targets. |
| **Moderator announcement analysis** | Read moderator posts and group rules. What content formats do they encourage? What gets removed? This tells you what the group values. |
| **Competitor presence audit** | Check if competitors or peers are active in the Groups. What are they posting? How is the community responding? |
| **Local relevance check** | If the project has a geographic component, search local Groups and community pages for relevant discussions. |

### X (Twitter) research methods

| Method | How to execute |
|--------|---------------|
| **Trending / For You tab** | Browse X's trending topics and "For You" feed. Filter by topic relevance. Note which conversations are taking off in the project's niche. |
| **Hashtag search** | Search niche hashtags. Sort by "Top" and "Latest." What content formats get the most engagement (threads, single tweets, images)? |
| **Competitor audit** | Review the last 30 tweets from 5-10 accounts in the project's space. Note tweet format mix, thread frequency, engagement patterns, reply behavior. |
| **List monitoring** | Build or join Lists of target buyers, industry voices, and competitors. Monitor daily for conversation patterns and content gaps. |
| **Quote-tweet analysis** | For popular tweets in the niche, check the Quote Tweets. What are people adding? What are they disagreeing with? This reveals content white space. |
| **Space listening** | Join X Spaces (live audio) in the niche. Listen for recurring questions, debates, and pain points. These are high-value thread topics. |
| **Advanced search** | Use X's advanced search: `"how do I" OR "anyone know" OR "struggling with" from:accounts_in_niche`. Find unfiltered questions to answer. |

### YouTube research methods

See [R6 — YouTube research methods](#content-social-research-youtube--research-methods).

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
| Blog article | **Facebook Group** | Frame as a lesson learned. Community-oriented language. Discussion prompt at end. |
| Blog article | **X (Twitter)** | Extract 5-7 key points. Lead with the most counterintuitive. Build a thread. One insight per tweet. |
| Blog article | **YouTube long-form** | Build a scripted 8–15 min video with segmented body, retention resets, and search-optimized title. |
| Blog article | **YouTube Shorts** | Extract the single most visual or counterintuitive takeaway. 15–60 sec hook → proof → loop-friendly CTA to long-form. |
| LinkedIn post | **Reddit** | Strip professional framing. Add technical detail. More detached, analytical tone. |
| LinkedIn post | **Instagram** | Convert the insight into a carousel narrative. Add visual brief. Shorten caption by 60%. |
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
| YouTube long-form | **X (Twitter)** | Turn each segment into a tweet; hook tweet = title promise; thread builds the case. |
| YouTube long-form | **Instagram** | Carousel from segments or Reel from the strongest 60-sec clip. |
| YouTube long-form | **YouTube Shorts** | Cut one counterintuitive moment or quick win per Short; CTA back to the full video. |
| YouTube Shorts | **Instagram Reel** | Repost directly if under 90 sec and vertical; trim to Instagram's strongest 30–60 sec otherwise. |
| YouTube Shorts | **X (Twitter)** | Extract the spoken hook as a tweet; attach the video or a GIF. |
| YouTube Shorts | **LinkedIn** | Add business context to the takeaway; keep under 150 words. |

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
- For LinkedIn: 2-4 posts per week
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
| `@biz-content challenge` | 30-day LinkedIn plan — run before a batch of `write linkedin` drafts |
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
