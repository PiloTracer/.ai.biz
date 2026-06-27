# HANDOFF — Session Bookmark

> **Date:** 2026-06-26 — Session status
> **Status:** Added 3 project-aware generative skills; integrated across framework

---

## Current session

| Step | Status |
|------|--------|
| Create `@content-writing` skill (craft of writing; project-aware, technology-tilted) | Done |
| Create `@business-ideas` skill (structured ideation; archetypes + assumption ledger) | Done |
| Create `@product-service-ideas` skill (buildable concepts + MVP scoping) | Done |
| Bundle `references/project-context.example.md` fallback profile in each | Done |
| Register skills in `.cursorrules`, `templates/cursorrules.template`, `README.md`, `skills/README.md`, `SKILL_DEPENDENCIES.md`, `PROCESS_ROUTER.md`, `START_HERE.md`, `CHANGELOG.md` | Done |
| Make `@biz-director` fully aware: intent rows + gate-exempt table + content route de-ambiguation | Done |
| Regenerate `.tmp/*.skill` archives to match shipped skills | Done |
| Fix `scripts/framework-verify.sh` to count generative skills; correct README count (20) | Done |
| Verify `framework-verify.sh` passes (Skills 20 / registered 20) | Done |

---

## Pending for next session

| # | Task | Priority |
|---|------|----------|
| 1 | Verify `.cursorrules` REPLACE tokens are filled for real adopter projects | Medium |
| 2 | Consider adding `.ai.biz/context/README.md` pointer for consistency with `.ai` / `.ai.ui` | Low |
| 3 | Populate `.work.biz/strategy/*` for LogicBison so the new skills load real context instead of the example fallback | Medium |
| 4 | Optional: add a `concepts/` entry for "generative ideation" to mirror the new skills | Low |

---

## Key decisions (locked in)

| # | Decision |
|---|----------|
| 1 | Generative skills (`content-writing`, `business-ideas`, `product-service-ideas`) are **gate-exempt** — run any time, even pre-bootstrap; load host project context dynamically, fall back to bundled example. |
| 2 | `content-writing` owns the *craft* of writing; `biz-content` owns *publishing ops*. They compose: draft → publish/track. biz-director disambiguation note added. |
| 3 | Every generative skill enforces a "technology tilt" gate so output is always tech-grounded, not generic filler. |
| 4 | Portable archives live in `.tmp/` (gitignored scratch); canonical source is `skills/`. |

---

## Quick reference

| Need to... | Read / Run |
|------------|-----------|
| What to do next | This file — Pending section |
| Active iteration | `.work.biz/plans/NEXT.md` |
| Open questions | `.work.biz/plans/UNKNOWNS.md` |
| Pipeline status | `.work.biz/pipeline/pipeline_tracker.md` |
| New skills | `skills/{content-writing,business-ideas,product-service-ideas}/skill.md` |