# process-router — Business OS operator guide

**Purpose:** Read-only signpost that answers: *"Which skill should I run for this business question?"*

> Don't know which skill? **`@biz-director <describe what you want>`** — it routes for you.

## How to invoke

```text
@process-router - how do I find my niche?
@process-router - what do I do after defining my offer?
@process-router - how do I handle price objections?
@process-router - I'm stuck, what should I do next?
@process-router help
```

## Routing table

| If you want to... | Run this skill |
|---|---|
| Bootstrap `.work.biz/` and `.cursorrules` | `@biz-bootstrap init` |
| Define your niche, offer, and target buyer | `@biz-strategy greenfield` |
| Test if your niche/offer works | `@biz-market-validate test` |
| Fix your LinkedIn profile and brand | `@biz-brand overhaul` |
| Publish LinkedIn content | `@biz-content publish` |
| Price an engagement | `@biz-pricing set` |
| Run a discovery call | `@biz-discovery run` |
| Write a proposal | `@biz-proposal write` |
| Handle a sales objection | `@biz-objections handle` |
| Ask for referrals | `@biz-referrals ask` |
| Engage in communities | `@biz-community engage` |
| Diagnose pipeline bottlenecks | `@biz-pipeline-diagnosis run` |
| Review weekly progress | `@biz-review weekly` |
| Close your session | `@session-biz close` |
| Open a session | `@session-biz start` |
| Deploy `.ai.biz/` to another project | `@deploy-files copy - <path>` |

## Readiness states

`strategy-ready → brand-ready → pipeline-ready → sales-ready`

Only `@biz-strategy certify` can mark **strategy-ready**. Only `@biz-review status` can mark **pipeline-ready**.
