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

1. **Commit this session's biz-session parity changes** — skill rewrite (standalone `commit`/`commit push`, `add`, `scoped`, task-ref + active-ref, secrets scan, checklist reports) + nine routing/reference file syncs.
2. **Smoke-test the new biz-session verbs on a live target project** — standalone `commit` keeps the session open, `add` stages without committing, `close commit scoped` commits bookend files only, task-ref lands in `.work.biz/active-ref` and the commit subject.
3. **Owner review of the uncommitted `future-strategy` changes** — VOICE_PROFILE migration, channel-plan Substack correction, VOICE_STANDARD refactor. Left deliberately uncommitted.
4. **Validate the content status loop on a live target project** — publish + `@biz-social log` cycle, pillar assignment, VOICE_RETRO entry, `@biz-strategy career` to fill OPERATOR_PROFILE.md.

## Active tasks

| # | Task | Status | Notes |
|---|------|--------|-------|
| 1 | Implement verb dispatch in biz-market-validate / biz-pipeline-diagnosis / biz-referrals | Done 2026-08-06 | Status sections added to all three + biz-deploy-repo; biz-social Substack/Threads and biz-community `find x` parse gaps closed in the same sweep |
| 2 | Owner review of uncommitted `future-strategy` changes | Pending | Consumer repo; four files touched |
| 3 | Source or de-claim remaining unsourced stats | Done 2026-08-06 | `biz-referrals` 5-8x + close-rate table de-claimed; biz-brand/biz-youtube checked, their figures are cited |
| 4 | Fix `blast-radius-check.sh` to measure staged content | Done 2026-08-10 | Staged content wins when anything is staged; working-tree sweep only when nothing staged; real self-test with 4 scenarios |
| 5 | Validate Substack + Threads guides against real published output | Pending | Both untested; no project has published to either |
| 6 | Regenerate `.tmp/*.skill` archives | Pending | Include voice profile, Substack/Threads, reconcile, platform tracker, graded claims, content status protocol |
| 7 | Smoke-test `@biz-strategy amend` + re-certify | Pending | Fold out-of-tree docs; confirm changelog + stale NEXT flags |
| 8 | Verify REPLACE tokens filled for adopter projects | Pending | Pre-existing carry-over |
| 9 | Validate hardened content rules with a live LinkedIn draft | Pending | Compare hook/engagement to `post_01_the_spreadsheet_nobody_owns` |
| 10 | Fix publish/status tracking in target projects | Done 2026-08-10 | Content Status Protocol in CONVENTIONS; tracker wired into biz-writing, biz-social (+ new `log` mode), biz-content, biz-youtube; self-heal rule; framework-verify regression check |
| 11 | Validate Content Status Protocol on a live target project | Pending | Run publish + `@biz-social log` cycle end-to-end, incl. pillar assignment + VOICE_RETRO entry |
| 12 | Strategy/career/content loop: six improvements + quality hardening | Done 2026-08-10 | `@biz-review monthly` assumption re-validation; `@biz-strategy career` + OPERATOR_PROFILE; pillar column + quarterly alignment review; PROJECTS.md proof-point bank; voice loop enforcement (UNKNOWNS #10); session content pipeline brief (UNKNOWNS #9 evidence rule); appeal standard + anti-AI additions; drift-check scope narrowed to positioning files; non-tech tilt (UNKNOWNS #2); bootstrap↔WORK_FILES manifest check in framework-verify |
| 13 | Validate `@biz-strategy career` on a live project | Pending | Fill OPERATOR_PROFILE end-to-end; check the cross-check against certified strategy |
| 14 | Validate pillar loop + quarterly alignment on real tracker data | Pending | Needs a project with ≥1 quarter of publishes tagged by pillar |
| 15 | biz-session parity with Agent OS session-control | Done 2026-08-13 | Full parameter surface: standalone `commit`/`commit push` (no close), `add` (stage-only), `scoped` modifier, `start - <goal>`, unblock check, task-ref auto-detection + `.work.biz/active-ref`, secrets scan, always-shown commit messages, checklist reports; repo-role commit scope (source repo → all files repo-wide, target → `.work.biz/` only); behavior change: bare `commit`/`push` no longer imply close; routing/reference files synced |
| 16 | Smoke-test new biz-session verbs on a live project | Pending | standalone commit, add, close commit scoped, active-ref extraction; verify role detection in both a source checkout and a target project |

## Recently completed

| # | What was done | Date |
|---|---------------|------|
| 0 | biz-session brought to full parity with Agent OS session-control (standalone commit/add/scoped, task-ref + active-ref, secrets scan, checklist reports); routing surfaces synced across 9 files; gates green (blast-radius WARN acknowledged — routing sync) | 2026-08-13 |
| 0 | Content Status Protocol + `@biz-social log`; tracker read/write wired into all four content skills; self-heal rule; staged-aware `blast-radius-check.sh` with real self-test; UNKNOWNS #6 resolved; routing docs synced | 2026-08-10 |
| 0 | v0.6.0: `biz-*` skill id rename across the whole framework; 29-fix consistency sweep (deploy `--update` path doubling, phantom status verbs, Substack/Threads parse rows, one-writer active-deal, unsourced biz-referrals stats); gates green | 2026-08-06 |
| 1 | Canonical VOICE_PROFILE + VOICE_RETRO; Substack + Threads guides; `@biz-social status`; per-platform tracker; `@biz-strategy reconcile`; graded claims; gate-parser fixes; bootstrap/deploy manifest sync; 8 consistency fixes | 2026-07-30 |
| 2 | Strategy amend mode + audience hierarchy + path conventions; gate self-checks on brand/pricing/content; biz-review drift; CONTENT_STATUS template + bootstrap | 2026-07-21 |
| 2 | Harden anti-em-dash and anti-AI-artifact rules across content skills (Content Standard + biz-writing + biz-social + linkedin platform guide) | 2026-07-13 |
| 3 | Tighten LinkedIn quality gates in `biz-writing` skill (specific hook, stakes, credibility, no hidden frameworks) | 2026-07-13 |
| 4 | LinkedIn native video mentor guide + skill integration (`platforms/linkedin-video.md`) | 2026-07-09 |
| 5 | Anti-AI-artifact rules in Content Standard + content skill checklists | 2026-07-09 |
| 6 | Split biz-social into platform guides; canonical topic buckets (BIZ-09) | 2026-07-09 |
