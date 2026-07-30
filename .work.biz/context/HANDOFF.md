# HANDOFF — Session Bookmark

> **Date:** 2026-07-30 — Session closed
> **Status:** Multi-platform content capability shipped (canonical voice profile, Substack + Threads, per-platform ops layer, `biz-strategy reconcile`, graded claims, voice convergence). Gate-ledger parser fixed twice against a real consumer ledger. Eight framework consistency fixes. Committed and pushed.

---

## Session summary (2026-07-30, close)

| Step | Status |
|------|--------|
| Canonical `reference/VOICE_PROFILE.md` template + wired into all four content skills | Done |
| `reference/VOICE_RETRO.md` template — voice convergence measurement | Done |
| `platforms/substack.md` (R7) + `platforms/threads.md` (R8) + algorithm standard sections | Done |
| Missing platform-specific anti-AI tics (Instagram, Facebook, Substack, Threads) | Done |
| `@content-social status` (I6) implemented — was advertised in four places, never written | Done |
| `pipeline/platform-tracker.md.template` — per-platform ops layer | Done |
| `@biz-strategy reconcile` (I2c) — consistency repair without a gate cascade | Done |
| Graded-claims rule + voice-convergence section in Content Standard | Done |
| `biz-director` routes for Substack/Threads + content-strategy + content-scripts intents | Done |
| Gate-ledger parser: tolerate hand annotations; reject pending-phase false positive | Done |
| `bootstrap.sh` rejects positional args (was silently scaffolding into the framework repo) | Done |
| `deploy-basic --update` manifest drift — `WORK_FILES` missed 7 artifacts | Done |
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
| content-social quality gates: buyer/offer/freshness vs strategy | Done |
| `CONTENT_STATUS.md` template + bootstrap wiring (biz-bootstrap + bootstrap.sh) | Done |
| Document gated-skill self-verify in SKILL_DEPENDENCIES; list `amend` in skills/README | Done |
| Commit and push | Done |

---

## Pending for next session

| # | Task | Priority |
|---|------|----------|
| 1 | **Verbs advertised with no implementation** — `biz-market-validate` (test/design/status), `biz-pipeline-diagnosis` (run/status), `biz-referrals` (ask/status). Bodies are topic reference sections, not verb-dispatched modes, so `@biz-referrals status` has no defined workflow. Same class as the `content-social status` gap fixed this session | High |
| 2 | **Unsourced stats still in skill bodies** — `biz-referrals` claims "5-8x better than cold outreach". `biz-strategy` was fixed this session by replacing the numbers with directional rationale; apply the same treatment or source it. Also check biz-brand/biz-youtube | Medium |
| 3 | Owner review of the uncommitted `future-strategy` changes (VOICE_PROFILE migration, channel-plan Substack correction, VOICE_STANDARD → Publishing Standard refactor) | High |
| 4 | Substack + Threads guides are untested — no project has published to either. Validate against real output before trusting the cadence and format rules | Medium |
| 5 | `blast-radius-check.sh` measures against `HEAD`, i.e. the whole working tree, which makes the "split into scoped commits" workflow it exists to enforce impossible to execute for the first commit. Needs to diff staged content instead | Medium |
| 6 | Regenerate `.tmp/*.skill` archives — now also missing voice profile, Substack/Threads, reconcile, platform tracker | Medium |
| 7 | Test revised `content-writing` skill against a new LinkedIn draft and measure engagement | Medium |
| 8 | Smoke-test `@biz-strategy amend` + re-certify path on a host with out-of-tree positioning docs | Medium |
| 9 | Delete or refresh `.work.biz/touch-scope` when not in a scoped edit session | Low |

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
| 15 | **`reference/VOICE_PROFILE.md`** is the canonical voice definition — how *this owner* sounds, on every platform. The Content Standard's anti-AI-artifact rules are an unoverridable floor; its generic human-voice rules are overridable defaults. On format the platform guide wins; on voice the profile wins. |
| 16 | **Voice is defined by reference sample, not description.** Descriptions drift across sessions, samples don't. |
| 17 | **`reference/VOICE_RETRO.md`** measures whether the voice rules work: owner edits per piece must fall over time. Same edit class three times means amend `VOICE_PROFILE.md`, not the owner correcting forever. |
| 18 | **`@biz-strategy reconcile`** exists so correcting a file that contradicts its own certification does not cost four gates. Only for decisions the certified record already asserts but were never transcribed. Moves no gate; logs as **(correction)**. |
| 19 | **Graded claims** are mandatory on commentary: Verified / Inference / would-check, in the text. Commentary inherits other people's facts; grading stops their errors becoming yours. |
| 20 | **Gate status reading is tolerant** — a gate is met when its status *starts with* `PASS`, so hand annotations like `PASS 2026-07-25 - verified live` are valid. Gate ids match on a normalized form. |
| 21 | **Per-platform trackers** (`pipeline/<platform>-tracker.md`) are created on first publish, not at bootstrap. `CONTENT_STATUS.md` stays the cross-platform index. |
| 22 | **Bootstrap manifest sync rule** — `templates/bootstrap.sh`, `templates/README.md`, `scripts/deploy-basic.sh` `WORK_FILES`, `skills/deploy-basic/skill.md`, and `skills/biz-bootstrap/skill.md` § I1 must list the same files. `WORK_FILES` is the one that fails silently. |

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
