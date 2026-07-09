# process-router — Business OS operator guide

**Purpose:** Read-only signpost that answers: *"Which skill should I run for this business question?"*

> **Don't know which skill?** Use `@biz-director - <describe what you want>` and let it route for you. If the work spans `.ai` + `.ai.ui` + `.ai.biz`, use `@x-director - <describe what you want>`.

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
| Create a YouTube video | `@content-social write youtube` · `@biz-youtube publish` |
| Plan YouTube content strategy / calendar | `@biz-youtube plan` |
| Audit / rebrand a YouTube channel | `@biz-brand audit` (YouTube section) |
| Plan YouTube Shorts strategy | `@content-social write youtube shorts` |
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
| Free-text request / don't know skill | `@biz-director - <describe what you want>` · `@x-director - <describe what you want>` (cross-framework) |
| Deploy `.ai.biz/` to another project | `@deploy-files copy - <path>` |
| Write a post / article / case study / landing page / email / thread | `@content-writing write - <topic>` |
| Build a content calendar / topic plan | `@content-writing plan - <horizon>` |
| Repurpose one piece into multiple formats | `@content-writing repurpose - <source>` |
| Critique an existing draft | `@content-writing audit - <draft or path>` |
| Generate business / venture / pivot ideas | `@business-ideas generate - <domain>` |
| Stress-test one business idea | `@business-ideas stress - <idea>` |
| Pivot directions from current business | `@business-ideas pivot - <situation>` |
| Generate product / service / SaaS / add-on concepts | `@product-service-ideas generate - <space>` |
| Extension concepts for an existing product | `@product-service-ideas extend - <product>` |
| Scope a minimal MVP for one concept | `@product-service-ideas scope - <concept>` |
| Evaluate one product concept (Go/Refine/Kill) | `@product-service-ideas audit - <concept>` |

## Readiness states

`strategy-ready → brand-ready → pipeline-ready → sales-ready`

Only `@biz-strategy certify` can mark **strategy-ready**. Only `@biz-review status` can mark **pipeline-ready**.
