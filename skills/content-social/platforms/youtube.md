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

## Research methods

When running `@content-social research youtube`, use these methods:


See [R6 — YouTube research methods](#content-social-research-youtube--research-methods).
