# HANDOFF — Session Bookmark

> **Date:** 2026-07-21 — Session closed
> **Status:** Strategy lifecycle + content status tracking hardened. Gate self-checks on branded/pricing/content skills; `biz-strategy amend`; `CONTENT_STATUS` bootstrap template. Committed and pushed.

---

## Session summary (2026-07-21, close)

| Step | Status |
|------|--------|
| Canonical strategy path conventions clarified (`strategy/` flat names; `plans/strategy_*.md` historical only) | Done |
| Add `biz-strategy amend` + `strategy/changelog.md` + audience hierarchy + out-of-tree fold-in | Done |
| Gate pre-check (strategy-ready via `gates.md`) on biz-brand, biz-pricing, biz-content | Done |
| biz-review weekly drift check (stale cert, out-of-tree strategy, CONTENT_STATUS) | Done |
| content-social quality gates: buyer/offer/freshness vs strategy | Done |
| `CONTENT_STATUS.md` template + bootstrap wiring (biz-bootstrap + bootstrap.sh) | Done |
| Document gated-skill self-verify in SKILL_DEPENDENCIES; list `amend` in skills/README | Done |
| Commit and push | Done |

---

## Pending for next session

| # | Task | Priority |
|---|------|----------|
| 1 | Regenerate `.tmp/*.skill` archives — include amend, gate pre-checks, CONTENT_STATUS, quality rules | Medium |
| 2 | Populate `.work.biz/strategy/*` for host project | Medium |
| 3 | Test revised `content-writing` skill against a new LinkedIn draft and measure engagement | Medium |
| 4 | Smoke-test `@biz-strategy amend` + re-certify path on a host with out-of-tree positioning docs | Medium |
| 5 | Cite or label Unverified market stats in biz-brand/biz-youtube | Low |
| 6 | Delete or refresh `.work.biz/touch-scope` when not in a scoped edit session | Low |

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
| 9 | Strategy artifacts in `.work.biz/strategy/` only. `plans/strategy_*.md` are historical/ad-hoc; on conflict, `strategy/` wins. |
| 10 | `.work.biz/touch-scope` is session-local — declare before scoped edits; not required in git. |
| 11 | **`biz-strategy amend`** records mid-cycle strategy changes + changelog; never certifies — re-certify required before gated work. |
| 12 | **Audience hierarchy** — primary (sharpness-tested) + secondary + opportunistic; static profile must respect the fork. |
| 13 | Gated skills (brand, pricing, content publish/plan/challenge) **self-check** `gates.md` strategy-ready; director gate is second layer. |
| 14 | **`CONTENT_STATUS.md`** is the canonical publish/status tracker; bootstrap creates it; publish flows update it. |

---

## Quick reference

| Need to... | Read / Run |
|------------|-----------|
| What to do next | `.work.biz/plans/NEXT.md` |
| LinkedIn video | `skills/content-social/platforms/linkedin-video.md` |
| Platform guides | `skills/content-social/platforms/` |
| Content quality bar | `standards/20260621-CONTENT-STANDARD.md` |
| LinkedIn text/carousel rules | `skills/content-writing/skill.md` § LinkedIn post |
| Strategy change mid-cycle | `@biz-strategy amend` then `@biz-strategy certify` |
| Publish status tracker | `.work.biz/reference/CONTENT_STATUS.md` |
