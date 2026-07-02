# HANDOFF — Session Bookmark

> **Date:** 2026-07-02 — Session closed
> **Status:** Removed tools-project integration from `.ai.biz`; `.ai` parent project now owns all integration

---

## Current session

| Step | Status |
|------|--------|
| Delete `skills/biz-project-query-setup/` (skill.md + reference.md, 481 lines) | Done |
| Remove `biz-project-query-setup` row from `.cursorrules` skills table | Done |
| Remove `biz-project-query-setup` row from `skills/README.md` registered skills table | Done |
| Verify zero remaining references across the project | Done |

---

## Pending for next session

| # | Task | Priority |
|---|------|----------|
| 1 | Regenerate `.tmp/*.skill` archives to include new `content-social` skill | Medium |
| 2 | Update `.cursorrules` Skills table to include `content-social` (currently auto-reads from skills/README.md but the static table is for human reference) | Low |
| 3 | Verify `scripts/framework-verify.sh` count matches (now 21 skills) | Medium |
| 4 | Update `CHANGELOG.md` and `START_HERE.md` to reflect new content-social entry point | Low |
| 5 | Populate `.work.biz/strategy/*` for host project so platform skills load real context | Medium |
| 6 | Create Reddit-specific content examples or test posts for validation | Low |

---

## Key decisions (locked in)

| # | Decision |
|---|----------|
| 1 | `content-social` is a **single unified skill** (not 4 separate skills) — shared context loading, cross-platform strategy, follows `content-writing` pattern. |
| 2 | Community/group finding stays in `biz-community` (enhanced with deep platform discovery). Content generation is in `content-social`. |
| 3 | `content-social` is **gate-exempt** for write/research/repurpose modes (like content-writing, business-ideas). Strategy/plan modes require strategy-ready. |
| 4 | **Three-tier content architecture:** `content-writing` (craft) → `content-social` (platform-adapt) → `biz-content` (LinkedIn ops). `biz-community` handles discovery + engagement across all tiers. |
| 5 | `research` mode added as a first-class operation — surfaces trending topics, content gaps, competitor patterns per platform before writing. |
| 6 | **tools-project integration moves to `.ai` parent.** `.ai.biz` no longer carries `biz-project-query-setup` — the sister `.ai` project handles all tools-project MCP registration, key setup, and connectivity from now on. |

---

## Quick reference

| Need to... | Read / Run |
|------------|-----------|
| What to do next | This file — Pending section |
| Active iteration | `.work.biz/plans/NEXT.md` |
| Open questions | `.work.biz/plans/UNKNOWNS.md` |
| Pipeline status | `.work.biz/pipeline/pipeline_tracker.md` |
| New skills | `skills/content-social/skill.md` |
| Enhanced skills | `skills/biz-community/skill.md` |
