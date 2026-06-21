---
name: biz-pipeline-diagnosis
description: >-
  Identify which funnel stage is the bottleneck and fix only that stage.
  biz-pipeline-diagnosis run, biz-pipeline-diagnosis status.
---

# biz-pipeline-diagnosis

**Purpose:** Most pipeline problems come from ONE stage. Fixing the wrong stage wastes weeks. This skill finds the real bottleneck.

---

## I0 — Funnel stages

| Stage | Definition | Signal you're here |
|-------|------------|-------------------|
| **Awareness** | People know you exist | Impressions, profile views, post reach |
| **Interest** | People engage with your content | Comments, DMs, replies, newsletter signups |
| **Trust** | People are in conversation | Discovery calls booked, multi-thread dialogue |
| **Decision** | People are evaluating your offer | Proposals sent, proposals in review, objections raised |

---

## I1 — Symptoms and root causes

### Blockage at Awareness

**Symptoms:**
- Low impressions / reach on content
- No new profile views
- Audience not growing

**Likely causes:**
- Posting too infrequently
- Wrong platform for your audience
- Content doesn't hook in first 3 lines
- No hashtags / SEO

**Fix:** Increase frequency 2x. Test one new platform. Rewrite hooks for 5 posts.

### Blockage at Interest

**Symptoms:**
- High impressions, low engagement
- No DMs or comments
- People see but don't act

**Likely causes:**
- Content is informative but not opinionated
- No call to action
- No lead magnet / conversation starter

**Fix:** Add a clear CTA to every post. Write one controversial opinion post. Offer a free resource.

### Blockage at Trust

**Symptoms:**
- DMs but no calls booked
- Conversations stall after 2-3 messages
- "Sounds interesting, let me think about it"

**Likely causes:**
- No social proof on profile
- Not demonstrating expertise in DMs
- Moving too fast to sell, too slow to build rapport

**Fix:** Add 2 testimonials to profile. Send a case study in the first DM exchange. Ask a discovery question before pitching.

### Blockage at Decision

**Symptoms:**
- Proposals sent but no closes
- Objections about price, timing, fit
- Ghosting after proposal

**Likely causes:**
- Offer isn't compelling enough
- Price too high for perceived value
- No urgency / follow-up sequence

**Fix:** Add a time-limited option. Reduce scope (not price) to lower barrier. Follow up 3x over 2 weeks.

---

## I2 — One-bottleneck-at-a-time principle

**Never fix two stages at once.** You won't know what moved the needle.

1. Pick the lowest-performing stage (based on pipeline tracker data).
2. Apply exactly one fix from the list above.
3. Run for 1-2 weeks.
4. Measure: did the metric at that stage improve?
5. If yes → hold the fix, look at next stage. If no → try a different fix for the same stage.

---

## I3 — Running the diagnosis

```
@biz-pipeline-diagnosis run
```

1. Pull your pipeline tracker numbers.
2. Calculate conversion between each stage (e.g. Awareness→Interest %).
3. The biggest drop-off is your bottleneck.
4. Apply ONE fix.
5. Record the fix and expected impact.
6. Set a review date (7 days).

---

## Completion

| # | Check | Result |
|---|-------|--------|
| 1 | Pipeline tracker populated with per-stage metrics | |
| 2 | Bottleneck stage identified (biggest drop-off) | |
| 3 | ONE fix chosen and documented | |
| 4 | Review date set | |
| 5 | Bottleneck re-checked at review | |

**Next:** `@biz-review weekly` — check if the fix moved the bottleneck.
