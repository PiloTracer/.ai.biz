---
name: biz-review
description: >-
  Weekly and quarterly business review. Assess pipeline, content performance,
  and overall business health. biz-review weekly, biz-review quarterly, biz-review status.
---

# biz-review

**Purpose:** Regular structured review prevents drift. Weekly = tactical. Quarterly = strategic.

---

## I0 — Status mode (read-only)

`@biz-review status` confirms the current Business OS readiness state.

| State | Evidence to check |
|-------|-------------------|
| strategy-ready | `.work.biz/strategy/certification.md` exists and passes internal gate |
| brand-ready | LinkedIn/website audit shows offer + proof + CTA are clear |
| pipeline-ready | Pricing documented in `.work.biz/strategy/pricing.md`, pipeline tracker configured, outreach cadence documented in `.work.biz/pipeline/outreach-cadence.md` |
| sales-ready | Discovery process verified, proposal template ready |

Output: a short report of which states are met and what is missing.

---

## I1 — Weekly review (30 min)

### Pull numbers

| Metric | Source | Target |
|--------|--------|--------|
| Posts published | Content tracker | Per content plan |
| Impressions | LinkedIn / blog analytics | Growing week-over-week |
| Inbounds | Pipeline tracker | 3-5 / week |
| Conversations started | Pipeline tracker | 5+ / week |
| Pipeline value | Pipeline tracker | 3x monthly goal |
| Closed this week | Revenue tracker | Per target |

### Pipeline health score

Score each stage 0 (blocked) → 5 (healthy):

| Stage | Score (0-5) | Notes |
|-------|-------------|-------|
| Awareness | | Are people seeing you? |
| Interest | | Are people engaging? |
| Trust | | Are people in conversation? |
| Decision | | Are proposals closing? |

**Total:** ____ / 20. Below 12 means the bottleneck stage needs your ONE change.

### Identify bottleneck

1. Find lowest score above.
2. Trace cause: too few posts? Weak CTA? No follow-up?
3. **Decide ONE change** for next week. Only ONE.

### Drift check (2 min)

1. Compare dates: any file under `.work.biz/strategy/` newer than `strategy/certification.md` -> flag "strategy changed since certification; run @biz-strategy certify".
2. Glob for strategy-bearing files outside `strategy/` (`ideas/positioning_*.md`, `plans/strategy_*.md`) -> flag "out-of-tree strategy docs; run @biz-strategy amend".
3. If anything was published this week, confirm `.work.biz/reference/CONTENT_STATUS.md` was updated.

Render findings as a short "Drift check" block in the review output (or "clean" if nothing found).

---

## I2 — Quarterly review (2 hrs)

### Retrospective questions

- What worked that I should double down on?
- What didn't work that I should stop?
- What did I say I'd do that I didn't? Why?
- What changed in the market / my niche?

### Revenue analysis

| Channel | Rev this Q | Rev prev Q | Trend | Cost (time + $) | ROI |
|---------|-----------|-----------|-------|-----------------|-----|
| LinkedIn content | | | | | |
| Community engagement | | | | | |
| Referrals | | | | | |
| Cold outreach | | | | | |
| Other | | | | | |

### Channel effectiveness

- **Which channel delivered the highest ROI?** → Allocate more time.
- **Which channel consumed time but delivered little?** → Reduce or kill.
- **Which channel is new/unproven?** → Test with small experiment (see `@biz-market-validate`).

### Set next quarter's focus

- One primary growth channel
- One experiment channel
- Revenue target
- Content volume commitment

---

## I3 — Data source

All numbers come from your **pipeline tracker** (a spreadsheet, CRM, or `.ai.biz/` tracker file). If data isn't tracked, the first action is: *set up tracking for next week.*

---

## Completion

| # | Check | Result |
|---|-------|--------|
| 1 | Weekly: all numbers pulled and recorded | |
| 2 | Weekly: bottleneck identified, ONE change set | |
| 3 | Quarterly: retrospective answers written | |
| 4 | Quarterly: channel effectiveness scored | |
| 5 | Quarterly: next quarter focus documented | |

**Next:** `@biz-pipeline-diagnosis run` — deep-dive on the bottleneck you identified.
