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
| A piece is drafted and saved or delivered | The drafting skill | Items row at `draft` (owner pass pending) or `ready` |
| A piece is published | The publish flow that shipped it | Items row → `published` + date + platform/URL; refresh Summary and By platform rows |
| A publish happened outside any skill ("I posted it yesterday") | `@biz-social log` | Same as above |
| A conversation comes from a piece | The skill logging the publish or the operator | The tracker's conversations column |

Every publish also follows the "What to do after a publish" checklist inside `CONTENT_STATUS.md` itself (platform tracker row, NEXT, HANDOFF, weekly metrics).

### Self-heal rule

If a content skill is about to record something and `CONTENT_STATUS.md` does not exist (project bootstrapped before the tracker shipped), create it from `templates/work/reference/CONTENT_STATUS.md.template` first, then record. Never skip the record because the file is missing.

### Split of records

`CONTENT_STATUS.md` is the cross-platform index of what exists and its state. `pipeline/<platform>-tracker.md` holds per-platform performance. Index here, metrics there; never merge them (see `standards/20260621-DIRECTORY_MAP.md` § Tracker rule).

## Business Phase Lifecycle

```
strategy-ready → brand-ready → pipeline-ready → sales-ready → execution → review
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
