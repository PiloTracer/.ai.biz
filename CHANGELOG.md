# Changelog

All notable changes to Business OS are documented here.

## [Unreleased]

### Added
- **`.work.biz/reference/VOICE_PROFILE.md` — canonical, cross-platform voice definition.** `templates/work/reference/VOICE_PROFILE.md.template`, scaffolded by `bootstrap.sh` and `@biz-bootstrap init`. Nothing previously defined *how the owner sounds*: the Content Standard supplies universal negative constraints plus generic human-voice advice, both identical for every adopter, so voice was re-derived from scratch every session and output read as generically human. Modeled on a proven consumer-project artifact: voice defined by **reference sample** rather than description (descriptions drift, samples don't), an explicit **texture** section whose rules may not be "corrected" away, a **precedence table** making the anti-AI-artifact rules an unoverridable floor while the generic human-voice rules become overridable defaults, an owner-pass declaration, and drafting rules barring invented facts and manufactured typos
- **Voice profile wired into all four content skills** — `content-social`, `content-writing`, `biz-content`, and `biz-youtube` load it in their context contract, with fallback to legacy paths (`ideas/VOICE_STANDARD.md`, `reference/VOICE_STANDARD.md`, `reference/voice-profile.md`) so existing projects keep working. A voice file scoped to one directory only applies while working in that directory, which is how single-platform voice discipline happens by accident
- **`skills/content-social/platforms/substack.md` (R7)** — Substack was absent from the entire repository. Written from cited 2026 sources: recommendations plus apps drive ~50% of new free and ~25% of new paid subscriptions, ranking is audience-overlap based on a sequential retrieval model, long-form attention is outrunning supply while per-note attention deflates ~16%/year, restacking with substantive commentary grows publications 2-3x faster while closed-loop restacking is penalized, paid conversion norm is ~3% rather than the 5-10% promotional literature cites. Substack is also the one platform that overrides the universal post skeleton, because its readers opted into depth
- **`skills/content-social/platforms/threads.md` (R8)** — modeled as a conversation-velocity engine rather than a smaller X. Its defining constraint is operational: the first 30-60 minutes permanently set the reach ceiling and the system never revisits a post, and creator replies carry a ~42% engagement lift. Ranking explicitly rewards human voice over brand voice, which makes the anti-AI-artifact rules a distribution requirement there
- **Substack and Threads sections in `PLATFORM-ALGORITHM-STANDARD`** — with sources and caveats, recording where sources disagree (Threads cadence) rather than silently picking one
- **`@content-social status` (I6)** — the verb was advertised in the frontmatter, the routing table, the time budget, and the gate rules, but no mode section existed, so invoking it had no defined workflow. Reports per-platform state, cadence drift, and channel-plan divergence in both directions. `@biz-content status` covers LinkedIn and `@biz-youtube status` covers YouTube, leaving every other platform unreported
- **`templates/work/pipeline/platform-tracker.md.template`** — per-platform performance tracker, created on first publish rather than at bootstrap. Also closes a dangling reference: `biz-youtube` pointed at `pipeline/youtube-tracker.md` in three places with no template to create it from. Carries a channel-status block with a cadence-drift rule and a conversations table, because a platform with reach and an empty conversations table is producing authority rather than pipeline
- **Missing platform-specific anti-AI tics** — Instagram, Facebook, Substack/newsletters, and Threads. Only LinkedIn, X, YouTube, and Reddit had entries, despite Instagram and Facebook having full platform guides
- **`.work.biz/gates.md` readiness ledger** — `templates/work/gates.md.template` with all five gates (`strategy-ready`, `brand-ready`, `pipeline-ready`, `sales-ready`, `active-deal`) at `NOT MET`, a documented five-field schema, and a one-writer-per-gate rule. Scaffolded by `templates/bootstrap.sh` and `@biz-bootstrap init`
- **Gate promotion for gates 2 through 5** — previously only `strategy-ready` had a writer, so `brand-ready` and `sales-ready` were documented but unreachable. `@biz-brand overhaul` now promotes `brand-ready` (§ 7b), `@biz-review status` promotes `pipeline-ready` and reconciles the whole ledger, `@biz-discovery run` promotes `sales-ready` and `active-deal`
- **Gate pre-checks where documentation promised them but none existed** — `biz-discovery` (`pipeline-ready`), `biz-proposal` (`pipeline-ready`), `biz-objections handle` (`active-deal`), `biz-community engage` (`brand-ready`)
- **`.work.biz/reference/BRAND_STATUS.md`** — `templates/work/reference/BRAND_STATUS.md.template`; brand audit history, overhaul log, and current-surface state. Gives `@biz-brand status` a real source for its `Last audit` / `Last overhaul` fields, which previously had nowhere to read from, and supplies the `brand-ready` evidence
- **Gate demotion rules** — `@biz-strategy amend` demotes `strategy-ready` and cascades to `brand-ready`, `pipeline-ready`, and `sales-ready`; `@biz-review status` demotes any gate whose evidence is missing
- **`concepts/content-topic-buckets/prompt.md` (BIZ-09)** — canonical four-bucket framework for content topic rotation
- **`skills/content-social/platforms/{reddit,instagram,linkedin,linkedin-video,facebook,x,youtube}.md`** — platform-specific content guides loaded on demand
- **`skills/content-social/platforms/linkedin-video.md`** — complete LinkedIn native video mentor guide: scripting, shooting, editing, captions, first-frame optimization, analytics, 30-day challenge
- **`@content-social write linkedin video`** — generates a full LinkedIn native video production package (script, shot list, captions, post copy, posting ritual)
- **`@biz-content challenge - video`** — 30-day LinkedIn native video challenge with production coaching and video-specific metrics
- **Anti-AI-artifact rules** in `standards/20260621-CONTENT-STANDARD.md` — guidance on em-dash overuse, hedging words, generic transitions, passive voice, empty intensifiers, and platform-specific tics
- **`@biz-strategy amend`** — records mid-cycle strategy changes to `.work.biz/strategy/changelog.md`, folds in out-of-tree positioning docs, flags dependent artifacts stale, and never certifies. Adds the audience hierarchy (primary / secondary / opportunistic)
- **Gate self-checks on gated skills** — `biz-brand`, `biz-pricing`, and `biz-content` verify `strategy-ready` in their own I0 rather than trusting `biz-director` to have checked
- **`.work.biz/reference/CONTENT_STATUS.md`** — `templates/work/reference/CONTENT_STATUS.md.template`, the canonical publish/status tracker; scaffolded by bootstrap and updated by publish flows
- **`@biz-review weekly` drift check** — flags stale certification, out-of-tree strategy docs, and an unupdated `CONTENT_STATUS.md`
- **Strategy-alignment quality gates in `content-social`** — checks the implied buyer against `target-buyer-profile.md`, the CTA against `offer-scope.md`, and strategy freshness against the last certification

### Changed (content and channel discipline)
- **`repurpose` no longer produces a block per platform unconditionally** — it now produces blocks only for platforms `strategy/channel-plan.md` sanctions. A nine-platform dump looks productive while creating publishing obligations a solo operator cannot meet
- **`content-social strategy` mode gained binding rules** — rate platform fit on *capacity* rather than audience match alone (a platform the buyer uses but the operator cannot sustain is a POOR fit), respect an existing channel plan rather than relitigating it, name the recorded reason when a platform sits on the plan's exclusion list, distinguish authority channels from pipeline channels, and check prior content performance before recommending more surfaces
- **Channel-plan check added to `content-social` and `biz-youtube`** — producing for a platform absent from the channel plan, or on its "explicitly not channels" list, is surfaced before delivery, so tooling cannot quietly expand the channel mix past what the strategy sanctions. `@biz-strategy amend` is named as the way to change the plan on the record
- **Documented the repurposing asymmetry** — compression down works, expansion up produces padding. A LinkedIn post expanded into a Substack piece reads as inflated, because the compression that made it good on LinkedIn removed the narrative the subscriber came for
- **`CONTENT_STATUS.md` gained a by-platform index** — with a role column that must match the channel plan, a tracker-file pointer, and a conversations column. Per-platform metrics stay in the tracker files, since a single shared schema forces every platform to be measured by impressions

### Changed (content and safety rules)
- **Zero em-dashes and en-dashes** in all generated content, enforced across `standards/20260621-CONTENT-STANDARD.md`, `content-writing`, `content-social`, and the LinkedIn platform guide. Use periods, commas, colons, or parentheses
- **LinkedIn anti-generic rules tightened** in `content-writing` — specific hooks, explicit stakes, credibility markers, and no actionable framework hidden in the first comment
- **`.cursorrules` data-loss and destructive-ops rules hardened** — explicit permission table covering git publish and history rewrite, database destruction, filesystem deletes, protected-file edits, project-memory wipes, and secret commits. Approval applies only to the current message, never standing
- **Canonical strategy path conventions clarified** — `.work.biz/strategy/` uses flat canonical names; `plans/strategy_*.md` are historical and defer to `strategy/` on conflict

### Fixed
- **Gate ledger reading was too strict for real ledgers** — the parser required `**Status:**` to equal `PASS` exactly and matched gate headings literally. A hand-annotated ledger like `**Status:** PASS 2026-07-25 - verified live` therefore read as not met, which would have wrongly blocked `@biz-content publish` and caused `@biz-review status` to demote a legitimately passing gate; a `## active deal` heading did not resolve to `active-deal` at all. A gate is now met when its status *starts with* `PASS`, gate ids match on a normalized form, and project-specific extra sections are preserved. Verified against a real consumer ledger
- **`scripts/gate-verify.sh` false positive** — the readiness check treated any mention of a gate name in `NEXT.md` prose as a claim that the gate was met, so a note like "unlocks the strategy-ready gate" failed the run. The ledger is now authoritative: the script verifies that every gate claiming PASS in `.work.biz/gates.md` has its evidence on disk, and that any phase `NEXT.md` reports as reached has a matching PASS. Mentions in prose no longer trip it
- **`scripts/gate-verify.sh --self-test` was a stub** — it printed PASS without testing anything. It now exercises the ledger and phase-table parsers against fixtures
- **`standards/20260621-DIRECTORY_MAP.md` duplicated blocks** — `strategy/` and `plans/` were each listed twice with differing contents from a bad merge. Deduplicated, and `gates.md`, `reference/CONTENT_STATUS.md`, `reference/BRAND_STATUS.md`, and `pipeline/youtube-tracker.md` added
- **`skills/biz-director/skill.md` broken intent table** — the "Business ideas" and "Product / service ideas" rows sat after a blockquote, orphaning them from the table so they rendered as plain text. Moved back inside the table
- **Contradictory `biz-community` gate** — `SKILL_DEPENDENCIES.md` required `brand-ready` for `engage` while `biz-director` listed the skill as ungated. Resolved: `find` and `status` are ungated, `engage` requires `brand-ready`
- **Two writers for `brand-ready`** — `standards/20260621-BUSINESS-CONVENTIONS.md` allowed both `@biz-brand overhaul` and `@biz-strategy certify` to set it, and assigned `sales-ready` to `@biz-review status` rather than `@biz-discovery run`. One writer per gate is now binding
- **`templates/work/README.md.template` stale** — missing `gates.md`, the reference trackers, and `touch-scope`

### Changed
- **`skills/biz-content/skill.md`** — I0 now enforces its documented `brand-ready` gate after `strategy-ready`, instead of checking only `strategy-ready`. Points pre-brand-ready drafting at the ungated `@content-writing` / `@content-social write`
- **`skills/SKILL_DEPENDENCIES.md` § Gate Descriptions** — rewritten around the ledger: evidence path and sole promoting skill per gate, a per-skill table of which gate each I0 enforces and which modes are ungated, plus the demotion rules
- **Gate id spelling** — `active deal` is now `active-deal` everywhere, matching the ledger section ids so the ledger stays greppable
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
