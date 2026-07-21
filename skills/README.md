# Business OS skills (`.ai.biz/skills/`)

Portable, tool-agnostic business workflows. Each skill is a folder with `skill.md`.

**Identifiers:** Folder name = stable skill id (YAML `name:` in `skill.md` must match). Invoke as `@<skill-id>`.

**Invocation punctuation:** Use ASCII hyphen `-` between verb and argument (`@biz-strategy greenfield`).

**Work tree paths:** `{WORK_BUSINESS_ROOT}` = `.work.biz/` at project root.

---

## Naming protocol

| Rule | Requirement |
|------|-------------|
| **Shape** | `{prefix}-{role}` in **kebab-case** |
| **Business prefix** | `biz-` (e.g., `biz-strategy`, `biz-content`) |
| **System prefix** | `deploy-`, `session-` for infrastructure skills |
| **Generative prefix** | plain descriptive name (`content-writing`, `business-ideas`, `product-service-ideas`) for project-aware generative skills with no hard gate |
| **Stable id** | Folder name = `name:` in frontmatter = `@` handle |

---

## Registered skills

| Skill id | Folder | Role |
|----------|--------|------|
| deploy-basic | `deploy-basic/` | Thin-client bootstrap (`.cursorrules` + `.work.biz/`); skills load via `AGENT_OS_SOURCE` |
| deploy-files | `deploy-files/` | Deploy `.ai.biz/` files into target project |
| deploy-repo | `deploy-repo/` | Full git-based deploy (clone or archive) |
| biz-bootstrap | `biz-bootstrap/` | Scaffold `.work.biz/`, `.cursorrules` from templates |
| biz-strategy | `biz-strategy/` | Define niche, offer, positioning; certifies **strategy-ready** |
| biz-brand | `biz-brand/` | Audit/overhaul LinkedIn, website, brand presence |
| biz-pricing | `biz-pricing/` | Value-based pricing for any engagement |
| biz-content | `biz-content/` | LinkedIn publishing ops: publish, plan, 30-day challenge (#CreateImpact), tracker |
| biz-youtube | `biz-youtube/` | YouTube publishing ops: publish, plan, 30-day challenge, analytics status |
| biz-community | `biz-community/` | Community engagement without selling |
| biz-referrals | `biz-referrals/` | Systematic referral generation |
| biz-discovery | `biz-discovery/` | Sales discovery calls |
| biz-proposal | `biz-proposal/` | Proposal writing and scoping |
| biz-objections | `biz-objections/` | Handle sales objections |
| biz-review | `biz-review/` | Weekly/quarterly business review |
| biz-market-validate | `biz-market-validate/` | Test offers before committing |
| biz-pipeline-diagnosis | `biz-pipeline-diagnosis/` | Find and fix funnel bottlenecks |
| session-biz | `session-biz/` | Session open/close, HANDOFF, NEXT |
| biz-director | `biz-director/` | Universal orchestrator; maps free-text requests to correct skills, checks gates, chains execution |
| content-writing | `content-writing/` | Craft of writing articles, posts, case studies, landing pages, emails — project-aware, technology-tilted |
| content-social | `content-social/` | Platform-native social content (Reddit, Instagram, LinkedIn incl. carousel + native video, Facebook, X, YouTube incl. Shorts). Write, research, repurpose, plan. |
| business-ideas | `business-ideas/` | Structured, stress-tested business/venture idea generation; archetypes + assumption ledger |
| product-service-ideas | `product-service-ideas/` | Buildable, stack-fit product/service concepts + MVP scoping + prioritization matrix |

**Typical flow (greenfield):** `@biz-bootstrap init` → `@biz-strategy greenfield` → `@biz-strategy certify` → `@biz-brand audit` → `@biz-pricing set` → `@biz-community find` → `@content-social strategy` → `@content-social write` → `@biz-youtube plan` → ...

---

## Canonical command vocabulary

| Verb | Meaning |
|------|---------|
| `status` | Read-only state report |
| `init` | One-time setup |
| `greenfield` | Generate full output from scratch |
| `probe` | Adaptive gap-driven questioning |
| `certify` | Gate check + state promotion |
| `amend` | Record a strategy change made outside greenfield; fold out-of-tree strategy docs back in (biz-strategy) |
| `audit` | Read-only assessment |
| `overhaul` | Full rewrite/restructure |
| `publish` | Create and distribute content |
| `set` | Configure a value |
| `run` | Execute a process |
| `prepare` | Pre-work before execution |
| `write` | Author a document |
| `handle` | Respond to a situation |
| `ask` | Request something (referrals) |
| `engage` | Participate in community |
| `test` | Run a validation experiment |
| `design` | Plan an experiment |
| `review` | Assess a proposal before sending (biz-proposal) or assess business performance (biz-review) |
| `plan` | Create a content/publishing plan |
| `challenge` | 30-day LinkedIn consistency program (biz-content) |
| `revise` | Update an existing decision |
| `find` | Find communities to join (biz-community) |
| `weekly` | Weekly business review (biz-review) |
| `quarterly` | Quarterly strategic review (biz-review) |
| `roleplay` | Practice objection handling (biz-objections) |
| `close` / `start` | Session bookends |
| `clone` / `archive` | Deploy modes |
| `copy` | Deploy files mode |
| `write` | Author content (content-writing, content-social) |
| `repurpose` | Spin one asset into multiple formats (content-writing, content-social) |
| `research` | Discover trending topics, active discussions, content gaps on a platform (content-social) |
| `generate` | Produce a set of structured concepts/ideas (business-ideas, product-service-ideas) |
| `stress` | Stress-test/kill one idea (business-ideas) |
| `pivot` | Generate pivot directions from an existing business (business-ideas) |
| `extend` | Extension concepts for an existing product (product-service-ideas) |
| `scope` | Produce a ruthlessly minimal MVP definition (product-service-ideas) |
| `find` | Discover communities/subreddits/accounts/groups on a platform (biz-community) |
