# Business OS — Framework Conventions

## Naming Conventions

### Skills
- Format: `{prefix}-{role}` in **kebab-case** (lowercase ASCII, hyphens)
- Business OS prefix: `biz-` (e.g., `biz-strategy`, `biz-content`, `biz-community`)
- System skills: `biz-deploy-basic`, `biz-deploy-files`, `biz-deploy-repo`, `biz-session`, `biz-director` (meta-orchestrator)
- Generative/entry-level skills: plain descriptive role name under the same `biz-` prefix (e.g., `biz-writing`, `biz-social`, `biz-ideas`, `biz-products`). These have no hard prerequisite gate and load project context dynamically.

### Documents
- Canonical strategy files use flat names under `.work.biz/strategy/`: `one-pager.md`, `target-buyer-profile.md`, `offer-scope.md`, `channel-plan.md`, `pricing.md`, `assumption-ledger.md`, `certification.md`, `changelog.md`
- Historical/ad-hoc strategy documents: `strategy_<topic>.md` under `.work.biz/plans/` - these must defer to `strategy/` on any conflict
- Plans: `plan_<topic>.md` under `.work.biz/plans/`
- Drafts: `draft_<topic>.md` under `.work.biz/drafts/`
- Research: `research_<topic>.md` under `.work.biz/research/`
- Use `YYYYMMDD-` prefix for dated documents

**Path rule:** `biz-strategy` writes strategy artifacts to `.work.biz/strategy/`. All other skills read strategy artifacts from `.work.biz/strategy/`. `strategy_*.md` files under `.work.biz/plans/` are historical/ad-hoc only; on any conflict, `strategy/` is canonical.

### Project Memory (`.work.biz/`)
- `gates.md` — readiness ledger (authoritative gate state)
- `context/HANDOFF.md` — session handoff
- `plans/NEXT.md` — next actions
- `plans/UNKNOWNS.md` — open questions
- `pipeline/pipeline_tracker.md` — sales pipeline
- `reference/CONTENT_STATUS.md` — publish/status tracker
- `ideas/` — generated content pieces, one subdir per content type, one directory per piece
- `ideas.archive/` — published pieces, moved from `ideas/` with the structure mirrored (see Archive rule)
- `reference/BRAND_STATUS.md` — brand audit history and overhaul log
- `reference/VOICE_PROFILE.md` — canonical voice definition (binding for all content skills)
- `reference/VOICE_RETRO.md` — draft vs owner edits; amend the voice profile when an edit class repeats three times
- `strategy/` — strategy artifacts (canonical location; see Document naming below)

## Content Status Protocol (binding for all content skills)

`.work.biz/reference/CONTENT_STATUS.md` is the single source of truth for what content exists and whether it is published. A tracker nobody writes to is indistinguishable from no tracker, so every content-producing skill both reads and writes it.

### Lifecycle states

| Status | Meaning |
|--------|---------|
| `draft` | Written, needs owner edits or an owner pass before it is publishable |
| `ready` | Publication-ready, waiting to be posted |
| `published` | Live on a platform, with date and URL |
| `blocked` | Cannot proceed; the Note column says why |
| `hold` | Deliberately parked; the Note column says until what |

### Read rule (before drafting)

Every content skill (`biz-writing`, `biz-social`, `biz-content`, `biz-youtube`) reads `CONTENT_STATUS.md` in its context load when the file exists. Before choosing a topic or drafting: never re-draft a piece marked `published` on the same platform, and prefer advancing a `ready` or `draft` piece over starting a new one.

### Write rule (after producing or publishing)

| Event | Who records it | Where |
|-------|----------------|-------|
| A piece is drafted and saved or delivered | The drafting skill | Items row at `draft` (owner pass pending) or `ready`, with its pillar |
| A piece is published | The publish flow that shipped it | Items row → `published` + date + platform/URL; refresh Summary, By platform, and By pillar rows |
| A publish happened outside any skill ("I posted it yesterday") | `@biz-social log` | Same as above |
| A conversation comes from a piece | The skill logging the publish or the operator | The tracker's conversations column and the By pillar row |

Every publish also follows the "What to do after a publish" checklist inside `CONTENT_STATUS.md` itself (platform tracker row, VOICE_RETRO entry, NEXT, HANDOFF, weekly metrics).

**Pillar traceability:** every piece registers under one pillar, and a pillar is one of the 3–5 strategic messages traceable to `strategy/one-pager.md` / `strategy/offer-scope.md`. Drafting and plan skills assign the pillar at registration, never retroactively in bulk; a published piece with no pillar is a recording failure. `@biz-review quarterly` aggregates conversations per pillar, which is how content performance flows back into strategy instead of dying in the tracker.

### Self-heal rule

If a content skill is about to record something and `CONTENT_STATUS.md` does not exist (project bootstrapped before the tracker shipped), create it from `templates/work/reference/CONTENT_STATUS.md.template` first, then record. Never skip the record because the file is missing.

### Split of records

`CONTENT_STATUS.md` is the cross-platform index of what exists and its state. `pipeline/<platform>-tracker.md` holds per-platform performance. Index here, metrics there; never merge them (see `standards/20260621-DIRECTORY_MAP.md` § Tracker rule).

### Archive rule

Generated content pieces live under `.work.biz/ideas/<subdir>/<piece>/` (one subdir per content type, one directory per piece). When the operator asks to archive published content, `@biz-archive` moves every piece whose tracker row is `published` from `ideas/<subdir>/<piece>` to `ideas.archive/<subdir>/<piece>`, mirroring the subdirectory structure.

- **The publish record survives with the piece.** Each archived directory gets its own `status.md` (per piece, never a centralized `ideas.archive/status.md` — a shared file would need rewriting on every run) carrying the tracker row's data: status, published date, platform/URL, pillar, note. Only after that file is written and verified does the piece's row leave `CONTENT_STATUS.md`.
- **The tracker slims to the active inventory.** `CONTENT_STATUS.md` lists what is live (`draft`, `ready`, `blocked`, `hold`) plus published pieces not yet archived. Archived pieces leave the Items table; their history lives in the per-piece `status.md` and `pipeline/<platform>-tracker.md`. Lifetime aggregates (By platform `Last publish`, By pillar conversations) stay truthful in the tracker.
- **Only piece directories move.** Loose files, category `README.md`s, research notes, backup dirs (`_revert_*`), and the legacy `ideas/VOICE_STANDARD.md` voice fallback never move. Pieces not marked `published` stay in `ideas/`.
- **Git discipline.** Tracked pieces move with `git mv` (staged rename, never committed by the skill), untracked pieces with plain `mv`. The skill never commits, pushes, or deletes; committing is the owner's call.
- **Idempotent.** Already-archived pieces are detected and skipped; a missing `status.md` on an already-moved piece is healed from the tracker row on re-run.

## Context budget (binding for session and content skills)

The session-start files — `context/HANDOFF.md`, `plans/NEXT.md`, `plans/UNKNOWNS.md`, `reference/CONTENT_STATUS.md` — are read on every `@biz-session start` and by every content skill's context load. Files that grow without bound tax every session, so they stay lean by rule:

- **Move, never delete.** History leaves the live file only into a sibling archive file — `context/HANDOFF.archive.md`, `plans/NEXT.archive.md`, `plans/UNKNOWNS.archive.md` — with a one-line pointer left behind in the live file. Nothing is ever dropped without a new home.
- **HANDOFF:** the live file carries the status header, recent session blocks, pending tasks, key decisions, and quick reference. Older session blocks move to `HANDOFF.archive.md` (newest-first preserved). Done at `@biz-session close`.
- **NEXT:** completed items collapse to one-liners with record pointers; long resolved narration moves to `NEXT.archive.md`. Recommended-next stays fully spelled out.
- **UNKNOWNS:** resolved rows move to `UNKNOWNS.archive.md` with a pointer row; open rows are never touched.
- **CONTENT_STATUS:** tracks the active inventory only — archived published pieces leave the Items table once their per-piece `status.md` exists (see Archive rule). Lifetime aggregates stay.

A live file that needs its history for a current decision is a sign the decision was never recorded as a decision — put it in Key decisions, not in the scrollback.

## Voice loop (binding for all content skills)

`reference/VOICE_PROFILE.md` is a hypothesis about how the owner sounds; `reference/VOICE_RETRO.md` is the measurement of whether it holds. The loop only works if every publish records an entry, so the recording step is mandatory, not aspirational.

### Record rule

Every publish flow (`biz-content publish`, `biz-youtube publish`, `biz-social log`, and any skill recording a publish) adds or updates the piece's entry in `reference/VOICE_RETRO.md` in the same session: owner pass done or waived, owner-edit count, and edit classes. If the file does not exist, create it from `templates/work/reference/VOICE_RETRO.md.template` first; a missing retro is never a reason to skip the record.

### Empty-profile warning

If `VOICE_PROFILE.md` exists but is still a skeleton (`<` placeholders remain, or no reference sample is filled), content skills say so in the context summary and treat it as absent: drafts fall back to generic human-voice defaults, and the artifact adds a step without adding value until the owner fills it. `@biz-bootstrap status` reports the same warning.

### Amendment rule

When the same edit class appears three times in `VOICE_RETRO.md`, amend `VOICE_PROFILE.md` instead of letting the owner make the same correction forever. `@biz-review weekly` checks retro coverage against publishes; `@biz-review quarterly` reads the trend row.

## Evidence discipline (binding on framework docs and produced content)

A statistic that states something about the world (market size, behavior rates, benchmarks, conversion figures) must carry one of exactly two marks, in the same sentence or line:

1. **An inline citation** — a named source with enough detail to find it (name + year minimum, URL preferred), or
2. **An explicit directional marker** — `directional`, `rule of thumb`, `hypothesis to validate`, or `Unverified`, stating that the figure is a heuristic, not a measured fact.

Numbers that are advice rather than claims are exempt by nature and need no marker: buffers ("add 20–30% for unknowns"), format specs ("7–10 slides"), cadence guidance, and price-math examples. The test is: does this number assert how the world *is*, or prescribe what the operator should *do*? Only the first kind needs a citation or a directional marker.

This applies to skills, standards, and concepts (framework prose) as much as to produced content. It is enforced by review, not by a machine check: a grep-based uncited-statistic scanner was evaluated (2026-08-10) and rejected because it cannot tell a claim from advice and drowns real findings in false positives. When prose review finds an unmarked claim, fix it the way `biz-referrals` was fixed: find the source, or de-claim the number into directional language.

## Business Phase Lifecycle

```
strategy-ready → brand-ready → pipeline-ready → sales-ready → active-deal
```

### Phase Definitions

Gate state lives in `.work.biz/gates.md`. One skill promotes each gate; see `skills/SKILL_DEPENDENCIES.md` § Gate Descriptions for evidence paths and `standards/20260621-BUSINESS-CONVENTIONS.md` § Phase lifecycle for the binding rules.

| Phase | Key Deliverables | Gate to pass | Promoted by |
|-------|-----------------|--------------|-------------|
| **Strategy** | Niche decision, unified offer, target buyer, channel plan | strategy-ready | `@biz-strategy certify` |
| **Brand** | LinkedIn profile, website, brand assets | brand-ready | `@biz-brand overhaul` |
| **Pipeline** | Pipeline tracker configured, pricing set, outreach cadence documented in `.work.biz/pipeline/outreach-cadence.md` | pipeline-ready | `@biz-review status` |
| **Sales** | Discovery, proposals, objection handling | sales-ready, then active-deal | `@biz-discovery run` |
| **Execution** | Content, community, referrals, delivery | N/A (ongoing) | — |
| **Review** | Weekly metrics, quarterly retro, pipeline diagnosis | N/A (ongoing) | — |

## Core Principles

1. **Start with strategy.** Never execute before you know your niche and offer.
2. **Attract, don't hunt.** Inbound > cold outreach for high-trust services.
3. **One offer, one message.** Multi-service positioning dilutes impact.
4. **Evidence over opinion.** Every claim needs a source.
5. **Test before commit.** Validate with low-cost experiments before going all-in.
6. **Fixed price, milestone-gated.** Never charge hourly for outcomes.
