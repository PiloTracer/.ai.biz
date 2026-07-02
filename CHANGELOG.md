# Changelog

All notable changes to Business OS are documented here.

## [Unreleased]

### Added
- (future)

## [v0.4.3] - 2026-07-02

### Added
- **`content-social` skill** — platform-native content for Reddit, Instagram, LinkedIn, Facebook, X
- **Content platform algorithm** concept and binding standard
- **GitHub Actions CI** — `framework-verify.yml` runs on push/PR to main and on version tags
- **Deploy safety modes** — no-overwrite default on deploy scripts; `--update` and `--force` flags

### Changed
- **`deploy-files` / `deploy-basic` / `deploy-repo`** — aligned no-overwrite/update/force behavior across scripts and skills
- **`framework-verify.sh`** and **`bootstrap.sh`** — updated verification and bootstrap flow
- **`README.md`** — Linux platform note, customization guidance, 22 skills, deploy-basic in skills table
- **LinkedIn external-link rule** enforced across content skills
- **`session-control`** alias for `session-biz`

### Removed
- **tools-project integration** from Business OS — parent Agent OS (`.ai/`) now owns MCP/host config

## [v0.4.2] - 2026-07-01

### Added
- **`deploy-basic` skill** — thin-client bootstrap of Business OS into target projects. Copies only `.cursorrules` (with `AGENT_OS_SOURCE` pointer) + `.work.biz/` skeleton; skills resolve from source at runtime. Supports `@deploy-basic`, `@deploy-basic update` (rules-aware merge), `@deploy-basic status`
- **`scripts/deploy-basic.sh`** — shell script implementing the thin-client deploy protocol with no-overwrite, `--update`, and `--force` modes
- **Source resolution section** in `.cursorrules` and template — fat-client vs thin-client mode detection, `AGENT_OS_SOURCE` pointer mechanism, path resolution rules, chicken-and-egg escape
- **`session-biz context` mode** — read-only full context load (HANDOFF, NEXT, UNKNOWNS) with uncommitted-aware git snapshot; no files written

### Changed
- `.cursorrules` — registered deploy-basic skill in skills table; added Source resolution section
- `templates/cursorrules.template` — same additions as `.cursorrules`; documented both fat-client and thin-client bootstrap paths
- `skills/session-biz/skill.md` — added I4 Context mode protocol with mandatory reads, git snapshot, structured context report, and anti-patterns

## [v0.1.0] - 2026-06-01

### Added
- Initial Business OS framework — complete set of business skills, standards, concepts, and templates
- **20 skills:** deploy-files, deploy-repo, biz-bootstrap, biz-strategy, biz-brand, biz-pricing, biz-content, biz-community, biz-referrals, biz-discovery, biz-proposal, biz-objections, biz-review, biz-market-validate, biz-pipeline-diagnosis, session-biz, biz-director, content-writing, business-ideas, product-service-ideas
- New **project-aware generative skills** (no hard gate; run any time, improve with strategy/brand-ready):
  - `content-writing` — craft of writing articles, posts, case studies, landing pages, emails; technology-tilted; loads host project context dynamically
  - `business-ideas` — structured, stress-tested business/venture/pivot idea generation with archetypes + assumption ledger
  - `product-service-ideas` — buildable, stack-fit product/service concepts + MVP scoping + prioritization matrix
  - Each ships a `references/project-context.example.md` fallback profile
  - Registered in `.cursorrules`, `README.md`, `skills/README.md`, `SKILL_DEPENDENCIES.md`, `PROCESS_ROUTER.md`, `biz-director`, `START_HERE.md`, and `templates/cursorrules.template`
- **Standards:** business conventions, pricing standard, content standard, brand guide, directory map
- **Concepts:** market fit, pricing model, channel strategy, brand positioning, sales process, operations
- **Templates:** bootstrap.sh, cursorrules.template, .work.biz/ skeleton with HANDOFF, NEXT, pipeline tracker
- **Deploy scripts:** deploy-files.sh and deploy-repo.sh for propagating .ai.biz to any project
- **.quick/ cheat sheets** for session lifecycle, deploy, and framework overview
