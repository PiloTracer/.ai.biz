# NEXT — Tactical Next Actions

## Current Phase

| Phase | Status |
|-------|--------|
| Strategy | Pending (host project); framework amend + gate self-checks shipped |
| Brand | Pending (gated on strategy-ready) |
| Pipeline | Pending |
| Sales | Pending |
| Execution | Multi-platform content layer: canonical voice profile, 9 platform guides, per-platform ops trackers, graded claims, voice convergence |

## Recommended next

1. **Implement the verbs three skills advertise but never define** — `biz-market-validate`, `biz-pipeline-diagnosis`, `biz-referrals`. Highest-value remaining framework defect: the router sends work to a verb with no workflow, so the agent improvises silently.
2. **Owner review of the uncommitted `future-strategy` changes** — VOICE_PROFILE migration, channel-plan Substack correction, VOICE_STANDARD refactor. Left deliberately uncommitted.
3. **Fix `blast-radius-check.sh` to diff staged content** rather than the whole working tree against `HEAD`, which currently makes the scoped-commit workflow it enforces impossible to follow.
4. **Regenerate `.tmp/*.skill` archives** — now also missing voice profile, Substack/Threads, reconcile, platform tracker.

## Active tasks

| # | Task | Status | Notes |
|---|------|--------|-------|
| 1 | Implement verb dispatch in biz-market-validate / biz-pipeline-diagnosis / biz-referrals | Pending | Advertised verbs have no mode sections. Same class as the `content-social status` gap closed 2026-07-30 |
| 2 | Owner review of uncommitted `future-strategy` changes | Pending | Consumer repo; four files touched |
| 3 | Source or de-claim remaining unsourced stats | Pending | `biz-referrals` "5-8x"; check biz-brand, biz-youtube. `biz-strategy` done 2026-07-30 |
| 4 | Fix `blast-radius-check.sh` to measure staged content | Pending | Currently blocks its own prescribed workflow; worked around with `--warn-only` |
| 5 | Validate Substack + Threads guides against real published output | Pending | Both untested; no project has published to either |
| 6 | Regenerate `.tmp/*.skill` archives | Pending | Include voice profile, Substack/Threads, reconcile, platform tracker, graded claims |
| 7 | Smoke-test `@biz-strategy amend` + re-certify | Pending | Fold out-of-tree docs; confirm changelog + stale NEXT flags |
| 8 | Verify REPLACE tokens filled for adopter projects | Pending | Pre-existing carry-over |
| 9 | Validate hardened content rules with a live LinkedIn draft | Pending | Compare hook/engagement to `post_01_the_spreadsheet_nobody_owns` |

## Recently completed

| # | What was done | Date |
|---|---------------|------|
| 1 | Canonical VOICE_PROFILE + VOICE_RETRO; Substack + Threads guides; `@content-social status`; per-platform tracker; `@biz-strategy reconcile`; graded claims; gate-parser fixes; bootstrap/deploy manifest sync; 8 consistency fixes | 2026-07-30 |
| 2 | Strategy amend mode + audience hierarchy + path conventions; gate self-checks on brand/pricing/content; biz-review drift; CONTENT_STATUS template + bootstrap | 2026-07-21 |
| 2 | Harden anti-em-dash and anti-AI-artifact rules across content skills (Content Standard + content-writing + content-social + linkedin platform guide) | 2026-07-13 |
| 3 | Tighten LinkedIn quality gates in `content-writing` skill (specific hook, stakes, credibility, no hidden frameworks) | 2026-07-13 |
| 4 | LinkedIn native video mentor guide + skill integration (`platforms/linkedin-video.md`) | 2026-07-09 |
| 5 | Anti-AI-artifact rules in Content Standard + content skill checklists | 2026-07-09 |
| 6 | Split content-social into platform guides; canonical topic buckets (BIZ-09) | 2026-07-09 |
