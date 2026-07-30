## R7 — Substack Content

### Substack fundamentals

Substack is not a social platform with a newsletter attached. It is an owned email list with a discovery network bolted on, and the two behave differently. Email is the asset: it reaches the inbox regardless of any algorithm. The in-app network (Notes, recommendations, the feed) is the acquisition funnel that fills it.

That distinction drives every rule below. On LinkedIn you are renting attention. On Substack you are converting rented attention into a list you keep.

**The network is the growth engine, not your posting volume.** Substack states that its recommendations system and apps drive roughly **50% of new free subscriptions and 25% of new paid subscriptions** platform-wide, and network-driven discovery accounts for roughly **60% of overall platform growth** ([Substack via Hamish McKenzie, summarized 2026](https://365247esp.substack.com/p/substack-the-creator-economys-quiet); [growth mechanics analysis 2026](https://research.mental-momentum.ai/r/substack-algorithm-discovery-growth-rz6bj5)). Recommendations from other publications, not your own output, are the top of the funnel.

**The mechanism is audience overlap.** When a reader subscribes to two publications, the platform maps an intersection between those audiences and uses the resulting graph to surface each to the other's readers. Retrieval moved to a sequential model through 2025 and now reads a reader's current session momentum rather than a static taste profile ([Substack engineering, 2026](https://mrkcohen.substack.com/p/how-the-substack-feed-is-learning)). Practical consequence: being genuinely adjacent to a few well-matched publications beats being vaguely interesting to everyone.

### The surface economics (this decides where you spend effort)

An analysis of 2.9M posts and 14.5M Notes found the two surfaces moving in opposite directions ([The Writing Edge, 2026](https://thewritingedge.substack.com/p/i-analyzed-145-million-notes-and)):

| Surface | Volume trend | Attention trend | Verdict |
|---------|--------------|-----------------|---------|
| **Long-form posts** | +49% YoY | Reactions +80% YoY | Attention is outrunning supply. Each post earns *more* every year |
| **Notes** | +47% YoY | Avg likes/note fell 22.5 → 18.8 (−16%) | Supply is outrunning attention. Each note earns *less* every year |

**Rule: weight long-form, use Notes as a funnel.** Notes are for discovery, never the destination. Every note should have a job: move a reader toward the asset that compounds. Do not build a Substack strategy on Notes volume; that surface is deflating.

### Conversion benchmarks

- **Paid conversion, platform median: ~3%** of free subscribers. Promotional material citing 5–10% describes high performers, not the norm ([2026 longitudinal analysis](https://research.mental-momentum.ai/r/substack-algorithm-discovery-growth-rz6bj5)).
- **Notes-sourced subscribers convert lower, 2–3%**, because they arrive as casual browsers rather than high-intent readers.
- **Substack takes 10%** of paid revenue. Model that into any pricing math.

Do the arithmetic before recommending Substack as a revenue channel. At a 3% paid conversion and a $8/month price, a 1,000-subscriber list is roughly $240/month gross before the 10% cut. For a project whose engagements are priced in the tens of thousands, Substack is an authority and relationship surface whose value is the conversations it starts, not the subscription revenue. Say that plainly rather than implying newsletter income.

### Substack content types

| Type | Use case | Structure |
|------|----------|-----------|
| **Long-form post** | The compounding asset. Deep dive, war story, teardown, forensic analysis | Title + subtitle + narrative body. 700–2,000 words. This is where the returns are |
| **Short post / dispatch** | A single idea that deserves the inbox but not 1,500 words | 400–700 words. One idea, one scene, one lesson |
| **Note (original)** | Discovery. A thought, an observation, a question | 1–3 short paragraphs. Must stand alone; no "read more in my post" as the only content |
| **Note (restack + commentary)** | The growth lever. Bridges your audience to another's | Substantive addition, not "great piece!" See the restack rules below |
| **Thread / comment reply** | Relationship building inside other publications' comment sections | Same discipline as a Reddit comment: specific, generous, no pitch |

### Substack post structure

Apply the Universal Platform Format with these deltas:

```
SUBJECT LINE / TITLE (the whole game for open rate)
  — Describe the idea, not the format. "Thoughts on AI, part 3" describes the format.
  — Specificity beats intrigue. A number, a place, a named failure.
  — No "Welcome back to another edition of..."
  — Good: "The 4,900-rule tax engine that took down a payroll run"
  — Bad: "Some reflections on complexity in enterprise systems"

SUBTITLE (the second hook, shown in the feed and the inbox preview)
  — Do not restate the title. Add the stake or the tension.
  — This is the highest-leverage underused field on the platform.

OPENING (no preamble, no housekeeping)
  — Start in the scene or in the problem. A year, a place, a tool, a number.
  — Do NOT open with an issue number, a greeting, or a recap of last week.
  — Housekeeping, if any, goes at the end.

BODY
  — Narrative first. Substack readers chose to read; they will follow prose.
  — This is the one platform where bullet-point compression is a downgrade.
  — One subheading every 300-400 words at most. Plain-text section titles read
    more human than markdown headings inside narrative prose.
  — At least one specific, verifiable proof point: a number, a tradeoff, a failure.

ENDING
  — End on the point. No "In conclusion", no "To sum up", no summary of what
    you just said.
  — One question or one invitation, not both.

SUBSCRIBE / PAID CTA
  — Bottom, once. A mid-article subscribe interruption is only acceptable in
    pieces long enough that a reader needs a resting point.
  — Never in the first third.
```

### Substack-specific quality rules

1. **Fixed cadence beats big hits.** The data rewards the writer who shows up weekly over the one hunting one viral piece. Pick a cadence you can hold for six months and publish on it.
2. **Restack with perspective; that is the growth lever.** Publications that actively restack others *with substantive commentary* grow 2–3x faster than those posting only original Notes. Bare reshares do nothing.
3. **Rotate who you restack.** The algorithm applies a saturation penalty to closed loops. Restacking the same five friends repeatedly is read as a closed circle, not genuine discovery. Reciprocal engagement pods are actively penalized.
4. **Measure subscribers per Note, not likes per Note.** One tracked test found story-shaped Notes brought 8x more subscribers than tip-shaped Notes despite getting 3x fewer likes ([Notes algorithm analysis 2026](https://medium.com/codetodeploy/cracking-the-code-how-substack-notes-algorithm-actually-rewards-creators-in-2026-27eac09e3285)). Likes are the vanity metric here; the algorithm itself weights conversion probability.
5. **Recommendations are the highest-leverage thing you can ask for.** A handful of well-matched publications recommending you outperforms months of posting. Earn them by being genuinely useful in their comments and Notes first, then ask directly. Never open with the ask.
6. **Niche consistency feeds the overlap graph.** Erratic topic-hopping prevents the audience-overlap engine from placing you. Consistent niche content converts better than viral hot takes that draw the wrong readers.
7. **Own the list.** Export subscribers periodically. The email list is the asset that survives a platform change; the follower count is not.
8. **Long-form is the compounding asset.** If you have limited hours, one strong long-form piece beats five Notes.

### Substack anti-patterns (DO NOT)

- Open with "Welcome back to another edition of…" or an issue number
- Title a piece by its format ("Part 3", "Weekly roundup") instead of its idea
- Put a sign-off block or byline inside the prose; that belongs on the platform
- Treat Notes as the product. It is the funnel, and its per-note attention is deflating 16% a year
- Bare-restack without commentary, or restack the same small circle repeatedly
- Join engagement pods or reciprocal-subscribe schemes; saturation penalties apply
- Cross-post a LinkedIn post verbatim. LinkedIn compression (short lines, hook-per-line) reads as thin on Substack, where the reader opted into depth
- Gate the piece's actual value behind the paywall while the free portion is only a teaser. That trains readers to stop opening
- Imply meaningful revenue from a small list. Run the 3% math first
- Publish and disappear. The comment section is where subscribers become relationships, and relationships are what a services business converts

### Substack cadence and timing

- **Long-form:** weekly or biweekly, on a fixed day. Consistency outranks frequency.
- **Notes:** 3–7 per week, mixing original notes and restacks-with-commentary. Skip a day rather than post filler.
- **Best send time:** Tuesday–Thursday mornings in the audience's timezone. Test against your own open rates; platform-wide advice is weaker than your own dashboard.
- **First 24 hours:** reply to every comment. Comment engagement feeds both the relationship and the feed.

### Interaction with the channel plan

Substack is a **long-horizon authority and relationship channel**. Expect 6–12 months before it produces inbound for a services business, on a similar curve to YouTube. Before recommending it, check `.work.biz/strategy/channel-plan.md`. If Substack is not a sanctioned channel there, say so and point at `@biz-strategy amend`. If the project is already producing Substack assets while the channel plan omits it, flag the drift explicitly: either the plan should be amended or the work should stop.

---

## Research methods

When running `@content-social research substack`, use these methods:

| Method | How to execute |
|--------|---------------|
| **Adjacent-publication mapping** | Identify 10–20 publications whose readers overlap the target buyer. These are recommendation and restack targets. Note their cadence, length, and paid/free split. The overlap graph is the growth engine, so this map is the highest-value research output |
| **Comment-section mining** | Read the top comment threads on the 5 most-engaged recent posts in adjacent publications. Unanswered or partially answered questions are content gaps you can own |
| **Notes reconnaissance** | Scan the Notes feed for the niche. Note which *shapes* travel (story, question, observation, contrarian take) rather than which topics, since shape is more portable |
| **Paywall-line analysis** | For paid publications in the niche, note where the paywall falls and what stays free. This calibrates a defensible free/paid split |
| **Title pattern extraction** | Collect 30 titles from high-performing posts in the niche. Extract the structural patterns, not the wording. Discard any pattern that depends on borrowed authority you do not have |
| **Own-dashboard baseline** | If the project already publishes, pull open rate, click rate, and subscriber source breakdown. Source breakdown tells you whether the network or your own promotion is doing the work, which decides where the next hour goes |
