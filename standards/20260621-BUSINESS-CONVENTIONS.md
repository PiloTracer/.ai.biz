# Business Conventions

Binding conventions for the Business OS framework and all `biz-*` skills.

## Phase lifecycle

Every business moves through five readiness states:

```text
strategy-ready → brand-ready → pipeline-ready → sales-ready → active-deal
```

State is recorded in one place: `.work.biz/gates.md`. A state counts as reached only when its `**Status:**` value starts with the word `PASS`; trailing commentary such as `PASS 2026-07-25 - verified live` still counts, while `NOT MET`, `NOT ATTEMPTED`, `ACTIVATED`, `NONE`, and a missing section do not. Gate ids match on a normalized form, so `## active deal` resolves to `active-deal`. Skills must read the ledger before running gated operations, and must not infer a state from the presence of files.

**One writer per gate.** Exactly one skill may promote each state. This is binding: a second writer makes the ledger unverifiable, because no skill can be held responsible for a wrong PASS.

| State | Promoted by (only writer) | Evidence required |
|-------|---------------------------|-------------------|
| `strategy-ready` | `@biz-strategy certify` | `.work.biz/strategy/certification.md` exists and passes the internal gate |
| `brand-ready` | `@biz-brand overhaul` | `.work.biz/reference/BRAND_STATUS.md` has an overhaul entry with a passing five-second test; audit shows offer, proof, and CTA are clear |
| `pipeline-ready` | `@biz-review status` | `.work.biz/strategy/pricing.md`, `.work.biz/pipeline/pipeline_tracker.md`, and `.work.biz/pipeline/outreach-cadence.md` all exist and are filled in |
| `sales-ready` | `@biz-discovery run` | Pipeline tracker has at least one completed discovery call logged with BANT captured |
| `active-deal` | `@biz-discovery run` | Pipeline tracker has at least one deal at Conversation stage or later |

**Demotion is mandatory.** A state whose evidence no longer holds must be set back to `NOT MET`. `@biz-strategy amend` demotes `strategy-ready` and cascades downstream; `@biz-review status` reconciles the whole ledger. A stale PASS is worse than no gate at all, because downstream skills act on it.

## Document naming

| Type | Pattern | Location |
|------|---------|----------|
| Strategy documents | Flat canonical names (`one-pager.md`, `target-buyer-profile.md`, `offer-scope.md`, `channel-plan.md`, `pricing.md`) | `.work.biz/strategy/` |
| Plans | `plan_<topic>.md` or `NEXT.md` / `UNKNOWNS.md` | `.work.biz/plans/` |
| Research | `research_<topic>.md` | `.work.biz/research/` |
| Drafts | `draft_<topic>.md` | `.work.biz/drafts/` |
| Pipeline tracker | `pipeline_tracker.md` | `.work.biz/pipeline/` |
| Handoff | `HANDOFF.md` | `.work.biz/context/` |

`strategy_<topic>.md` is a historical / ad-hoc pattern only; new strategy docs use the flat canonical names above.

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
- Gate-exempt skills: `biz-writing`, `biz-social` (write/research/repurpose/icp modes), `biz-ideas`, `biz-products`, `biz-market-validate`, `biz-community` (find/status modes), `biz-objections` (roleplay mode), and every skill's `status` mode.
- Gated skills must record their output to `.work.biz/` and, where applicable, update the pipeline tracker or HANDOFF.
- A gated skill reads `.work.biz/gates.md` in its own I0 pre-check. It does not rely on `biz-director` having checked first.
- Every documented gate must have a promoting skill and a machine-checkable evidence path. A gate nothing can promote is not a gate; either implement the promotion or remove the claim.
- Gate ids are the hyphenated forms `strategy-ready`, `brand-ready`, `pipeline-ready`, `sales-ready`, `active-deal`. Use these exact ids in ledger sections and skill pre-checks so the ledger stays greppable.

## Change safety

Before any commit or completion claim:

1. Declare scope in `.work.biz/touch-scope`.
2. Run `bash scripts/touch-scope-verify.sh`.
3. Run `bash scripts/blast-radius-check.sh`.
4. Run `bash scripts/gate-verify.sh`.
5. Run `bash scripts/framework-verify.sh`.

A failing gate blocks the commit unless the user explicitly overrides.
