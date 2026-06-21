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
| **Stable id** | Folder name = `name:` in frontmatter = `@` handle |

---

## Registered skills

| Skill id | Folder | Role |
|----------|--------|------|
| deploy-files | `deploy-files/` | Deploy `.ai.biz/` files into target project |
| deploy-repo | `deploy-repo/` | Full git-based deploy (clone or archive) |
| biz-bootstrap | `biz-bootstrap/` | Scaffold `.work.biz/`, `.cursorrules` from templates |
| biz-strategy | `biz-strategy/` | Define niche, offer, positioning; certifies **strategy-ready** |
| biz-brand | `biz-brand/` | Audit/overhaul LinkedIn, website, brand presence |
| biz-pricing | `biz-pricing/` | Value-based pricing for any engagement |
| biz-content | `biz-content/` | Write/publish content that attracts leads |
| biz-community | `biz-community/` | Community engagement without selling |
| biz-referrals | `biz-referrals/` | Systematic referral generation |
| biz-discovery | `biz-discovery/` | Sales discovery calls |
| biz-proposal | `biz-proposal/` | Proposal writing and scoping |
| biz-objections | `biz-objections/` | Handle sales objections |
| biz-review | `biz-review/` | Weekly/quarterly business review |
| biz-market-validate | `biz-market-validate/` | Test offers before committing |
| biz-pipeline-diagnosis | `biz-pipeline-diagnosis/` | Find and fix funnel bottlenecks |
| session-control | `session-control/` | Session open/close, HANDOFF, NEXT |

**Typical flow (greenfield):** `@biz-bootstrap init` → `@biz-strategy greenfield` → `@biz-strategy certify` → `@biz-brand overhaul` → `@biz-pricing set` → `@biz-content publish` → ...

---

## Canonical command vocabulary

| Verb | Meaning |
|------|---------|
| `status` | Read-only state report |
| `init` | One-time setup |
| `greenfield` | Generate full output from scratch |
| `probe` | Adaptive gap-driven questioning |
| `certify` | Gate check + state promotion |
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
| `review` | Assess performance |
| `plan` | Create a content/publishing plan |
| `revise` | Update an existing decision |
| `close` / `start` | Session bookends |
| `clone` / `archive` | Deploy modes |
| `copy` | Deploy files mode |
