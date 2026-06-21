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
| `.work.biz/context/HANDOFF.md` | `work/context/HANDOFF.md.template` |
| `.work.biz/plans/NEXT.md` | `work/plans/NEXT.md.template` |
| `.work.biz/plans/UNKNOWNS.md` | `work/plans/UNKNOWNS.md.template` |
| `.work.biz/pipeline/pipeline_tracker.md` | `work/pipeline/pipeline_tracker.md.template` |
| `.work.biz/research/research_index.md` | `work/research/research_index.md.template` |

## `REPLACE:` checklist (`.cursorrules`)

| Token | Purpose |
|-------|---------|
| `REPLACE:PROJECT_NAME` | Business / project name |
| `REPLACE:UNIFIED_OFFER` | Your one-line offer |
| `REPLACE:TARGET_BUYER` | Ideal client description |
| `REPLACE:PRICE_RANGE` | Typical price range |
