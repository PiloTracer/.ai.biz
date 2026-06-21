---
name: biz-bootstrap
description: >-
  Scaffold .work.biz/, .cursorrules, and initial business structure from
  templates. One-command setup for a new project using Business OS.
  biz-bootstrap init, biz-bootstrap status.
---

# biz-bootstrap — One-Command Business OS Setup

**Shell:** `bash .ai.biz/templates/bootstrap.sh`

Entry point for setting up Business OS in any project. Creates the `.work.biz/` skeleton (HANDOFF, NEXT, UNKNOWNS, pipeline tracker) and copies `.cursorrules` from template — everything you need to start a strategy session or begin a new engagement.

**Canonical path:** `.ai.biz/skills/biz-bootstrap/skill.md` · **Shell:** `.ai.biz/templates/bootstrap.sh`

**Typical flow:** `@biz-bootstrap init` → `@biz-strategy greenfield` → `@biz-strategy certify` → `@biz-brand overhaul`

---

## Parse invocation

| User says | Mode |
|-----------|------|
| `@biz-bootstrap init` | Run bootstrap: create `.cursorrules` and `.work.biz/` skeleton |
| `@biz-bootstrap status` | Report current bootstrap state |

**Default:** `status` if no verb matches.

---

## I0 — Pre-checks

| Condition | Action |
|-----------|--------|
| `.ai.biz/` is not present in project root | **Block**: report; bootstrap requires Business OS framework installed |
| `.cursorrules` already exists at project root | Report existing; skip copy (remove manually to regenerate) |
| `.work.biz/` already exists | Report existing; do not overwrite |
| `templates/bootstrap.sh` or `templates/cursorrules.template` missing | **Block**: report missing template path |

---

## I1 — Init mode

1. **Pre-check** that `.ai.biz/templates/` exists and contains `bootstrap.sh`, `cursorrules.template`, and `work/` template files.
2. **Create `.cursorrules`** — copy `templates/cursorrules.template` to project root (skip if already present).
3. **Create `.work.biz/` skeleton** — create directories and copy template files:

   | Output | Source template |
   |--------|----------------|
   | `.work.biz/README.md` | `templates/work/README.md.template` |
   | `.work.biz/context/HANDOFF.md` | `templates/work/context/HANDOFF.md.template` |
   | `.work.biz/plans/NEXT.md` | `templates/work/plans/NEXT.md.template` |
   | `.work.biz/plans/UNKNOWNS.md` | `templates/work/plans/UNKNOWNS.md.template` |
   | `.work.biz/pipeline/pipeline_tracker.md` | `templates/work/pipeline/pipeline_tracker.md.template` |
   | `.work.biz/research/research_index.md` | `templates/work/research/research_index.md.template` |

4. **Complete** — report summary and next steps.

### Post-init checklist

| # | Task | Owner |
|---|------|-------|
| 1 | Replace every `REPLACE:` token in `.cursorrules` (PROJECT_NAME, UNIFIED_OFFER, TARGET_BUYER, PRICE_RANGE) | User |
| 2 | Review `.work.biz/context/HANDOFF.md` — set date and initial status | User |
| 3 | Review `.work.biz/plans/NEXT.md` — confirm current phase | User |
| 4 | Run `@biz-strategy greenfield` to define niche and offer | Agent |
| 5 | Run `@session-control start` to open first session | Agent |

---

## I2 — Status mode

Read-only report of the current bootstrap state:

| Check | Evidence |
|-------|----------|
| `.cursorrules` exists at project root | `ls "$PROJECT_ROOT/.cursorrules"` |
| `.work.biz/` directory exists | `ls -d "$PROJECT_ROOT/.work.biz"` |
| `.work.biz/context/HANDOFF.md` exists | `ls "$WORK_DIR/context/HANDOFF.md"` |
| `.work.biz/plans/NEXT.md` exists | `ls "$WORK_DIR/plans/NEXT.md"` |
| `.work.biz/plans/UNKNOWNS.md` exists | `ls "$WORK_DIR/plans/UNKNOWNS.md"` |
| `.work.biz/pipeline/pipeline_tracker.md` exists | `ls "$WORK_DIR/pipeline/pipeline_tracker.md"` |
| `.work.biz/research/research_index.md` exists | `ls "$WORK_DIR/research/research_index.md"` |
| Any `REPLACE:` tokens remain in `.cursorrules` | `grep -c 'REPLACE:' "$PROJECT_ROOT/.cursorrules" \|\| echo 0` |

Output a summary table. If the project is fully bootstrapped, recommend next skill: `@biz-strategy greenfield`. If not yet bootstrapped, recommend `@biz-bootstrap init`.

---

## Completion

| # | Check | Result |
|---|-------|--------|
| 1 | `.cursorrules` created from template (or skipped if existing) | pass |
| 2 | `.work.biz/` skeleton created with all template files | pass |
| 3 | All directories (`context/`, `plans/`, `pipeline/`, `research/`) exist | pass |
| 4 | User informed of `REPLACE:` token checklist | pass |
| 5 | User informed of next steps | pass |

## Next commands

```text
@biz-strategy greenfield        # define niche, offer, target buyer
@session-control start          # open first session
@biz-brand audit                # assess current brand presence
```

---

## References

- `.ai.biz/CONVENTIONS.md` — business phase lifecycle, naming conventions, core principles
- `.ai.biz/START_HERE.md` — decision tree and orchestration flow
- `.ai.biz/templates/README.md` — template map and REPLACE: token reference
- `bootstrap.sh` — shell implementation (`.ai.biz/templates/bootstrap.sh`)
- `.cursorrules` — AI agent rules (project root after init)
