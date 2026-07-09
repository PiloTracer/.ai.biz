# Feedback on Uncommitted Changes — `.ai.biz` Agent OS

**Date:** 2026-07-09  
**Reviewer:** Session agent (autonomous review per `@session-biz context`)  
**Scope:** All uncommitted changes on `main` — do not merge as-is without addressing items below  
**Goal assessed:** Reliable, consistent, professional business/marketing advisor skills (including content generation)

---

## Session context (read-only)

**Branch:** `main` (up to date with `origin/main`)  
**Last commit:** `48edba4` — fix: use commit-msg file path for prepare-commit-msg temp file  
**Working tree:** dirty — 26 modified files + 1 untracked directory (`skills/biz-youtube/`)

| # | File | Result | Note |
|---|------|--------|------|
| 1 | `.cursorrules` | pass | Core principles loaded; **not updated** in this diff |
| 2 | `.work.biz/context/HANDOFF.md` | pass | Last closed session 2026-07-07; stale vs current dirty tree |
| 3 | `.work.biz/plans/NEXT.md` | pass | Still lists archive regen + strategy population as next |
| 4 | `.work.biz/plans/UNKNOWNS.md` | pass | 5 open framework unknowns unchanged |

**Uncommitted status:** Staged 0 · Unstaged 26 · Untracked 1  
**Areas touched:** `skills/` (11), `standards/` (6), `scripts/` (4), `CONVENTIONS.md`, `README.md`, `PROCESS_ROUTER.md`, `concepts/`, `hooks/`

**Verification run on dirty tree:**

| Script | Result | Note |
|--------|--------|------|
| `framework-verify.sh` | PASS | Reports **23 skills** (includes untracked `biz-youtube`) |
| `gate-verify.sh` | PASS | See § Errors — column-index bug still latent |
| `blast-radius-check.sh` | **FAIL** | 8 areas, high risk — would block commit under enforcing pre-commit |
| `touch-scope-verify.sh` | skip | No `.work.biz/touch-scope` declared |

**Pick up here (from NEXT.md):** Regenerate `.tmp/*.skill` archives; populate `.work.biz/strategy/*` for host project.

**No HANDOFF/NEXT/UNKNOWNS writes** — this review is read-only per `@session-biz context`.

---

## Executive summary

This diff is a **substantial, directionally correct expansion**: canonical `.work.biz/strategy/` paths, YouTube as a first-class channel, stronger change-safety scripts, and a new `biz-youtube` ops skill mirroring the `biz-content` pattern. The architecture (craft → platform-adapt → ops) remains sound.

However, the change set is **not integration-complete**. It would fail the repo's own blast-radius gate, leaves multiple registry surfaces out of sync (22 vs 23 skills), and introduces **internal contradictions** (strategy filenames, YouTube CTR benchmarks, content route ownership, gate rules). For a framework whose promise is *reliable consistent professional advice*, those contradictions will cause agents to load conflicting instructions and route users incorrectly.

**Recommendation:** Do not commit as one blob. Split into 3–4 scoped commits after fixing blockers below. Treat this as a **fix-the-wiring pass**, not a content expansion pass.

---

## What is working well

1. **Strategy path canonicalization** — Moving reads/writes to `.work.biz/strategy/` in `CONVENTIONS.md`, `README.md`, `biz-director`, and most skills is the right structural fix. Eliminates the old `.work.biz/plans/strategy_*.md` ambiguity.

2. **`biz-review status` mode** — Adding a read-only readiness reporter closes a real gap. Pipeline-ready now has an explicit verification surface instead of implying `@biz-review status` without defining it.

3. **`biz-youtube` skill shape** — Follows the proven `biz-content` ops pattern (publish / plan / challenge / status), delegates scripting to `@content-social write youtube`, and includes production-capacity gating. Good separation of concerns.

4. **Change-safety hardening** — `touch-scope-verify.sh` now actually checks scope; `--warn-only` flags on scripts; pre-commit defaults to enforcing. Appropriate for a framework repo.

5. **`framework-verify.sh` improvements** — Frontmatter name ↔ folder match and non-empty standards checks catch drift early.

6. **Platform standard YouTube section** — `20260701-PLATFORM-ALGORITHM-STANDARD.md` YouTube block is actionable and aligns with the ops skills.

7. **`content-social icp` mode** — Wiring BIZ-08 (`concepts/linkedin-icp/prompt.md`) into a first-class invocation with a defined output path is valuable for LinkedIn-heavy users.

---

## Critical gaps and errors

### 1. Integration incomplete — `biz-youtube` invisible to orchestration layer

`skills/biz-youtube/` is **untracked** and absent from:

| Surface | Status |
|---------|--------|
| `.cursorrules` skills table | Missing |
| `templates/cursorrules.template` | Missing |
| `START_HERE.md` decision tree | Missing |
| `skills/biz-director/skill.md` intent map | Missing |
| `CHANGELOG.md` | Not updated for this work |

`PROCESS_ROUTER.md` and `skills/README.md` reference `@biz-youtube`, but the universal entry points (`@biz-director`, `@session-biz` → START_HERE) do not. Free-text requests like *"help me start a YouTube channel"* will miss routing.

**Severity:** High — breaks the "don't know which skill" promise.

---

### 2. Skill count drift (22 → 23)

| Source | Count |
|--------|-------|
| `README.md` line 32 | "22 skills in total" |
| `.work.biz/context/HANDOFF.md` | "22 skills registered" |
| `framework-verify.sh` (current tree) | **23** |
| `.cursorrules` | No `biz-youtube`; still lists old `content-social` description (no YouTube) |

Adopter projects copy `.cursorrules` from template — if template lags, thin-client deployments inherit stale skill registries.

**Severity:** High — documentation lies to agents.

---

### 3. Strategy artifact filename mismatch (will cause silent context misses)

`biz-strategy` **writes**:

- `strategy/one-pager.md`
- `strategy/offer-scope.md`
- `strategy/target-buyer-profile.md`
- `strategy/channel-plan.md`
- `strategy/certification.md`

But **`biz-brand`** and **`biz-objections`** still reference (after path fix):

- `strategy/strategy_niche_decision.md`
- `strategy/strategy_outreach_scripts.md`
- `strategy/strategy_website_positioning.md`

These files are **never produced** by `biz-strategy greenfield`. Agents following `biz-brand overhaul` will look for files that do not exist.

**Severity:** High — brand/overhaul workflows degrade to guessing.

**Fix direction:** Either map each legacy name to its canonical equivalent in a single standards table, or update all skill references to `one-pager.md` / `offer-scope.md` / `channel-plan.md`.

---

### 4. Gate rule contradictions on `content-social`

Three documents disagree:

| Document | Says |
|----------|------|
| `SKILL_DEPENDENCIES.md` | `content-social strategy` and `plan` **require strategy-ready** |
| `content-social/skill.md` § Gates | Entire skill has **no hard prerequisite gate** |
| `biz-director` gate-exempt table | Only `write` · `research` · `repurpose` · `status` exempt |

Additionally, `icp` mode is not listed in `SKILL_DEPENDENCIES.md` or `biz-director` gate-exempt table. Unclear whether `@content-social icp` should run pre-bootstrap.

**Severity:** High — `@biz-director` will either over-block or under-block.

---

### 5. YouTube content route ambiguity (`content-writing` vs `content-social`)

Both skills now own YouTube scripting:

- `content-writing/skill.md` — frontmatter + § YouTube script / video outline
- `content-social/skill.md` — `@content-social write youtube` / `write youtube shorts`
- `biz-youtube` — invokes `@content-social write youtube`

`biz-director` three-tier disambiguation (§ I1) does **not** mention YouTube or `biz-youtube`. `content-writing` still advertises YouTube in its description.

**Severity:** Medium-High — duplicate paths → inconsistent script format and packaging.

**Fix direction:** Pick one owner for YouTube *scripts* (`content-social` is the better fit given platform packaging rules). Demote `content-writing` YouTube section to "delegate to `@content-social write youtube`" or blog-to-video outline only.

---

### 6. Contradictory YouTube CTR benchmarks

| Source | "Good" CTR guidance |
|--------|---------------------|
| `biz-youtube/skill.md` | <2% problem; 2–5% average; 5–10% good |
| `20260701-PLATFORM-ALGORITHM-STANDARD.md` | Small channels **6–12%** typical; below 3% = rewrite title/thumbnail |
| `biz-youtube` success criteria | >2% CTR within 7 days |

An agent following `biz-youtube status` may tell a user 4% CTR is "average" while the binding standard says 6–12% is typical for small channels.

**Severity:** Medium — violates Core Principle 5 (evidence-first). None of these stats cite a source.

---

### 7. YouTube production capacity contradictions

| Source | Minimum for YouTube as primary channel |
|--------|----------------------------------------|
| `biz-strategy` channel fit table | 1–2 long-form/week **OR** 4–7 Shorts/week; 6-month commitment |
| `biz-youtube` low capacity | 1 long-form/**month**; 1 Short/week |
| `content-social` strategy output example | "1 long-form + 3–5 Shorts per week" |

Operators get conflicting answers on whether YouTube is viable at low capacity.

**Severity:** Medium — undermines trusted-advisor credibility.

---

### 8. `gate-verify.sh` column index bug

`check_table_section` is called with `desc_col=3` but error message says **"empty Notes"**. In `NEXT.md` Active tasks table, column 3 is **Status**, column 4 is **Notes**.

Currently passes only because Status is never empty — the Notes column is **not actually verified**.

**Severity:** Medium — gate gives false confidence.

---

### 9. `pipeline-ready` definition not enforceable

Docs now require: pricing set + tracker configured + **outreach cadence defined**, confirmed by `@biz-review status`.

But `gate-verify.sh` only checks for `pipeline_tracker.md` existence when "pipeline-ready" appears in NEXT.md. No check for outreach cadence artifact or pricing doc.

**Severity:** Medium — gate name oversells what scripts verify.

---

### 10. Bootstrap skeleton missing `strategy/` directory

`biz-bootstrap` and `templates/work/` create `context/`, `plans/`, `pipeline/`, `research/` — **not** `strategy/`, `drafts/`.

Yet every updated skill assumes `.work.biz/strategy/*`. First-run `@biz-strategy greenfield` creates files, but `@content-social` / `@biz-review status` before strategy will always report gaps with no placeholder path.

**Severity:** Medium — friction on greenfield projects; conflicts with DIRECTORY_MAP.

---

### 11. `standards/20260621-DIRECTORY_MAP.md` internal contradiction

Shows **both**:

```text
plans/strategy/              # nested under plans
strategy/                    # canonical location
```

Only one can be canonical. The nested path should be removed to avoid agent confusion.

**Severity:** Medium.

---

### 12. Platform count stale in `content-social`

Still says "all **6** platforms" in repurpose mode and time budget, but YouTube is now the 7th platform.

**Severity:** Low-Medium — operational instructions wrong.

---

## Smells (design / maintainability)

### A. `content-social/skill.md` at ~1,297 lines

Largest skill by far. Every platform addition increases agent context load linearly.

**Smell:** Monolith skill file. Consider extracting platform sections to `skills/content-social/platforms/{reddit,linkedin,youtube,...}.md` loaded on demand — same pattern as concepts/ for BIZ-08.

### B. Near-duplicate topic buckets across `biz-content` and `biz-youtube`

The four topic buckets (Architecture lesson, AI in practice, Experience insight, Project BTS) are copy-pasted with minor wording changes. Same for parts of challenge/calendar structure.

**Smell:** DRY violation. Extract shared `concepts/content-topic-buckets/` or reference one canonical table both ops skills import.

### C. Unverified market statistics repeated across files

Examples appearing multiple times without citation:

- "2.5–2.7 billion MAU"
- "68% of B2B buyers watch long-form video before purchasing"
- "78% of marketers cite YouTube as most effective"
- "AI-assisted editing reduced costs by ~40%"

**Smell:** Violates `.cursorrules` Core Principle 5. For a *professional advisor* framework, either cite sources in a `research/` reference doc or label **Unverified** inline.

### D. `biz-youtube` tracker path ambiguity

Skill mentions both:

- `.work.biz/plans/youtube-tracker.md`
- `.work.biz/pipeline/youtube-tracker.md`

Calendar goes to `plans/youtube-calendar.md`; challenge says `pipeline/youtube-tracker.md`; status section allows either.

**Smell:** Agents will scatter tracking files. Pick one location (recommend `pipeline/` alongside `pipeline_tracker.md`, calendars in `plans/`).

### E. Technology tilt underspecified in `content-social`

Quality checklist mentions "technology tilt (for tech-positioned projects)" but unlike `content-writing`, there is no explicit gate or fallback behavior for non-tech host projects — relevant to UNKNOWNS #2.

### F. Pre-commit enforcement vs blast-radius on this very diff

Pre-commit now **enforces** by default (`WARN_ONLY=0`). This 26-file / 8-area change **will fail** unless:

- `.work.biz/touch-scope` is declared covering all areas, or
- commit uses `WARN_ONLY=1`, or
- change is split into ≤2-area commits

**Smell:** Good safety, but this diff is its own counterexample — needs scoped commits + touch-scope discipline.

---

## Optimization — keeping the OS efficient and effective

### Context/token efficiency

| Issue | Impact | Recommendation |
|-------|--------|----------------|
| 1,297-line `content-social` loaded for any `@content-social write reddit` | High token burn | Split platform bodies; load only target platform section |
| Jump-to-section TOC + repeated universal rules | Medium | Keep parse table + I0 contract in `skill.md`; move R1–R6 to subfiles |
| Standards duplicated into skills (YouTube CTR, LinkedIn links) | Drift risk | Skills should **reference** standards by section, not restate benchmarks |

### Routing efficiency

| Issue | Impact | Recommendation |
|-------|--------|----------------|
| `biz-director` missing YouTube intents | Misroutes ~10–20% of video requests | Add intent cluster before commit |
| Two YouTube script paths | Wasted turns / rework | Single owner: `content-social` |
| `PROCESS_ROUTER` updated but not START_HERE | Operators use wrong entry doc | Sync both in same commit |

### Verification efficiency

| Issue | Impact | Recommendation |
|-------|--------|----------------|
| `gate-verify` Notes column bug | False PASS | Fix to `desc_col=4`; add self-test with fixture NEXT.md |
| `pipeline-ready` partial enforcement | False readiness | Define one evidence file (e.g. `pipeline/outreach-cadence.md`) and check it |
| Skill count not auto-checked in framework-verify | Drift | Assert README + `.cursorrules` skill table count matches `find skills -name skill.md \| wc -l` |

### Operator efficiency (business outcomes)

| Strength | Keep |
|----------|------|
| Production capacity check in `biz-youtube` | Prevents unrealistic cadence — good advisor behavior |
| `@biz-review status` | Enables `@biz-director` gate checks without weekly review overhead |
| ICP as `@content-social icp` | Reduces LinkedIn spray-and-pray — high leverage for B2B |

| Weakness | Fix |
|----------|-----|
| No bootstrap `strategy/` placeholder | Add empty `strategy/.gitkeep` + README stub in templates |
| Generative skills without strategy still guess | Expand bundled example profile (mentioned in SKILL_DEPENDENCIES) — ensure it exists and is referenced |

---

## Assumption ledger (this review)

**Confirmed (from repo evidence):**

- 26 modified + 1 untracked skill directory on dirty tree
- `framework-verify.sh` passes with 23 skills
- `blast-radius-check.sh` fails on current diff (8 areas)
- Strategy canonical path is `.work.biz/strategy/` per CONVENTIONS + biz-strategy work tree
- `biz-strategy` output filenames do not match `biz-brand` referenced filenames

**Inferred (likely, not proven by running adopters):**

- Users invoking YouTube via `@biz-director` will get wrong routing until director is updated
- Agents loading both `content-writing` and `content-social` for YouTube will produce inconsistent deliverables
- Enforcing pre-commit will frustrate contributors who don't declare touch-scope first

**Unknowns (need testing):**

- Whether 1,297-line `content-social` causes quality degradation in models with smaller context windows
- Whether pattern-based `@content-social research youtube` is sufficient vs live fetch (UNKNOWNS #4 — still open)
- Whether non-tech host projects hit false "technology tilt" failures (UNKNOWNS #2)

---

## Suggested commit split (when ready — not executed)

Do **not** land as one commit. Suggested order:

1. **Infrastructure:** scripts + hooks + gate fixes (`desc_col`, pipeline-ready checks)
2. **Path migration:** CONVENTIONS, standards DIRECTORY_MAP, strategy path references (fix filename mapping)
3. **YouTube channel layer:** `content-social` YouTube sections + platform standard + `biz-community` YouTube discovery
4. **Ops skill:** `biz-youtube` + registry sync (`.cursorrules`, template, START_HERE, biz-director, README, CHANGELOG, SKILL_DEPENDENCIES)
5. **Host project:** `.work.biz/strategy/*` population (separate from framework)

Each commit: declare `.work.biz/touch-scope`, run `framework-verify.sh`, expect blast-radius ≤2 areas.

---

## Residual risks if merged without fixes

1. **Agents certify pipeline-ready without outreach cadence** — user proceeds to discovery under-prepared.
2. **Brand overhaul reads wrong strategy files** — LinkedIn/website copy not aligned to certified strategy.
3. **YouTube users get inconsistent CTR advice** — credibility hit for "trusted advisor" positioning.
4. **Skill registry lies (22 vs 23)** — deploy-basic copies stale `.cursorrules` to new projects.
5. **Monolithic content-social grows unbounded** — each platform add slows every social content invocation.

---

## Completion gate (review task)

| # | Check | Result |
|---|-------|--------|
| 1 | Deliverable written | Yes — this file |
| 2 | Key assumptions cross-checked | Yes — git diff, script runs, file reads |
| 3 | Residual risks listed | Yes — § above |
| 4 | Concrete next step proposed | Yes — fix blockers §1–§12, then split commits |

**Next recommended action for owner:** Address § Critical gaps #1–#4 and #8 first (orchestration + filename mapping + gate consistency + gate-verify bug). Re-run `framework-verify.sh` + `blast-radius-check.sh` on each scoped slice. Do not regenerate `.tmp/*.skill` archives until `biz-youtube` is registered everywhere.

---

*Review mode: feedback only — no definitions were modified during this session.*
