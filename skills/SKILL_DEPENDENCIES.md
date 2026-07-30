# Skill Dependencies & Prerequisite Gates

## Gate Graph

```
biz-bootstrap init
       │
       │  (scaffold only — no gates)
       ▼
biz-strategy greenfield
       │
       │  Produces: strategy-ready (certified by @biz-strategy certify)
       ▼
biz-strategy certify
       │
       │  Gate: strategy-ready must be certified
       ▼
biz-brand audit / overhaul
       │
       │  Produces: brand-ready (strategy-certified + brand overhaul complete)
       ▼
biz-pricing set  ← requires strategy-ready
       │
biz-content publish  ← requires brand-ready (brand assets exist)
biz-youtube publish/plan/challenge ← no hard gate; benefits from brand-ready + strategy-ready
biz-community find/status ← no hard gate
biz-community engage ← requires brand-ready
content-social write ← no hard gate (improves with strategy-ready; best after @biz-community find)
content-social research ← no hard gate (improves with strategy-ready)
content-social repurpose ← no hard gate
content-social icp ← no hard gate (improves with strategy-ready; produces linkedin-icp.md)
content-social strategy ← requires strategy-ready
content-social plan ← requires strategy-ready
        │
        ▼
biz-discovery run  ← requires pipeline-ready; promotes sales-ready + active-deal
biz-proposal write ← requires pipeline-ready (pricing set)
biz-objections handle ← requires active-deal (roleplay is ungated)
biz-referrals ask  ← no strict gate (can start anytime)
       │
       │
├── biz-review weekly  ← requires at least one strategy doc
        ├── biz-market-validate test ← can run at any time (recommended before committing to a strategy)
        ├── biz-pipeline-diagnosis run ← requires pipeline tracker with data
        │
         │  ── Generative skills (no hard gate; run any time) ──
         ├── content-writing write/plan/repurpose/audit ← run any time (improves with strategy-ready + brand-ready)
         ├── content-social write/research/repurpose/icp ← run any time (improves with strategy-ready; best after @biz-community find)
         ├── business-ideas generate/stress/pivot ← run any time (improves with strategy-ready)
         └── product-service-ideas generate/extend/scope/audit ← run any time (improves with strategy-ready)
```

### Generative skills (no gate)

`content-writing`, `content-social`, `business-ideas`, and `product-service-ideas` are **project-aware generative skills**: they have **no prerequisite gate** for `write`, `research`, `repurpose`, and `audit` modes and can be invoked at any time, even before `biz-bootstrap init`. They load the host project's own context dynamically (`.cursorrules`, `.work.biz/strategy/*`, `README.md`, stack manifests) and fall back to a bundled example profile when none exists. They produce dramatically better output when the host project is bootstrapped and strategy-certified, because audience, offer, stack, and channel are then loaded from project memory rather than guessed.

## System skills (no gate)

`deploy-basic`, `deploy-files`, `deploy-repo`, and `session-biz` are **infrastructure skills** with no prerequisite gate. They can be invoked at any time to manage Business OS deployment, update, and session lifecycle (`@session-biz start` / `@session-biz close` / `@session-biz context`). Deployment skills do not interact with the business gate graph. `session-biz` is aliased as `session-control` (`@session-control start`, `@session-control context`, etc.).

## biz-director (meta-skill)

`biz-director` is the universal orchestrator. It has no gate itself — it can be invoked at any time. It reads project state and routes to the appropriate skill, checking that skill's prerequisites before executing.

---

## Gate Descriptions

`{WORK_BUSINESS_ROOT}/gates.md` is the single authoritative ledger of which gates are met. It is created by `@biz-bootstrap init` from `templates/work/gates.md.template` with every gate at `NOT MET`. A gate counts as met only when its section reads `**Status:** PASS`.

| Gate | State (ledger id) | Evidence | Promoted by (only writer) |
|------|-------------------|----------|---------------------------|
| — | scaffold | `.work.biz/` exists (no ledger entry) | `@biz-bootstrap init` |
| 1 | `strategy-ready` | `.work.biz/strategy/certification.md` | `@biz-strategy certify` |
| 2 | `brand-ready` | `.work.biz/reference/BRAND_STATUS.md` overhaul log with a passing five-second test | `@biz-brand overhaul` |
| 3 | `pipeline-ready` | `.work.biz/strategy/pricing.md` + `.work.biz/pipeline/pipeline_tracker.md` + `.work.biz/pipeline/outreach-cadence.md` | `@biz-review status` |
| 4 | `sales-ready` | Pipeline tracker with a completed discovery call logged | `@biz-discovery run` |
| 5 | `active-deal` | Pipeline tracker with a deal at Conversation stage or later | `@biz-discovery run` or `@biz-proposal write` |

**Two-layer enforcement.** Every gated skill self-verifies the ledger in its own I0 pre-check, and `biz-director` checks it before routing. Neither layer is the only one.

| Skill | Gate its I0 enforces | Ungated modes |
|-------|---------------------|---------------|
| `biz-brand` | `strategy-ready` | `status` |
| `biz-pricing` | `strategy-ready` | `status` |
| `biz-content` | `strategy-ready` then `brand-ready` | `status` |
| `biz-community` | `brand-ready` (`engage` only) | `find`, `status` |
| `biz-discovery` | `pipeline-ready` | `status` |
| `biz-proposal` | `pipeline-ready` | `status` |
| `biz-objections` | `active-deal` (`handle` only) | `roleplay`, `status` |
| `content-social` | `strategy-ready` (`strategy`, `plan` only) | `write`, `research`, `repurpose`, `icp`, `status` |

**Demotion.** A gate that no longer holds must be demoted, not left as a stale PASS. `@biz-strategy amend` demotes `strategy-ready` and cascades to `brand-ready`, `pipeline-ready`, and `sales-ready`. `@biz-review status` reconciles the whole ledger and demotes any gate whose evidence is missing. `scripts/gate-verify.sh` fails the build when a PASS lacks its evidence.

## Blocked Report Shape

When a skill stops because a prerequisite gate is not met:

```text
BLOCKED (prerequisite): <gate description>
  Required state: <state>
  Current state: <current state>
  To proceed: <command to run next>
```
