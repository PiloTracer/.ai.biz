# .work.biz/ — Project Memory

This directory is the **project's memory** — it holds everything the Business OS skills and sessions produce. The canonical layout for adopter projects is defined in `templates/work/README.md.template` and created by bootstrap (`templates/bootstrap.sh` + `biz-deploy-basic.sh` `WORK_FILES`/`WORK_DIRS`). In this framework source repo, `.work.biz/` holds the framework's own memory:

| Path | Purpose |
|------|---------|
| `context/HANDOFF.md` | Session bookmark — where you left off |
| `plans/NEXT.md` | Tactical next action + active phase |
| `plans/UNKNOWNS.md` | Open questions and blocked decisions |
| `pipeline/pipeline_tracker.md` | Sales pipeline |
| `prompts/` | Portable framework-improvement prompt archives |
| `reports/` | Session/audit reports |
| `research/research_index.md` | Research evidence index |
| `touch-scope` | Declared change scope for the current work session (session-local) |

Adopter projects additionally receive `gates.md`, `strategy/`, `drafts/`, `ideas/`, `ideas.archive/`, `pipeline/outreach-cadence.md`, and `reference/` (`CONTENT_STATUS.md`, `BRAND_STATUS.md`, `VOICE_PROFILE.md`, `VOICE_RETRO.md`, `OPERATOR_PROFILE.md`, `PROJECTS.md`) from bootstrap — see `templates/work/README.md.template`.
