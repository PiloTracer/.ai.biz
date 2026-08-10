# HANDOFF — Session Bookmark

> **Date:** 2026-08-10 — Session closed
> **Status:** Content Status Protocol shipped: publish/status tracking fixed across all four content skills (only 1 of 4 publish paths wrote `CONTENT_STATUS.md` before), new `@biz-social log` mode, `framework-verify` regression check, `blast-radius-check.sh` staged-aware with a real self-test, UNKNOWNS #6 resolved. Gates: framework-verify PASS, gate-verify PASS, touch-scope PASS. Uncommitted; owner to commit.

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

## Session summary (2026-07-30, close)

| Step | Status |
|------|--------|
| Canonical `reference/VOICE_PROFILE.md` template + wired into all four content skills | Done |
| `reference/VOICE_RETRO.md` template — voice convergence measurement | Done |
| `platforms/substack.md` (R7) + `platforms/threads.md` (R8) + algorithm standard sections | Done |
| Missing platform-specific anti-AI tics (Instagram, Facebook, Substack, Threads) | Done |
| `@biz-social status` (I6) implemented — was advertised in four places, never written | Done |
| `pipeline/platform-tracker.md.template` — per-platform ops layer | Done |
| `@biz-strategy reconcile` (I2c) — consistency repair without a gate cascade | Done |
| Graded-claims rule + voice-convergence section in Content Standard | Done |
| `biz-director` routes for Substack/Threads + content-strategy + content-scripts intents | Done |
| Gate-ledger parser: tolerate hand annotations; reject pending-phase false positive | Done |
| `bootstrap.sh` rejects positional args (was silently scaffolding into the framework repo) | Done |
| `biz-deploy-basic --update` manifest drift — `WORK_FILES` missed 7 artifacts | Done |
| `install-git-hooks.sh` — unknown-flag guard, real `--self-test`, backup path | Done |
| Consistency fixes: biz-strategy gate self-contradiction, README missing biz-youtube, 3 dangling paths, unsourced stats | Done |
| Consumer project (`future-strategy`): VOICE_PROFILE migration + channel-plan Substack correction | Done (left uncommitted for owner review) |
| Commit and push | Done |

---

## Session summary (2026-07-21, close)

| Step | Status |
|------|--------|
| Canonical strategy path conventions clarified (`strategy/` flat names; `plans/strategy_*.md` historical only) | Done |
| Add `biz-strategy amend` + `strategy/changelog.md` + audience hierarchy + out-of-tree fold-in | Done |
| Gate pre-check (strategy-ready via `gates.md`) on biz-brand, biz-pricing, biz-content | Done |
| biz-review weekly drift check (stale cert, out-of-tree strategy, CONTENT_STATUS) | Done |
| biz-social quality gates: buyer/offer/freshness vs strategy | Done |
| `CONTENT_STATUS.md` template + bootstrap wiring (biz-bootstrap + bootstrap.sh) | Done |
| Document gated-skill self-verify in SKILL_DEPENDENCIES; list `amend` in skills/README | Done |
| Commit and push | Done |

---

## Pending for next session

| # | Task | Priority |
|---|------|----------|
| 1 | Owner review of the uncommitted `future-strategy` changes (VOICE_PROFILE migration, channel-plan Substack correction, VOICE_STANDARD → Publishing Standard refactor) | High |
| 2 | Commit this session's framework changes (content status protocol + blast-radius fix) | High |
| 3 | Validate the Content Status Protocol on a live target project: run a publish + `@biz-social log` cycle and confirm the tracker stays current | High |
| 4 | Substack + Threads guides are untested — no project has published to either. Validate against real output before trusting the cadence and format rules | Medium |
| 5 | Regenerate `.tmp/*.skill` archives — now also missing voice profile, Substack/Threads, reconcile, platform tracker, content status protocol | Medium |
| 6 | Test revised `biz-writing` skill against a new LinkedIn draft and measure engagement | Medium |
| 7 | Smoke-test `@biz-strategy amend` + re-certify path on a host with out-of-tree positioning docs | Medium |
| 8 | Delete or refresh `.work.biz/touch-scope` when not in a scoped edit session | Low |

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
