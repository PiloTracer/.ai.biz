# HANDOFF — Session Bookmark

> **Date:** 2026-08-19
> **Status:** Closed — 2026-08-19 — homogenization changeset (Frameworks registry + sister discovery, per docs/homogenization/biz.md) verified, gap list resolved, Agent OS root check added (`../.ai` / family root, ask-user fallback); released as v0.6.1; close commit push

---

## Session summary (2026-08-19, homogenization + v0.6.1 close)

| Step | Status |
|------|--------|
| Verified uncommitted homogenization changeset against `docs/homogenization/biz.md`: sister-discovery.sh, 7-row Frameworks registry in .cursorrules + template, deploy fill, verifier cell checks, framework-verify wiring — all faithful | Done |
| Deploy smoke `/tmp/smoke-biz`: 5 sister tokens filled at deploy time, target verifier PASS | Done |
| Gap list resolved: F2 (`--self-test` present; source-repo run PASSes via new `source` layout), F1 (NEXT template has `## Next action`), stale tmp artifacts gone, `reasonix.toml` allow-list reset (rename-era one-offs) | Done |
| Agent OS root check (owner directive): `agent_os_names`/`find_agent_os_dir` in sister-discovery.sh (family root `pilo.ai.logicbison` preferred, legacy `../.ai` fallback; neither → ask the operator, never guess); template `.ai` row now `REPLACE:AI_PATH`; deploy fills it; verifier validates the filled cell (STALE = FAIL) | Done |
| Gates: framework-verify PASS (incl. new registry wiring + AI_PATH token), touch-scope PASS, gate-verify PASS (n/a), blast-radius WARN (acknowledged) | Done |
| biz.md updated: gaps marked resolved, checklist ticked | Done |
| Release v0.6.1: CHANGELOG cut, tag, GitHub release | Done |

---

## Session summary (2026-08-19, consistency audit close)

| Step | Status |
|------|--------|
| Audited today's commits (087981f, dd4531e) + framework-wide: two deep audits (skills; knowledgebase/standards/templates) + spot-checks of every finding | Done |
| Fixed contradictions/dead refs: active-deal one-writer (BUSINESS-CONVENTIONS), README 23→24, CONVENTIONS phase chain, README `strategy_*.md` path, CHANGELOG duplicate headings, false PROTECTED_SURFACES.json claim, biz-director deploy-basic routing + strategy glob, stale `.work.biz/README` + `prompts/README` | Done |
| Pricing dedup (low-risk, owner-approved): PRICING-STANDARD gains reduce-scope rule; retainer table moved to `biz-pricing` § Post-Delivery Offers; `biz-proposal` points at both | Done |
| `hooks/pre-commit` change-safety gates warn-only by default (owner request: commit/push without blockers); `GATES_ENFORCE=1` restores blocking; tracking hooks unchanged; `.cursorrules` + CHANGELOG documented | Done |
| Context budget slim: older session blocks (07-30, 07-21) moved to `HANDOFF.archive.md` | Done |
| All 14 session files committed + pushed by owner as `33f9547` | Done |
| Gates: touch-scope PASS, framework-verify PASS, gate-verify PASS (n/a) | Done |

---

## Session summary (2026-08-19, close)

| Step | Status |
|------|--------|
| Explored framework + `future-strategy` target: `ideas/` convention existed only in targets, nothing in the framework wrote or described it | Done |
| Canonized `.work.biz/ideas/<subdir>/<piece>/` + `ideas.archive/` in DIRECTORY_MAP (+ Archive rule) and CONVENTIONS (Content Status Protocol → Archive rule) | Done |
| New skill `skills/biz-archive/skill.md` (24th): `run` moves `published` pieces to `ideas.archive/` mirrored (`git mv` staged / `mv`), writes per-piece `status.md` publish record, verifies it, then removes the tracker row; `status` dry run; idempotent with catch-up; never commits/pushes/deletes | Done |
| Tracker slims to active inventory: archived rows leave CONTENT_STATUS once per-piece status.md verified; lifetime aggregates stay truthful; no centralized `ideas.archive/status.md` (owner directive) | Done |
| Context budget (CONVENTIONS): history moved never deleted — HANDOFF/NEXT/UNKNOWNS slim into sibling `*.archive.md` files; biz-session close C5/C6 performs the slim | Done |
| Bootstrap pentad: `bootstrap.sh` dir loop + `WORK_DIRS` scaffold `ideas`/`ideas.archive`; biz-bootstrap, templates/README, biz-deploy-basic docs synced | Done |
| Routing: skills/README (row + `archive` verb), biz-director (intent + gate-exempt), PROCESS_ROUTER, START_HERE, .cursorrules + template, root README (24 skills), SKILL_DEPENDENCIES (ungated utility) | Done |
| framework-verify: archive wiring block (11 greps) + new WORK_DIRS↔bootstrap.sh symmetry check | Done |
| Evidence-checked against `future-strategy` uncommitted slim-down (17 per-piece status.md, HANDOFF.archive.md) — framework matches the proven pattern; target repo not modified | Done |
| Gates: framework-verify PASS, gate-verify PASS (n/a), touch-scope PASS, blast-radius WARN (11 areas, cross-cutting by design, acknowledged) | Done |
| Round 1 committed by owner as `087981f`; round 2 via close commit push | Done |

---

## Session summary (2026-08-13, close)

| Step | Status |
|------|--------|
| Diffed `skills/biz-session/skill.md` against `/mnt/work/Projects/.ai/skills/session-control` (skill.md + reference.md) | Done |
| Rewrote biz-session: full parse table (start/close/commit/add/context/status + commit/push/scoped modifiers + begin/open/end/handoff aliases), start protocol S1–S7 (goal capture, unblock check, env snapshot, task-ref → active-ref, HANDOFF Open mark, checklist report) | Done |
| Close protocol C1–C7: tree audit + secrets scan (halt), verification gate (change-safety scripts), follow-ups, always-shown commit message with BIZ-ref extraction, HANDOFF/NEXT/UNKNOWNS writes, scoped git (default `.work.biz/` incl. untracked; `scoped` = bookend files), post-commit SHA verification | Done |
| Standalone commit protocol M1–M6 (no HANDOFF/NEXT writes, session stays open) and add protocol (stage-only) — the two biggest parity gaps | Done |
| Kept biz-specifics: `.work.biz/` state writes, path-scoped commit shape in targets, CONTENT_STATUS pipeline brief on start, context mode with scoped status view | Done |
| Repo-role commit scope (owner directive): root `skills/biz-session/skill.md` detection; source repo → `git add -A` repo-wide (all modified/added/new files), target → `.work.biz/` only; applied across parse table, C6b, add protocol, context, edge cases, anti-patterns, completion checklist | Done |
| Routing sync: skills/README (row + verb table + `add`), .cursorrules + templates/cursorrules.template rows, START_HERE §6, .quick/session-lifecycle.md, SKILL_DEPENDENCIES, biz-director intents, PROCESS_ROUTER, README skill table, CHANGELOG Unreleased | Done |
| Gates: framework-verify PASS, gate-verify PASS (no ledger), touch-scope PASS, blast-radius WARN (9 areas — routing sync, acknowledged) | Done |

---

## Session summary (2026-08-10, continuation close)

The previous session (ses_0121) was interrupted right as it began implementing the approved six-improvement plan, after phase 1 (Content Status Protocol, committed as e08af92). This session resumed from the transcript and completed the plan.

| Step | Status |
|------|--------|
| #1 `@biz-review monthly` (I1b): assumption ledger re-grading, dead-assumption routing to amend, Re-validated date | Done |
| Drift-check scope narrowed to the five positioning files (ledger/changelog/ICP were false-positive by design) | Done |
| #2 `@biz-strategy career` (I2d): operator probe, Hold/Sharpen/Transition read, cross-check vs certified strategy | Done |
| #2 `OPERATOR_PROFILE.md` template in reference/ (deliberately not strategy/: no gate interference) | Done |
| #2 Wiring: biz-writing/biz-social I0, biz-content I0c, biz-youtube operator proof, biz-pricing I0b, greenfield pointer | Done |
| #3 Pillar loop: CONTENT_STATUS By pillar + Pillar column, CONVENTIONS pillar traceability, assignment in all four content skills + log mode, pillar column in both plan modes | Done |
| #3 `@biz-review quarterly` content-strategy alignment (conversations per pillar → amend) | Done |
| #4 `PROJECTS.md` proof-point bank template (dangling DIRECTORY_MAP ref closed); bootstrap + all manifests; sales-skill self-heal wording; content-skill proof wiring | Done |
| #5 Voice loop: CONVENTIONS § Voice loop (mandatory retro entries, empty-profile warning, amendment rule); publish checklists + log mode record; weekly coverage check; skeleton warnings in all content skills + bootstrap status | Done |
| #6 Session content pipeline brief at `@biz-session start` (ready/draft/last-publish + one suggested action) | Done |
| #6 Evidence discipline rule in CONVENTIONS; machine check evaluated (83 hits, mostly advice numbers) and rejected with rationale | Done |
| Appeal standard (6 bars) in Content Standard; anti-AI additions (5 banned constructions + 5 vocab rows + cadence rules) | Done |
| Skill checklists: biz-writing position question + position/scene self-critique, biz-social universal format + checklist, biz-content hook selection + step 5 | Done |
| Non-tech-host conditional tilt (UNKNOWNS #2) | Done |
| Routing sync: skills/README verbs (monthly, career), PROCESS_ROUTER, START_HERE tree + §3, biz-director intents, README table, .cursorrules + template | Done |
| framework-verify: bootstrap↔WORK_FILES manifest sync check (real self-check, extraction verified) | Done |
| UNKNOWNS #2, #9, #10 resolved; NEXT/HANDOFF/CHANGELOG updated | Done |
| Gates: framework-verify PASS (all checks incl. new one), gate-verify PASS, touch-scope PASS | Done |

---

## Session summary (2026-08-10, close)

| Step | Status |
|------|--------|
| Diagnosed publish-status tracking failure: tracker existed but only biz-content challenge wrote to it | Done |
| CONVENTIONS § Content Status Protocol: lifecycle states, read rule, write rule, self-heal rule | Done |
| `CONTENT_STATUS.md` template: Draft column, status vocabulary, purpose statement | Done |
| biz-content publish: step 0 load tracker + step 7 record publish; status mode reconciles | Done |
| biz-writing: I0 tracker read + Step 7 register piece + completion gate item | Done |
| biz-social: I0 tracker read + Step 5 register + new `log` mode (I7) + time budget | Done |
| biz-youtube publish: step 0 load + step 7 record (index + youtube-tracker); status reads index | Done |
| biz-review drift check: self-heal missing tracker + backfill | Done |
| Routing sync: biz-director intent row, skills/README verb, .cursorrules + template, START_HERE, PROCESS_ROUTER, SKILL_DEPENDENCIES | Done |
| framework-verify: content-status wiring check (silent-failure guard) | Done |
| blast-radius-check.sh: staged-aware measurement + real self-test (4 scenarios) | Done |
| UNKNOWNS #6 resolved (deploy update creates missing files via bootstrap copy_if_missing) | Done |

---

## Session summary (2026-08-06, close)

| Step | Status |
|------|--------|
| Skill rename to `biz-*` ids carried through every doc, script, and standard | Done |
| `biz-deploy-basic --update` doubled `AGENT_OS_SOURCE` on greenfield targets — fixed + repro-tested | Done |
| Phantom verbs implemented: `status` for biz-market-validate / biz-pipeline-diagnosis / biz-referrals / biz-deploy-repo | Done |
| `biz-social` Substack/Threads parse rows + enumeration; `biz-community` `find x` + frontmatter | Done |
| `active-deal` restored to one writer (`@biz-discovery run`) across five files | Done |
| biz-strategy certify file count (5→6), deploy-files scaffold path, brand-ready wording, biz-review pre-check | Done |
| Doc alignment sweep (concepts BIZ-09, CONVENTIONS, PROCESS_ROUTER, .quick, templates, DIRECTORY_MAP) | Done |
| Unsourced `biz-referrals` stats (5-8x, close-rate table) replaced with directional rationale | Done |
| CHANGELOG cut to v0.6.0 with pre-rename names normalized inside the release section | Done |
| Gates: framework-verify PASS, gate-verify PASS (n/a — no ledger), touch-scope PASS, blast-radius WARN (acknowledged) | Done |
| Commit, tag v0.6.0, push, GitHub release | Done |

---

> Older session summaries (2026-07-30 and earlier) moved to `context/HANDOFF.archive.md` (Context budget).

## Pending for next session

| # | Task | Priority |
|---|------|----------|
| 1 | Smoke-test `@biz-archive` on `future-strategy` once its uncommitted slim-down lands: `status` dry run, catch-up path for any archived piece missing status.md, tracker row removal | High |
| 1b | Smoke-test the biz-session verbs on a live target project: standalone `commit` (session stays open), `add` (stage-only), `close commit scoped`, task-ref extraction into `.work.biz/active-ref` | High |
| 2 | Owner review/commit of the uncommitted `future-strategy` slim-down (HANDOFF/NEXT/UNKNOWNS/CONTENT_STATUS + 17 status.md files + HANDOFF.archive.md); stale live-path refs remain in CONTENT_MATRIX.md, OWNER_RUNBOOK.md, VOICE_PROFILE.md:48 | High |
| 3 | Validate the full loop on a live target project: publish + `@biz-social log` cycle with pillar assignment + VOICE_RETRO entry, then `@biz-strategy career` to fill OPERATOR_PROFILE.md | High |
| 4 | Validate pillar loop + quarterly alignment on real tracker data (needs ≥1 quarter of pillar-tagged publishes) | Medium |
| 5 | Substack + Threads guides are untested — no project has published to either. Validate against real output before trusting the cadence and format rules | Medium |
| 6 | Regenerate `.tmp/*.skill` archives — now also missing biz-archive and the archive/context-budget changes | Medium |
| 7 | Test appeal standard + hardened `biz-writing` against a new LinkedIn draft and measure engagement vs `post_01_the_spreadsheet_nobody_owns` | Medium |
| 8 | Smoke-test `@biz-strategy amend` + re-certify path on a host with out-of-tree positioning docs | Medium |
| 9 | Delete or refresh `.work.biz/touch-scope` when not in a scoped edit session | Low |
| 10 | Owner decision: deletion candidates (`.work.biz/prompts/20260814-marker-detection-deploy-repo-removal-audit.md` — `.ai`-only; `docs/adoption/FROM_AGENT_OS.md` + `docs/guides/workflows/README.md` stubs; `examples/`; stale `.tmp/*.skill`) | Low |
| 11 | Full dedup refactor: shared publishing-ops skeleton (biz-content/biz-youtube) + I0 context contract (biz-writing/biz-social) — portability tradeoff (UNKNOWNS #11) | Low |

---

## Key decisions (locked in)

| # | Decision |
|---|----------|
| 1 | **Platform guides** live under `skills/biz-social/platforms/` — loaded on demand, not inlined in `skill.md`. |
| 2 | **Topic buckets** canonical in `concepts/content-topic-buckets/` — referenced by biz-writing, biz-content, biz-youtube. |
| 3 | **LinkedIn video** — `@biz-social write linkedin video`; deep rules in `platforms/linkedin-video.md`. |
| 4 | **Anti-AI-artifact** — binding in Content Standard; scan required before content delivery. |
| 5 | **Zero em-dashes/en-dashes** in all generated content. Use periods, commas, colons, or parentheses instead. |
| 6 | **Human voice over literary voice** — contractions allowed, sentence length varied, minor roughness preferred to polished perfection. |
| 7 | **Actionable frameworks belong in the post body or a carousel**, not hidden in the first comment. |
| 8 | Four-tier content: `biz-writing` → `biz-social` → `biz-content` / `biz-youtube`. |
| 9 | Strategy artifacts in `.work.biz/strategy/` only. `plans/strategy_*.md` are historical/ad-hoc; on conflict, `strategy/` wins. |
| 10 | `.work.biz/touch-scope` is session-local — declare before scoped edits; not required in git. |
| 11 | **`biz-strategy amend`** records mid-cycle strategy changes + changelog; never certifies — re-certify required before gated work. |
| 12 | **Audience hierarchy** — primary (sharpness-tested) + secondary + opportunistic; static profile must respect the fork. |
| 13 | Gated skills (brand, pricing, content publish/plan/challenge) **self-check** `gates.md` strategy-ready; director gate is second layer. |
| 14 | **`CONTENT_STATUS.md`** is the canonical publish/status tracker; bootstrap creates it; publish flows update it. |
| 15 | **`reference/VOICE_PROFILE.md`** is the canonical voice definition — how *this owner* sounds, on every platform. The Content Standard's anti-AI-artifact rules are an unoverridable floor; its generic human-voice rules are overridable defaults. On format the platform guide wins; on voice the profile wins. |
| 16 | **Voice is defined by reference sample, not description.** Descriptions drift across sessions, samples don't. |
| 17 | **`reference/VOICE_RETRO.md`** measures whether the voice rules work: owner edits per piece must fall over time. Same edit class three times means amend `VOICE_PROFILE.md`, not the owner correcting forever. |
| 18 | **`@biz-strategy reconcile`** exists so correcting a file that contradicts its own certification does not cost four gates. Only for decisions the certified record already asserts but were never transcribed. Moves no gate; logs as **(correction)**. |
| 19 | **Graded claims** are mandatory on commentary: Verified / Inference / would-check, in the text. Commentary inherits other people's facts; grading stops their errors becoming yours. |
| 20 | **Gate status reading is tolerant** — a gate is met when its status *starts with* `PASS`, so hand annotations like `PASS 2026-07-25 - verified live` are valid. Gate ids match on a normalized form. |
| 21 | **Per-platform trackers** (`pipeline/<platform>-tracker.md`) are created on first publish, not at bootstrap. `CONTENT_STATUS.md` stays the cross-platform index. |
| 22 | **Bootstrap manifest sync rule** — `templates/bootstrap.sh`, `templates/README.md`, `scripts/biz-deploy-basic.sh` `WORK_FILES`, `skills/biz-deploy-basic/skill.md`, and `skills/biz-bootstrap/skill.md` § I1 must list the same files. `WORK_FILES` is the one that fails silently. |
| 23 | **All skill ids carry the `biz-` prefix** (v0.6.0) — one naming scheme, no exceptions; `session-control` remains an alias of `biz-session`. Old ids (`content-social`, `content-writing`, `deploy-*`, `session-biz`, `business-ideas`, `product-service-ideas`) exist only in pre-v0.6.0 CHANGELOG sections. |
| 24 | **One writer per gate is binding** — `active-deal` is promoted by `@biz-discovery run` alone; `@biz-proposal write` is not a promoter. |
| 25 | **Content Status Protocol is binding on all content skills** — every content skill reads `CONTENT_STATUS.md` before drafting and records into it after producing or publishing; a missing tracker is created from its template at record time, never a reason to skip the record. Publishes that happened outside any skill are recorded via `@biz-social log`. Lifecycle: draft → ready → published (+ blocked, hold). |
| 26 | **`blast-radius-check.sh` measures the next commit, not the tree** — staged content wins when anything is staged; working-tree-vs-HEAD only when nothing is staged. This is what makes the split-into-scoped-commits workflow executable. |
| 27 | **OPERATOR_PROFILE lives in `reference/`, not `strategy/`** — it is input to positioning decisions, not a positioning decision. In `strategy/` it would trip the drift check on every career update and could even demote gates; in `reference/` it never interferes with the gate machinery. Same reasoning keeps it out of the weekly date comparison. |
| 28 | **The drift check compares positioning files only** — one-pager, target-buyer-profile, offer-scope, channel-plan, pricing. The ledger, changelog, and linkedin-icp are non-positioning by design; flagging them trained operators to ignore the check. Dead load-bearing assumptions still surface via monthly re-validation routing through amend. |
| 29 | **Pillar assignment happens at registration, never retroactively in bulk** — a published piece with no pillar is a recording failure. Pillars are the bridge that lets quarterly reviews aggregate conversations by strategic message. |
| 30 | **Evidence claims need a citation or a directional marker; a machine check was rejected** — grep cannot tell a claim about the world from advice, and 83 false-positive-prone hits would drown real findings. The rule lives in CONVENTIONS § Evidence discipline and is enforced by prose review. |
| 31 | **The appeal standard never overrides truth** — sharper is never worth invented detail. When proof points are thin, the fix is `PROJECTS.md`, not embellishment. |
| 32 | **The publish record lives with the piece, the tracker tracks the live inventory** — archiving writes a per-piece `status.md` (never a centralized `ideas.archive/status.md`, which would need rewriting every run); only after that record is verified does the row leave CONTENT_STATUS. Lifetime aggregates (By platform Last publish, By pillar conversations) stay in the tracker. |
| 33 | **Context budget: history is moved, never deleted** — session-start files (HANDOFF, NEXT, UNKNOWNS, CONTENT_STATUS) stay lean; older material moves to sibling `*.archive.md` files with a pointer line. biz-session close performs the slim. |
| 34 | **Change-safety gates are warn-only in the pre-commit hook by default** — `hooks/pre-commit` runs touch-scope-verify + blast-radius-check with `--warn-only` on every commit (prints findings, never blocks); `GATES_ENFORCE=1 git commit …` restores blocking, `WARN_ONLY=1` forces warn-only. Tracking hooks (prepare-commit-msg ref prefix, commit-msg Co-authored-by rejection, post-commit commit-ref metadata) unchanged. Decided so the operator can commit/push from the shell without being stopped by the gates. |
| 35 | **Pricing rules have one canonical home** — binding rules in `standards/20260621-PRICING-STANDARD.md` (fixed-price only, 50% upfront, never discount — reduce scope instead); post-delivery offer table canonical in `skills/biz-pricing/skill.md` § Post-Delivery Offers; `biz-proposal` points at both instead of restating them. |

---

## Quick reference

| Need to... | Read / Run |
|------------|-----------|
| What to do next | `.work.biz/plans/NEXT.md` |
| LinkedIn video | `skills/biz-social/platforms/linkedin-video.md` |
| Platform guides | `skills/biz-social/platforms/` |
| Content quality bar | `standards/20260621-CONTENT-STANDARD.md` |
| LinkedIn text/carousel rules | `skills/biz-writing/skill.md` § LinkedIn post |
| Strategy change mid-cycle | `@biz-strategy amend` then `@biz-strategy certify` |
| Publish status tracker | `.work.biz/reference/CONTENT_STATUS.md` |
