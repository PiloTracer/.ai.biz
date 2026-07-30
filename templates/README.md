# Templates (`.ai.biz/templates/`)

Portable starter files for new projects using **Business OS**.

## Quick start

From the **project root** (directory containing `.ai.biz/`):

```bash
bash .ai.biz/templates/bootstrap.sh
```

Or: `@biz-bootstrap init`

---

## What gets created

| Output | Source template |
|--------|-----------------|
| `.cursorrules` (project root) | `cursorrules.template` |
| `.work.biz/README.md` | `work/README.md.template` |
| `.work.biz/gates.md` | `work/gates.md.template` |
| `.work.biz/context/HANDOFF.md` | `work/context/HANDOFF.md.template` |
| `.work.biz/plans/NEXT.md` | `work/plans/NEXT.md.template` |
| `.work.biz/plans/UNKNOWNS.md` | `work/plans/UNKNOWNS.md.template` |
| `.work.biz/pipeline/pipeline_tracker.md` | `work/pipeline/pipeline_tracker.md.template` |
| `.work.biz/pipeline/outreach-cadence.md` | `work/pipeline/outreach-cadence.md.template` |
| `.work.biz/research/research_index.md` | `work/research/research_index.md.template` |
| `.work.biz/strategy/README.md` | `work/strategy/README.md.template` |
| `.work.biz/reference/CONTENT_STATUS.md` | `work/reference/CONTENT_STATUS.md.template` |
| `.work.biz/reference/BRAND_STATUS.md` | `work/reference/BRAND_STATUS.md.template` |
| `.work.biz/reference/VOICE_PROFILE.md` | `work/reference/VOICE_PROFILE.md.template` |
| `.work.biz/reference/VOICE_RETRO.md` | `work/reference/VOICE_RETRO.md.template` |

Created on demand rather than at bootstrap: `work/pipeline/platform-tracker.md.template` → `.work.biz/pipeline/<platform>-tracker.md`, instantiated on the first publish to a given platform.

**Sync rule:** this table, `templates/bootstrap.sh`, `scripts/deploy-basic.sh` `WORK_FILES`, and `skills/biz-bootstrap/skill.md` § I1 must list the same set. `deploy-basic --update` only offers files in `WORK_FILES`, so an omission there means an artifact is silently never updated on existing installs.

## `REPLACE:` checklist (`.cursorrules`)

| Token | Purpose |
|-------|---------|
| `REPLACE:PROJECT_NAME` | Business / project name |
| `REPLACE:UNIFIED_OFFER` | Your one-line offer |
| `REPLACE:TARGET_BUYER` | Ideal client description |
| `REPLACE:PRICE_RANGE` | Typical price range |
