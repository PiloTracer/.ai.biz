---
name: biz-review
description: >-
  Weekly and quarterly business review. Assess pipeline, content performance,
  and overall business health. biz-review weekly, biz-review quarterly, biz-review status.
---

# biz-review

**Purpose:** Regular structured review prevents drift. Weekly = tactical. Quarterly = strategic.

---

## I0 — Status mode (reconciles the gate ledger)

`@biz-review status` is the reconciler for `{WORK_BUSINESS_ROOT}/gates.md`. It checks every gate's evidence against what the ledger claims, and it is the only skill allowed to promote `pipeline-ready`.

| State | Promoted by | Evidence to check |
|-------|-------------|-------------------|
| strategy-ready | `@biz-strategy certify` | `.work.biz/strategy/certification.md` exists, and nothing under `strategy/` is newer than it |
| brand-ready | `@biz-brand overhaul` | `.work.biz/reference/BRAND_STATUS.md` has an overhaul log entry with a passing five-second test |
| pipeline-ready | **this skill** | `.work.biz/strategy/pricing.md`, `.work.biz/pipeline/pipeline_tracker.md` (configured, not an empty template), and `.work.biz/pipeline/outreach-cadence.md` all exist and are filled in |
| sales-ready | `@biz-discovery run` | Pipeline tracker has at least one completed discovery call logged with BANT captured |
| active-deal | `@biz-discovery run` / `@biz-proposal write` | Pipeline tracker has a deal at Conversation stage or later |

### Reconciliation steps

1. **Read** `{WORK_BUSINESS_ROOT}/gates.md`. If it is missing, create it from `templates/work/gates.md.template` with every gate at `NOT MET`, then continue.
2. **Verify each PASS claim** against the evidence above. Any gate claiming PASS without its evidence on disk is **demoted** to `NOT MET` and reported as drift — never leave a PASS you could not substantiate.
3. **Promote `pipeline-ready`** when all three of its evidence artifacts exist and are filled in, and `strategy-ready` is PASS. Replace the section in place, leaving other gates untouched:

```markdown
## pipeline-ready
**Status:** PASS
**Certified:** {date}
**By:** @biz-review status
**Evidence:** `.work.biz/strategy/pricing.md`, `.work.biz/pipeline/pipeline_tracker.md`, `.work.biz/pipeline/outreach-cadence.md`
**Next gate:** sales-ready — run `@biz-discovery prepare` then `@biz-discovery run`
```

4. **Do not promote any other gate.** Report what is missing and name the skill that owns it.

Output: a short report of which states are met, which were demoted and why, and the single next command.

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
4. Run the I0 reconciliation against `{WORK_BUSINESS_ROOT}/gates.md` -> flag any gate claiming PASS without evidence, and demote it.

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
| 6 | Gate ledger reconciled — every PASS in `.work.biz/gates.md` has its evidence on disk | |

**Next:** `@biz-pipeline-diagnosis run` — deep-dive on the bottleneck you identified.
