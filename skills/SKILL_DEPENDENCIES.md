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
biz-community engage ← requires brand-ready
       │
       ▼
biz-discovery run  ← requires pipeline-ready (pipeline tracker set up)
biz-proposal write ← requires pricing set
biz-objections handle ← requires active deal
biz-referrals ask  ← no strict gate (can start anytime)
       │
       │
       ├── biz-review weekly  ← requires at least one strategy doc
       ├── biz-market-validate test ← can run at any time (recommended before committing to a strategy)
       └── biz-pipeline-diagnosis run ← requires pipeline tracker with data
```

## biz-director (meta-skill)

`biz-director` is the universal orchestrator. It has no gate itself — it can be invoked at any time. It reads project state and routes to the appropriate skill, checking that skill's prerequisites before executing.

---

## Gate Descriptions

| Gate | State | Check | Unlocked by |
|------|-------|-------|-------------|
| — | scaffold | `.work.biz/` exists | `@biz-bootstrap init` |
| 1 | strategy-ready | Niche + offer + buyer defined and certified | `@biz-strategy greenfield` + `@biz-strategy certify` |
| 2 | brand-ready | LinkedIn/website aligned to offer | `@biz-brand audit` + `@biz-brand overhaul` |
| 3 | pipeline-ready | Pipeline tracker configured, pricing set | `@biz-pricing set` + `@biz-review status` |
| 4 | sales-ready | Discovery call run, process verified | `@biz-discovery run` |
| 5 | active deal | At least one deal in pipeline tracker at Conversation stage or later | `@biz-discovery run` or `@biz-proposal write` |

## Blocked Report Shape

When a skill stops because a prerequisite gate is not met:

```text
BLOCKED (prerequisite): <gate description>
  Required state: <state>
  Current state: <current state>
  To proceed: <command to run next>
```
