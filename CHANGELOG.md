# Changelog

All notable changes to Business OS are documented here.

## [Unreleased]

### Added
- **`concepts/content-topic-buckets/prompt.md` (BIZ-09)** — canonical four-bucket framework for content topic rotation
- **`skills/content-social/platforms/{reddit,instagram,linkedin,linkedin-video,facebook,x,youtube}.md`** — platform-specific content guides loaded on demand
- **`skills/content-social/platforms/linkedin-video.md`** — complete LinkedIn native video mentor guide: scripting, shooting, editing, captions, first-frame optimization, analytics, 30-day challenge
- **`@content-social write linkedin video`** — generates a full LinkedIn native video production package (script, shot list, captions, post copy, posting ritual)
- **`@biz-content challenge - video`** — 30-day LinkedIn native video challenge with production coaching and video-specific metrics
- **Anti-AI-artifact rules** in `standards/20260621-CONTENT-STANDARD.md` — guidance on em-dash overuse, hedging words, generic transitions, passive voice, empty intensifiers, and platform-specific tics

### Changed
- **`skills/content-social/skill.md`** — reduced from 1,316 to ~670 lines by extracting R1–R6 platform bodies into `platforms/*.md`; write/research modes now instruct agents to load the relevant platform guide; added R3V LinkedIn native video section, `write linkedin video` parse invocation, video entries in repurpose tables, and video-specific quality checks
- **`skills/content-social/platforms/linkedin.md`** — added LinkedIn native video quick-reference and link to full mentor guide
- **`skills/biz-content/skill.md`** — added LinkedIn native video to challenge format mix, repurposing workflow, content tracker, success criteria, failure mode, and new `challenge - video` mode
- **`skills/biz-director/skill.md`** — added LinkedIn video intent routing and LinkedIn video challenge flow
- **`skills/README.md`**, **`.cursorrules`**, **`templates/cursorrules.template`**, **`START_HERE.md`** — updated `content-social` descriptions to include LinkedIn native video
- **`skills/content-writing/skill.md`**, **`skills/biz-content/skill.md`**, **`skills/biz-youtube/skill.md`** — topic bucket tables replaced with references to `concepts/content-topic-buckets/prompt.md`
- **`skills/content-writing/skill.md`**, **`skills/content-social/skill.md`**, **`skills/biz-content/skill.md`**, **`skills/biz-youtube/skill.md`** — quality checklists now include an AI-artifact scan against the Content Standard

## [v0.5.3] - 2026-07-09

### Added
- **`biz-youtube` skill** — YouTube publishing ops: `publish`, `plan`, `challenge`, `status`; includes production-capacity gating and CTR/AVD/retention analytics
- **YouTube as a first-class platform** — `@content-social write youtube`, `write youtube shorts`, `research youtube`; YouTube sections in `biz-brand`, `biz-community`, `biz-strategy`, `content-writing`, and `standards/20260701-PLATFORM-ALGORITHM-STANDARD.md`
- **LinkedIn ICP mode** — `@content-social icp` runs BIZ-08 and saves to `.work.biz/strategy/linkedin-icp.md`
- **`templates/work/strategy/README.md.template`** — strategy directory scaffolded on bootstrap
- **Change-safety gates** — `scripts/touch-scope-verify.sh`, `scripts/blast-radius-check.sh`, `scripts/gate-verify.sh` with `--self-test` support; documented in `.cursorrules` § Change safety
- **Git hooks hygiene layer** — `hooks/prepare-commit-msg`, `hooks/commit-msg`, `hooks/pre-commit`, `hooks/post-commit` with `scripts/install-git-hooks.sh` backup mechanism; enforce `Co-authored-by` removal and `BIZ-`/type-prefixed commit subjects
- **`templates/work/touch-scope.template`** — declare change scope before work sessions
- **`content-social` added to `.cursorrules` skills table and `templates/cursorrules.template`** — kept in sync with `skills/README.md`
- **System skills section in `skills/SKILL_DEPENDENCIES.md`** — documents deploy-* and session-biz gate status

### Changed
- **Fixed legacy `.work/` paths** in `skills/biz-brand`, `skills/biz-discovery`, `skills/biz-objections`, `skills/biz-strategy` → `.work.biz/`
- **Canonical strategy path** — all skills now read/write `.work.biz/strategy/`; `CONVENTIONS.md` and `standards/20260621-DIRECTORY_MAP.md` updated
- **`pipeline-ready` gate** — now requires pricing set + pipeline tracker configured + outreach cadence defined, confirmed by `@biz-review status`
- **`README.md`** skill count corrected to 23; added `biz-youtube` and `content-social` YouTube to skills at a glance
- **`START_HERE.md`** decision tree and generative-skills table now reference YouTube and `biz-youtube`
- **`HANDOFF.md`** skill count corrected to 23
- **`templates/cursorrules.template`** synchronized with `.cursorrules` (change safety, commit format, co-authored-by, source resolution, content-social, biz-youtube)
- **`scripts/framework-verify.sh`** and **`scripts/gate-verify.sh`** — added `--self-test` flags; framework-verify now checks skill frontmatter name ↔ folder match and non-empty standards
- **`scripts/install-git-hooks.sh`** — backs up existing hooks before overwriting
- **`scripts/blast-radius-check.sh`** and **`scripts/touch-scope-verify.sh`** — now enforce by default; `--warn-only` available

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
