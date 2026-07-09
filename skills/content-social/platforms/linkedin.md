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

## Research methods

When running `@content-social research linkedin`, use these methods:


| Method | How to execute |
|--------|---------------|
| **Industry conversation scan** | Search relevant industry terms on LinkedIn. Sort by "Top" and "Latest." What are the active debates? Who's driving conversation? |
| **Competitor content audit** | Review last 20 posts from 5 accounts in the project's space. Note hook styles, formats, engagement patterns, and comment quality. |
| **Content white space** | Identify topics that the project's target buyer cares about but no one is covering well on LinkedIn. Look for shallow posts with high engagement — these are opportunities to go deeper. |
| **Hashtag analysis** | Search 3-5 niche hashtags. What content performs best? What's oversaturated? What's absent? |
| **Poll & question mining** | Find polls and question posts in the space. What gets votes? What gets comments? What reveals audience uncertainty? |

