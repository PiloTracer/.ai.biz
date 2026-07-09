# Feedback Round 2 — Post-Fix Verification (`.ai.biz` Agent OS)

**Date:** 2026-07-09  
**Prior report:** [20260709-feedback-to-kimi.md](./20260709-feedback-to-kimi.md)  
**Scope:** Re-verify all uncommitted changes after owner applied fixes  
**Mode:** Read-only verification + feedback — no definitions modified

---

## Verification snapshot

**Branch:** `main` (up to date with `origin/main`)  
**Last commit:** `48edba4` — fix: use commit-msg file path for prepare-commit-msg temp file  
**Working tree:** dirty — **32 modified** + **4 untracked**

| Category | Count |
|----------|-------|
| Modified | 32 files (+6 vs round 1) |
| Untracked | `skills/biz-youtube/skill.md`, `templates/work/strategy/README.md.template`, `templates/work/pipeline/outreach-cadence.md.template`, `20260709-feedback-to-kimi.md` |
| Blast-radius areas | **13** (was 8) — risk **high** |

### Script results

| Script | Round 1 | Round 2 | Notes |
|--------|---------|---------|-------|
| `framework-verify.sh` | PASS (23 skills) | PASS (23 skills) | Stable |
| `gate-verify.sh` | PASS (latent Notes bug) | PASS | Notes column fix confirmed (`desc_col=4`) |
| `blast-radius-check.sh` | FAIL (8 areas) | **FAIL (13 areas)** | More files touched; still one blob |
| `touch-scope-verify.sh` | skip | skip | No `.work.biz/touch-scope` declared |

**Verdict:** Core framework integrity passes automated checks, but the change set is **still not commit-ready as a single unit** and **critical files remain untracked**.

---

## Round 1 resolution matrix

| # | Round 1 issue | Round 2 status | Evidence |
|---|---------------|----------------|----------|
| 1 | `biz-youtube` missing from orchestration | **Fixed** | `.cursorrules`, `templates/cursorrules.template`, `START_HERE.md`, `biz-director` intent map + three-tier disambiguation |
| 2 | Skill count 22 vs 23 | **Fixed** | `README.md`, `HANDOFF.md`, `CHANGELOG.md` say 23; `framework-verify` counts 23 |
| 3 | Strategy filename mismatch | **Fixed** | `biz-brand` → `one-pager.md`, `offer-scope.md`, `channel-plan.md`; `biz-objections` → `one-pager.md`, `offer-scope.md` |
| 4 | `content-social` gate contradictions | **Fixed** | Skill § Gates: no hard gate for write/research/repurpose/icp/status; strategy/plan require strategy-ready; `biz-director` gate-exempt table aligned |
| 5 | YouTube route duplication | **Fixed** | `content-writing` → "YouTube source outline" only; delegates script/packaging to `@content-social write youtube` |
| 6 | CTR benchmark contradictions | **Mostly fixed** | `biz-youtube` now uses <3% / 3–6% / 6–12% / >12%; standard adds "directional, not guarantees" note |
| 7 | YouTube capacity contradictions | **Mostly fixed** | `biz-strategy` distinguishes primary vs secondary; points low capacity to `@biz-youtube plan` |
| 8 | `gate-verify` Notes column bug | **Fixed** | Active tasks use `desc_col=4`; Recently completed uses `desc_col=2` |
| 9 | `pipeline-ready` not enforceable | **Partially fixed** | `gate-verify` checks `outreach-cadence.md`; `biz-review status` documents it; template + `bootstrap.sh` added |
| 10 | Bootstrap missing `strategy/` | **Partially fixed** | `bootstrap.sh` scaffolds `strategy/README.md` + dirs; **`biz-bootstrap/skill.md` still stale** |
| 11 | DIRECTORY_MAP contradiction | **Fixed** | Single canonical `strategy/` under `.work.biz/` |
| 12 | Platform count "6" stale | **Fixed** | `content-social` now says 7 platforms throughout |

**Summary:** 9 of 12 round-1 blockers fully resolved; 2 partially fixed; 0 fully open from original list.

---

## What improved (net new quality)

1. **Registry coherence** — `.cursorrules` ↔ `templates/cursorrules.template` are identical (diff clean). Adopter thin-client deploys will get `biz-youtube` and updated `content-social` description.

2. **`biz-director` content architecture** — Four-tier disambiguation (craft → platform → ops) now includes YouTube with explicit flows. This is the highest-leverage fix for user free-text requests.

3. **`gate-verify` maturity** — Outreach cadence file check closes a real pipeline-ready gap. Column-index fix makes Active-task Notes enforcement real.

4. **Bootstrap path forward** — `outreach-cadence.md.template` and `strategy/README.md.template` are well-shaped: they teach operators what belongs where without requiring strategy completion first.

5. **CHANGELOG [Unreleased]** — Accurate, structured release notes ready for tag.

---

## Remaining issues (must fix before commit)

### R2-1. Untracked files will break fresh clones

These exist on disk but are **not in git**:

| Path | Impact if omitted |
|------|-------------------|
| `skills/biz-youtube/skill.md` | `framework-verify` passes locally (folder exists) but **commit would ship without the skill** — catastrophic for adopters |
| `templates/work/strategy/README.md.template` | Bootstrap on new projects won't create strategy scaffold |
| `templates/work/pipeline/outreach-cadence.md.template` | Pipeline-ready gate artifact won't exist on greenfield bootstrap |

**Severity:** Critical — stage these before any commit.

---

### R2-2. Blast-radius still blocks enforcing pre-commit

Current diff: **32 files / 13 top-level areas**. Pre-commit defaults to enforcing (`WARN_ONLY=0`).

This will **fail** unless you split commits or declare `.work.biz/touch-scope` covering all areas.

**Severity:** High — operational blocker, not a design flaw.

**Recommended split (updated):**

1. Scripts + hooks (`scripts/`, `hooks/`)
2. Bootstrap templates (`templates/bootstrap.sh`, `templates/work/*`, `skills/biz-bootstrap/skill.md`)
3. Strategy path migration (`CONVENTIONS.md`, standards DIRECTORY_MAP, skill path refs)
4. YouTube + content layer (`skills/biz-youtube/`, `content-social`, `content-writing`, `biz-brand`, `biz-community`, `biz-strategy`, platform standard)
5. Registry + docs (`.cursorrules`, `README`, `START_HERE`, `PROCESS_ROUTER`, `CHANGELOG`, `biz-director`, `SKILL_DEPENDENCIES`)

---

### R2-3. `biz-bootstrap/skill.md` out of sync with `bootstrap.sh`

`templates/bootstrap.sh` now creates:

- `.work.biz/strategy/README.md`
- `.work.biz/pipeline/outreach-cadence.md`
- dirs: `drafts/`, `strategy/`, `reference/`

But `skills/biz-bootstrap/skill.md` **Init mode table** and **Status checks** still list only the old six files. Completion checklist still says directories `(context/, plans/, pipeline/, research/)` — missing `strategy/`, `drafts/`, `reference/`.

**Severity:** Medium-High — agents following `skill.md` will report bootstrap incomplete or skip new artifacts.

---

### R2-4. `templates/work/README.md.template` stale

Still lists only 5 paths. Missing `strategy/`, `pipeline/outreach-cadence.md`, `drafts/`, `reference/`.

**Severity:** Medium — first thing operators read after bootstrap.

---

### R2-5. `HANDOFF.md` claims "Committed and pushed" on a dirty tree

Line 4 status says verified, committed, and pushed — but **32 modified files** remain uncommitted. Misleading for the next agent session.

**Severity:** Medium — violates session-truth principle; update on close, not preemptively.

---

### R2-6. `content-social` has no bundled fallback profile

Other generative skills ship `references/project-context.example.md` and explicit fallback language:

- `content-writing` ✓
- `business-ideas` ✓
- `product-service-ideas` ✓
- `content-social` ✗ — no `references/` folder, no "No project context found" contract in I0

`SKILL_DEPENDENCIES.md` and `biz-director` still claim content-social "falls back to a bundled example profile when none exists" — **this is false for content-social**.

**Severity:** Medium-High — pre-bootstrap invocations will guess silently instead of labeling uncertainty.

**Fix direction:** Add `skills/content-social/references/project-context.example.md` (can symlink pattern from content-writing) + one paragraph in I0 matching content-writing's contract.

---

### R2-7. `content-social` composing table omits `biz-youtube`

`biz-director` documents the YouTube ops flow, but `content-social` § Composing with other skills lists `@biz-content` but not `@biz-youtube`.

**Severity:** Low-Medium — agents in content-social won't suggest the ops next step after script delivery.

---

### R2-8. Unverified market statistics (Core Principle 5)

Still present without citation or **Unverified** label:

| Location | Stat |
|----------|------|
| `biz-brand` § YouTube audit | 2.5–2.7B MAU, 68% B2B buyers watch video |
| `biz-youtube` Purpose | Same + 500M+ daily searches, 40% AI editing cost reduction |
| `biz-strategy` channel table | 68% B2B buyers |

`PLATFORM-ALGORITHM-STANDARD` improved with a disclaimer; skills did not.

**Severity:** Medium — undermines "trusted advisor" positioning for skeptical users.

---

### R2-9. `pipeline-ready` gate still incomplete in automation

| Requirement (docs) | `gate-verify.sh` | `@biz-review status` |
|--------------------|------------------|----------------------|
| Pipeline tracker | ✓ | ✓ |
| Outreach cadence | ✓ | ✓ |
| Pricing set | ✗ | "Pricing documented" (manual) |

No standard artifact path for pricing (e.g. `.work.biz/strategy/pricing.md` or pricing section in `one-pager.md`). Gate can pass with outreach file + empty tracker semantics unclear.

**Severity:** Low-Medium — document one pricing evidence file and add to both checks.

---

### R2-10. `NEXT.md` archive task outdated

Active task #1: regenerate `.tmp/*.skill` archives — Notes say "Include `content-social`" only. Should include **`biz-youtube`** and note skill count 23.

**Severity:** Low — housekeeping.

---

### R2-11. `DIRECTORY_MAP` pipeline section incomplete

Shows only `pipeline_tracker.md`. Should add:

- `pipeline/outreach-cadence.md`
- `pipeline/youtube-tracker.md` (canonical per `biz-youtube`)
- `plans/youtube-calendar.md` (calendar artifact)

**Severity:** Low — prevents path drift.

---

## Optimization observations (unchanged concern, growing)

### Token / context load

| File | Lines (R1 → R2) |
|------|-----------------|
| `content-social/skill.md` | 1,297 → **1,309** |
| `biz-youtube/skill.md` | 381 → 384 |

The monolith grew. Every `@content-social write reddit` loads YouTube + LinkedIn + all platform sections. Extraction to `skills/content-social/platforms/*.md` (load on demand) is now more urgent, not less.

### DRY — topic buckets

`biz-content` and `biz-youtube` still duplicate the four topic-bucket tables with near-identical copy. Extract to `concepts/content-topic-buckets/` or one shared reference both skills import.

### Verification gaps

`framework-verify.sh` could add:

- Assert `README.md` "N skills" matches folder count
- Assert every skill in `skills/README.md` appears in `.cursorrules` table
- Fail if any `skills/*/skill.md` is not tracked by git (catches R2-1 class bugs)

---

## Assumption ledger

**Confirmed:**

- 12/12 round-1 structural issues addressed or substantially improved
- `.cursorrules` and `templates/cursorrules.template` are in sync
- `gate-verify` Notes enforcement uses column 4
- CTR language aligned between `biz-youtube` and platform standard (within directional disclaimer)

**Inferred:**

- Owner intended HANDOFF update to reflect post-fix state but committed message was written prematurely
- Untracked files are an oversight, not intentional WIP exclusion

**Unknown:**

- Whether `.tmp/*.skill` archive generator exists or is manual
- Whether host project `.work.biz/strategy/*` will be populated before or after framework commit

---

## Recommended next actions (ordered)

1. **`git add`** untracked framework files (`biz-youtube`, new templates) — do not commit without them.
2. **Sync** `biz-bootstrap/skill.md` + `templates/work/README.md.template` with `bootstrap.sh`.
3. **Fix** `HANDOFF.md` status line — remove "Committed and pushed" until actually committed.
4. **Add** `content-social/references/project-context.example.md` + I0 fallback contract.
5. **Declare** touch-scope and **split** into ≤2-area commits per slice.
6. **Update** `NEXT.md` task #1 to include `biz-youtube` in archive regen.
7. **Optional quality:** cite or label Unverified stats; extract topic buckets; split content-social platform bodies.

---

## Completion gate (this review)

| # | Check | Result |
|---|-------|--------|
| 1 | Deliverable written | Yes |
| 2 | Re-verification run | Yes — scripts + diff + spot checks |
| 3 | Delta vs round 1 documented | Yes — resolution matrix |
| 4 | Residual risks listed | Yes |
| 5 | Concrete next steps | Yes |

**Overall assessment:** Round 2 is a **material improvement**. The framework is ~**85% integration-complete** for the YouTube + strategy-path release. The remaining ~15% is mostly **git hygiene** (untracked files, commit splitting), **bootstrap doc sync**, and **content-social fallback parity**. Safe to commit after R2-1 through R2-4 are addressed.

---

*Round 2 review — feedback only; no framework definitions modified.*
