# HANDOFF — Session Bookmark

> **Date:** 2026-07-13 — Session closed
> **Status:** Content quality rules hardened after underperforming LinkedIn post. Two commits pushed: LinkedIn anti-generic gates + em-dash/AI-artifact ban across content skills.

---

## Session summary (2026-07-13, close)

| Step | Status |
|------|--------|
| Analyze underperforming LinkedIn post `post_01_the_spreadsheet_nobody_owns` | Done |
| Identify skill-rule gaps (generic hook, hidden framework, AI cadence, weak CTA) | Done |
| Patch `skills/content-writing/skill.md` — stricter LinkedIn quality gates, pre-delivery self-criticism | Done |
| Harden `standards/20260621-CONTENT-STANDARD.md` — zero em-dashes/en-dashes, human-voice rules, expanded red flags | Done |
| Patch `skills/content-social/skill.md` + `platforms/linkedin.md` — enforce same human-voice bar | Done |
| Commit and push both rule updates | Done |

---

## Pending for next session

| # | Task | Priority |
|---|------|----------|
| 1 | Regenerate `.tmp/*.skill` archives — include platform split + `biz-youtube` + new content rules | Medium |
| 2 | Populate `.work.biz/strategy/*` for host project | Medium |
| 3 | Test revised `content-writing` skill against a new LinkedIn draft and measure engagement | Medium |
| 4 | Cite or label Unverified market stats in biz-brand/biz-youtube | Low |
| 5 | Delete or refresh `.work.biz/touch-scope` when not in a scoped edit session | Low |

---

## Key decisions (locked in)

| # | Decision |
|---|----------|
| 1 | **Platform guides** live under `skills/content-social/platforms/` — loaded on demand, not inlined in `skill.md`. |
| 2 | **Topic buckets** canonical in `concepts/content-topic-buckets/` — referenced by content-writing, biz-content, biz-youtube. |
| 3 | **LinkedIn video** — `@content-social write linkedin video`; deep rules in `platforms/linkedin-video.md`. |
| 4 | **Anti-AI-artifact** — binding in Content Standard; scan required before content delivery. |
| 5 | **Zero em-dashes/en-dashes** in all generated content. Use periods, commas, colons, or parentheses instead. |
| 6 | **Human voice over literary voice** — contractions allowed, sentence length varied, minor roughness preferred to polished perfection. |
| 7 | **Actionable frameworks belong in the post body or a carousel**, not hidden in the first comment. |
| 8 | Four-tier content: `content-writing` → `content-social` → `biz-content` / `biz-youtube`. |
| 9 | Strategy artifacts in `.work.biz/strategy/` only. |
| 10 | `.work.biz/touch-scope` is session-local — declare before scoped edits; not required in git. |

---

## Quick reference

| Need to... | Read / Run |
|------------|-----------|
| What to do next | `.work.biz/plans/NEXT.md` |
| LinkedIn video | `skills/content-social/platforms/linkedin-video.md` |
| Platform guides | `skills/content-social/platforms/` |
| Content quality bar | `standards/20260621-CONTENT-STANDARD.md` |
| LinkedIn text/carousel rules | `skills/content-writing/skill.md` § LinkedIn post |
