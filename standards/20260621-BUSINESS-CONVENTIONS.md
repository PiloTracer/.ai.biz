# Business Conventions

Binding conventions for the Business OS framework and all `biz-*` skills.

## Phase lifecycle

Every business moves through four readiness states:

```text
strategy-ready → brand-ready → pipeline-ready → sales-ready
```

Only the listed skill can mark a state ready. Skills must check the current state before running gated operations.

| State | Set by | Evidence required |
|-------|--------|-------------------|
| `strategy-ready` | `@biz-strategy certify` | `.work.biz/strategy/certification.md` exists and passes internal gate |
| `brand-ready` | `@biz-brand overhaul` or `@biz-strategy certify` (if brand is in scope) | LinkedIn and/or website audit shows offer, proof, and CTA are clear |
| `pipeline-ready` | `@biz-review status` after `@biz-pricing set` | Pipeline tracker exists, pricing documented, outreach cadence defined |
| `sales-ready` | `@biz-review status` (advanced) | Active deals in pipeline, proposal template ready, objection handling practiced |

## Document naming

| Type | Pattern | Location |
|------|---------|----------|
| Strategy documents | `strategy_<topic>.md` | `.work.biz/strategy/` |
| Plans | `plan_<topic>.md` or `NEXT.md` / `UNKNOWNS.md` | `.work.biz/plans/` |
| Research | `research_<topic>.md` | `.work.biz/research/` |
| Drafts | `draft_<topic>.md` | `.work.biz/drafts/` |
| Pipeline tracker | `pipeline_tracker.md` | `.work.biz/pipeline/` |
| Handoff | `HANDOFF.md` | `.work.biz/context/` |

**Critical:** `biz-strategy` writes to `.work.biz/strategy/`. All other skills read strategy artifacts from `.work.biz/strategy/`. No skill should look for `strategy_*.md` under `.work.biz/plans/`.

## Core operating principles

1. **Start with strategy.** Do not build brand, content, or pipeline before the offer, niche, and target buyer are defined.
2. **Attract, don't hunt.** Content and brand create inbound demand; cold outreach is a supplement, not a strategy.
3. **One offer, one message.** Every public asset points to the same primary offer.
4. **Evidence over opinion.** Every major claim cites a source: user docs, web research, or stated constraints.
5. **Test before commit.** Validate offers and channels with small experiments before scaling spend or effort.
6. **Fixed price, milestone-gated.** See `standards/20260621-PRICING-STANDARD.md`.
7. **Truth before speed.** Never claim completion when data shows gaps.

## Gate discipline

- A skill must refuse to run a gated operation if its prerequisite state is not met, unless it is explicitly gate-exempt.
- Gate-exempt skills: `content-writing`, `content-social` (write/research/repurpose modes), `business-ideas`, `product-service-ideas`, `biz-market-validate`.
- Gated skills must record their output to `.work.biz/` and, where applicable, update the pipeline tracker or HANDOFF.

## Change safety

Before any commit or completion claim:

1. Declare scope in `.work.biz/touch-scope`.
2. Run `bash scripts/touch-scope-verify.sh`.
3. Run `bash scripts/blast-radius-check.sh`.
4. Run `bash scripts/gate-verify.sh`.
5. Run `bash scripts/framework-verify.sh`.

A failing gate blocks the commit unless the user explicitly overrides.
