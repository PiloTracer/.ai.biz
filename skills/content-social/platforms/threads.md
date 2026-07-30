## R8 — Threads Content

### Threads fundamentals

Threads is Meta's text-first platform running on Instagram's interest-graph machinery. It is not a smaller X. The two reward opposite behaviors: X rewards being first to a sharp take and can carry a post on likes and reposts alone, while Threads is a **conversation-velocity** engine that treats replies as the primary currency.

The feed is not chronological. Every candidate post is scored on predicted value, so behavior shifts every few months as the model is retuned ([Postory, 2026](https://postory.io/blog/threads-algorithm)).

**The ranking signals, in rough order of weight:** reply engagement, follow probability, profile clicks, like likelihood, scroll-past likelihood, and engagement velocity as a multiplier across all of them. Reply engagement and follow probability sit at the top because they are the hardest to fake and the strongest predictors of long-term value ([Postory, 2026](https://postory.io/blog/threads-algorithm), synthesizing Meta's transparency disclosures).

**Two structural facts that change the strategy:**

1. **The first 30–60 minutes set the ceiling, permanently.** The system evaluates early engagement to decide distribution and does not revisit the post afterward, no matter how good it is ([SocialPilot, 2026](https://www.socialpilot.co/blog/instagram-threads-algorithm)). A post that earns 20 replies in the first hour is distributed far more aggressively than one earning 20 replies over a day.
2. **Cold reach is getting harder.** Adam Mosseri stated publicly (November 2024) that ranking was being rebalanced toward accounts you follow and away from recommendations from accounts you don't. Meta is also down-ranking engagement-bait replies such as "nice post" and emoji-only comments. The durable strategy is a small base of regulars who reliably reply, not viral lottery tickets.

**The platform explicitly rewards human voice over brand voice.** Reply depth, velocity, and follow-through all favor content that reads as a person talking. Polished brand captions and announcement-style updates are structurally less likely to start conversations, so they get less reach. This is the one platform where the anti-AI-artifact rules are not merely stylistic hygiene; violating them costs measurable distribution.

Platform-wide median engagement rate is around **6.25%**, versus roughly **3.6%** on X ([WebFX, 2025](https://www.socialpilot.co/blog/instagram-threads-algorithm)). Engagement is cheaper here than on X, but it must be conversational engagement.

### Threads content types

| Type | Use case | Structure |
|------|----------|-----------|
| **Opinion / take** | The highest-performing shape. A position someone could disagree with | 1–3 short paragraphs, 500-char limit. State the claim, own it, stop |
| **Process / behind-the-scenes** | Building in public. What you tried, what broke | Concrete and specific. A number or a failure, not a status update |
| **Open question** | Deliberate reply generation. Must be a real question you want answered | One question. No preamble. Never a question you already answered in the post |
| **Short teaching** | A single non-obvious thing you know | One idea. If it needs a numbered list, it belongs somewhere else |
| **Reply on someone else's post** | Underrated. Often better ROI than your own posts | Substantive, specific, adds something. Not "great point" |
| **Thread (multi-post)** | Only when one idea genuinely needs sequencing | Use sparingly. No "🧵" marker, no X-style thread performance |

### Threads post structure

Apply the Universal Platform Format with these deltas:

```
POST (500 character limit)
  — There is no hook/body/CTA anatomy at this length. There is one idea, said well.
  — Open with the claim or the scene. No setup, no "Let's talk about..."
  — Conversational register. Contractions. Write it the way you'd say it.
  — Specificity is the whole substitute for length: a number, a tool, a place.
  — Links are deprioritized. If you must include one, put it in a reply, not the post.

WHAT MAKES IT REPLYABLE (this is the actual craft on Threads)
  — Leave a genuine opening: an unresolved tradeoff, a position someone can push
    back on, a question you actually don't know the answer to.
  — A post that closes every loop gets likes. A post that leaves one open gets
    replies, and replies are what the algorithm pays for.
  — Do NOT manufacture this with engagement bait. Meta down-ranks bait replies,
    so "Agree?" and "Tag someone who..." now cost you reach.

NO CTA IN THE USUAL SENSE
  — No "link in bio", no "DM me", no "follow for more".
  — The conversion path is: post → reply exchange → profile click → follow.
    Profile clicks are a ranking signal, so the profile does the selling.
```

### Threads-specific quality rules

1. **Post only when you can be present for the next 60–90 minutes.** Because the early window is permanent and creator replies produce roughly a **42% engagement lift**, the highest lift of any platform, scheduling into dead hours actively wastes the post. This is the single most important operational rule on Threads.
2. **Spend more time replying than posting.** If you have 30 minutes, spend 20 replying thoughtfully on other people's posts and 10 on your own. Replies build the base of regulars that survives the shift away from cold recommendation reach.
3. **Reply to every reply on your own post, fast.** Reply-to-reply depth is a tracked signal. Your presence inside the thread is what compounds it.
4. **Stay in a niche while the model learns you.** Consistent topical posting lets Meta categorize the account. Expect roughly **30–45 days** of consistent posting before a clear step-change in distribution; the first two weeks feel slow and that is normal.
5. **Watch non-follower reach percentage.** If it is not climbing, the posts are not structurally earning replies, regardless of like counts.
6. **Keep it text-first.** Link-heavy and overtly promotional posts are explicitly deprioritized.
7. **Vary the mix.** One practitioner breakdown suggests roughly 40% opinion, 30% process, 20% short teaching, 10% direct questions ([Monolit, 2026](https://monolit.sh/blog/threads-algorithm-2026-how-it-works-founders-beat-it)). Treat the ratio as a starting shape, not a law. A one-dimensional account is read as a broadcast account.

### Threads anti-patterns (DO NOT)

- Port LinkedIn thought-leadership cadence over. Formality is penalized here
- Use the "🧵" thread marker or X-style thread performance
- Use engagement bait ("Agree?", "Tag someone who…", "Drop a 🙌"). Meta down-ranks bait replies, so this now costs reach
- Schedule posts into hours when you cannot reply. The window does not reopen
- Post links in the main post
- Write announcement-style brand copy ("We're excited to share…")
- Post more than once or twice a day. A newer post suppresses the older one before it can accumulate replies
- Post fewer than twice a week. Momentum never builds
- Chase cold viral reach as the primary strategy. Ranking has moved toward followed accounts
- Cross-post an Instagram caption. Threads is text-native; caption conventions read as off-platform

### Threads cadence and timing

**Cadence: sources disagree, so treat this as a range and let your own reply rate settle it.** Postory puts the 2026 sweet spot at **2–5 posts per week** plus daily replies on other people's posts, aligning with Meta's own `@creators` guidance. Monolit puts it at **5–7 per week** for founders. Both agree on the boundaries: below 2–3 per week momentum never builds, and above roughly 10 per week with thin content the account is flagged as a broadcast account and throttled.

Start at 3 per week with daily replies. Increase only if you can hold the 60–90 minute presence window for each post, since an unattended post is worth less than no post.

**Timing:** post 10–15 minutes before a known high-activity window for your audience, then be present. There is no universal best hour; presence matters more than the clock.

### Interaction with the channel plan

Threads is a **conversation and relationship channel**, not a lead-generation surface. Its cost is not writing time, it is the 60–90 minute presence window per post, which competes directly with pipeline work. Before recommending it, check `.work.biz/strategy/channel-plan.md`. If Threads is not a sanctioned channel, say so and point at `@biz-strategy amend`. For any project whose channel plan puts pipeline work ahead of content work, Threads is a poor fit: it is the most attention-expensive platform per post in this skill.

---

## Research methods

When running `@content-social research threads`, use these methods:

| Method | How to execute |
|--------|---------------|
| **Reply-shape mining** | Find the 10 highest-reply posts in the niche and read the *replies*, not the posts. Identify what structural opening invited them: an unresolved tradeoff, a contrarian claim, a real question. Shape is portable across topics; wording is not |
| **Regulars mapping** | Identify 15–30 accounts in the niche who reliably reply to others. These are the base worth building, since ranking now favors followed accounts over cold recommendation |
| **Velocity observation** | Watch a handful of niche posts over their first hour. Note how fast replies arrive and whether the author is present. This calibrates a realistic expectation for your own window |
| **Bait audit** | Collect examples of posts that got likes but no replies. Nearly all will be closed-loop posts or bait. Use them as a negative template |
| **Cross-platform delta** | Take three of the project's best LinkedIn posts and diagnose why each would fail on Threads as written. The recurring failure mode is the delta to correct in future drafts |
| **Own non-follower reach** | If the project already posts, pull non-follower reach percentage per post. Rising means the structure earns replies; flat means it does not, regardless of likes |
