# Business OS — Framework Conventions

## Naming Conventions

### Skills
- Format: `{prefix}-{role}` in **kebab-case** (lowercase ASCII, hyphens)
- Business OS prefix: `biz-` (e.g., `biz-strategy`, `biz-content`, `biz-community`)
- System skills: `deploy-files`, `deploy-repo`, `session-biz`, `biz-director` (meta-orchestrator)
- Generative/entry-level skills: plain descriptive name without prefix (e.g., `content-writing`, `content-social`, `business-ideas`, `product-service-ideas`). These have no hard prerequisite gate and load project context dynamically.

### Documents
- Strategy documents: `strategy_<topic>.md` under `.work.biz/strategy/`
- Plans: `plan_<topic>.md` under `.work.biz/plans/`
- Drafts: `draft_<topic>.md` under `.work.biz/drafts/`
- Research: `research_<topic>.md` under `.work.biz/research/`
- Use `YYYYMMDD-` prefix for dated documents

**Path rule:** `biz-strategy` writes strategy artifacts to `.work.biz/strategy/`. All other skills read strategy artifacts from `.work.biz/strategy/`. No skill should look for `strategy_*.md` under `.work.biz/plans/`.

### Project Memory (`.work.biz/`)
- `context/HANDOFF.md` — session handoff
- `plans/NEXT.md` — next actions
- `plans/UNKNOWNS.md` — open questions
- `pipeline/pipeline_tracker.md` — sales pipeline
- `strategy/` — strategy artifacts (canonical location; see Document naming below)

## Business Phase Lifecycle

```
strategy-ready → brand-ready → pipeline-ready → sales-ready → execution → review
```

### Phase Definitions

| Phase | Key Deliverables | Gate to pass |
|-------|-----------------|--------------|
| **Strategy** | Niche decision, unified offer, target buyer, channel plan | strategy-ready |
| **Brand** | LinkedIn profile, website, brand assets | brand-ready |
| **Pipeline** | Pipeline tracker configured, pricing set, outreach cadence documented in `.work.biz/pipeline/outreach-cadence.md`, confirmed by `@biz-review status` | pipeline-ready |
| **Sales** | Discovery, proposals, objection handling | sales-ready |
| **Execution** | Content, community, referrals, delivery | N/A (ongoing) |
| **Review** | Weekly metrics, quarterly retro, pipeline diagnosis | N/A (ongoing) |

## Core Principles

1. **Start with strategy.** Never execute before you know your niche and offer.
2. **Attract, don't hunt.** Inbound > cold outreach for high-trust services.
3. **One offer, one message.** Multi-service positioning dilutes impact.
4. **Evidence over opinion.** Every claim needs a source.
5. **Test before commit.** Validate with low-cost experiments before going all-in.
6. **Fixed price, milestone-gated.** Never charge hourly for outcomes.
