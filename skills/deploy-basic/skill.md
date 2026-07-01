---
name: deploy-basic
description: >-
  Thin-client bootstrap of Business OS (.ai.biz) into a target project. Copies
  ONLY the minimal scaffold — .cursorrules (with AGENT_OS_SOURCE pointer to the
  source .ai.biz) and .work.biz/ skeleton (HANDOFF, NEXT, UNKNOWNS, pipeline,
  research). Framework assets (skills, standards, concepts, docs, scripts) are
  NOT copied; the agent resolves them from the source Business OS at runtime per
  .cursorrules § Source resolution. Use deploy-basic (default), deploy-basic
  update, deploy-basic status, or deploy-basic - <target-path> (outbound from
  source). Never modifies the source. Contrast with deploy-files (full fat-client
  copy of .ai.biz/).
---

# deploy-basic

Thin-client deploy of the `.ai.biz` (Business OS) framework. The target project receives only the scaffold it owns (`.cursorrules`, `.work.biz/`); everything else (skills, standards, concepts, docs, scripts, templates) stays in the **source** `.ai.biz` and is loaded on demand via the `AGENT_OS_SOURCE` pointer written into `.cursorrules`.

**Shell:** `bash <source>/.ai.biz/scripts/deploy-basic.sh <target-path> [mode]`

**Canonical path:** `.ai.biz/skills/deploy-basic/skill.md` · **Shell:** `.ai.biz/scripts/deploy-basic.sh`

**Source not modified.** deploy-basic only writes to the **target**. The source `.ai.biz` is read-only (script reads its templates).

**Contrast with `deploy-files`:** `deploy-files` = **fat-client** (vendored full `.ai.biz/` into target, skills are local). `deploy-basic` = **thin-client** (skills remote in source). Choose:
- `deploy-files` — you want skills/standards/concepts versioned inside the project, offline-editable, no external dependency.
- `deploy-basic` — you want the project to track the live source Business OS, share one source of truth across many consumer repos, and accept new skills/standards automatically by updating the source (no per-project re-deploy).

---

## Parse invocation

| User says | Direction | Mode |
|-----------|-----------|------|
| `@deploy-basic - /path/to/target` | outbound (invoked from source) | thin bootstrap no-overwrite |
| `@deploy-basic` (from target, post-bootstrap) | in-place | re-runs no-overwrite bootstrap + source-pointer sync |
| `@deploy-basic update` (from target) | in-place | no-overwrite + re-sync source pointer + agent rules-aware merge of differing local-surface files |
| `@deploy-basic status` | report | read-only: shows `.cursorrules` presence, `AGENT_OS_SOURCE` value + reachability, `.work.biz/` presence, whether local `.ai.biz/skills` exists (fat-client leak check) |

**Default:** `status` if no verb matches. **Aliases:** `bootstrap-biz-thin`, `biz-thin` → bare `@deploy-basic`.

**Target path is REQUIRED when invoked from the source Business OS dir (Scenario #2 / outbound).** The shell aborts with a usage message if no `<target-path>` is supplied; the agent must prompt the user for it rather than guessing. When invoked in-place (target is cwd), the path is implicit (`.`) and no argument is needed.

---

## What gets copied (the local surface)

| Path | Source | If target exists |
|------|--------|-------------------|
| `.cursorrules` | `templates/cursorrules.template` with `AGENT_OS_SOURCE=<source>` substituted | skip (preserve); `--force` overwrites |
| `.work.biz/README.md`, `context/HANDOFF.md`, `plans/NEXT.md`, `plans/UNKNOWNS.md`, `pipeline/pipeline_tracker.md`, `research/research_index.md` | `templates/work/*.template` (suffix stripped) | skip (preserve) |
| `.work.biz/{context,plans,pipeline,research,drafts}/` | created empty dirs | skip (preserve) |

**Explicitly NOT copied (stay in source, loaded at runtime):** `skills/**`, `standards/**`, `concepts/**`, `docs/**`, `scripts/**`, `templates/**`, `SKILL_DEPENDENCIES.md`, root `README.md`, `PROCESS_ROUTER.md`, `START_HERE.md`, `CONVENTIONS.md`, `.github/`, `.gitignore`, `.gitattributes`.

---

## I0 — Pre-checks

| Condition | Action |
|-----------|--------|
| Source `templates/cursorrules.template` missing | **Block**: source is not a valid `.ai.biz` framework root |
| Source `skills/` directory missing | **Block**: source is not a valid `.ai.biz` framework root |
| Target dir does not exist | **Block**: report missing path |
| Target already has local `.ai.biz/skills/` | **Warn** fat-client leak: target was previously bootstrapped fat; thin-client would duplicate. Ask user to confirm intent (proceed leaves the local `.ai.biz/` in place — deploy-basic does not delete it). |
| Target `.cursorrules` exists + lacks `AGENT_OS_SOURCE=` line | In `update` mode → flag as **MERGE CANDIDATE** (the Source-resolution section is missing); in default mode → skip (preserve) and report that source-resolution is not wired. |

---

## I1 — Bootstrap protocol

1. Resolve source `BIZ_ROOT` (explicit `BIZ_SOURCE` env, else script's parent). Validate `templates/cursorrules.template` + `skills/` exist.
2. Resolve target = `REPO_ROOT` of the consumer (cwd for in-place, or the named path for outbound).
3. Write `.cursorrules` into the target from the template, substituting `AGENT_OS_SOURCE=REPLACE_BASICSOURCE` → `AGENT_OS_SOURCE=<absolute BIZ_ROOT>`. **No-overwrite** if `.cursorrules` exists; `--force` overwrites.
4. Create `.work.biz/` skeleton by copying template files and creating directory structure. `copy_if_missing` enforces no-overwrite.
5. Report: source pointer value, `.work.biz/` presence, fat-client leak check, next steps.

**Idempotent re-run.** Safe to re-run; no-overwrite preserves target customizations. The source pointer is re-synced only in `update` mode (or `--force`).

---

## I2 — update-merge protocol (`@deploy-basic update` only)

After I1 (no-overwrite) the script:

1. **Re-syncs the source pointer** if the target `.cursorrules` carries a stale `AGENT_OS_SOURCE` value (e.g. source moved). Performed in-place on the assignment line only — preserves all other target edits.
2. **Lists merge candidates** among the local surface: existing-but-differing files vs the current source templates (substituted). Candidates:
   - `.cursorrules` (differs from current `template-with-source`)
   - `.work.biz/<file>` (target has user content; templates are skeletons)
3. The **agent** then performs a rules-aware merge per candidate (this is agent work, not script work).

### Merge rules per file class

| Class | Merge rule |
|-------|------------|
| `.cursorrules` | Update framework sections (Skills table, Core principles, Protected files, **Source resolution** section, Frameworks registry). Preserve target-filled `REPLACE:` tokens, target customizations, target-specific protected-file paths. If target lacks the Source-resolution section entirely (fat-client template) → append it with the current `AGENT_OS_SOURCE`. Never wholesale-replace. |
| `.work.biz/<file>` skeletons | Append new template sections absent in target; **preserve all user content** (HANDOFF rows, NEXT iteration blocks, UNKNOWNS entries, pipeline data). Skeletons are minimal — most merges add no new sections. Never drop target rows. |
| `.work.biz/<dir>` | Create any NEW scaffold dir that didn't exist (e.g. a new sub-dir added since last bootstrap); do not touch existing. |

### Preserve invariants (never drop)
- Target's filled `REPLACE:` tokens (the merge keeps target values, not source `REPLACE:*` placeholders).
- Target's `AGENT_OS_SOURCE` line, in-place value (synced, not reset to `REPLACE_BASICSOURCE`).
- Target's custom content in `.work.biz/` files — any HANDOFF rows, NEXT items, pipeline data, research notes the user or `biz-*` skills produced.
- Target's git history, `.gitignore`, app code — all untouched.

---

## I3 — status (read-only)

Reports:

| Check | Output |
|-------|--------|
| `.cursorrules` present | pass / missing |
| `AGENT_OS_SOURCE` value + reachable | value + `test -d` result |
| Source-resolution section present | pass / missing |
| `.work.biz/` present | pass / missing (list present skeleton files) |
| Local `.ai.biz/skills/` exists (fat-client leak) | no (good, thin) / yes (warn — mixed) |
| `REPLACE:` tokens remaining in `.cursorrules` | count (excludes `AGENT_OS_SOURCE` which is filled) |

---

## Completion

| # | Check | Result |
|---|-------|--------|
| 1 | Source `templates/cursorrules.template` readable | pass |
| 2 | Source `skills/` directory present | pass |
| 3 | Target `.cursorrules` exists with valid `AGENT_OS_SOURCE` (resolves to a dir) | |
| 4 | Source-resolution section present in target `.cursorrules` | |
| 5 | `.work.biz/` skeleton present (HANDOFF, NEXT, UNKNOWNS at minimum) | |
| 6 | No-overwrite honored (existing target files preserved; `--force` only when explicitly requested) | |
| 7 | `update`: source pointer re-synced if stale; merge candidate list produced; no wholesale replaces | |
| 8 | Fat-client leak checked (no unexpected local `.ai.biz/skills/`) | |
| 9 | User informed that skills load from `$AGENT_OS_SOURCE` at runtime + next steps | |

## Next commands (in target project)

```text
# Verify the source is reachable from the target's perspective:
test -d "$(grep -oE 'AGENT_OS_SOURCE=[^ ]*' .cursorrules | head -1 | cut -d= -f2-)"

# Fill remaining REPLACE tokens in .cursorrules (NOT AGENT_OS_SOURCE — deploy-basic set it):
#   rg 'REPLACE:' .cursorrules

# First skill invocation — loads from source:
@session-biz start

# Load context without writing handoff (uncommitted-aware):
@session-biz context
```

---

## Critical interactions

| When | Ask / do |
|------|----------|
| Invoked from target with no source pointer yet (greenfield, no `.cursorrules`) | The skill itself can't be loaded in thin-client mode before bootstrap. Tell the user to run the shell directly: `bash /abs/path/to/source/.ai.biz/scripts/deploy-basic.sh .` — chicken-and-egg escape (see `.cursorrules` § Source resolution). |
| Bootstrap target already has `.ai.biz/skills/` (fat-client) | Warn; ask: convert to thin (delete local `.ai.biz/`)?, keep mixed (skills resolve local-first per fat-client rule — unexpected)?, or abort? Do not silently leave a mixed state. |
| `update` finds `.cursorrules` with no `AGENT_OS_SOURCE` line | Fat-client template detected → flag as merge candidate; agent appends the Source-resolution section with current source value. |
| Source moved since last bootstrap | `update` re-syncs the pointer in-place; report old→new. If source unreachable, report `business-os source unreachable` and stop. |

---

## Anti-patterns

- Copying `skills/`/`standards/`/`concepts/` into the target (that defeats thin-client; use `@deploy-files` instead).
- Wholesale-replacing `.cursorrules` or `.work.biz/HANDOFF.md` on `update`.
- Resetting `AGENT_OS_SOURCE` to `REPLACE_BASICSOURCE` instead of the resolved path.
- Running `@deploy-basic` and expecting skills to work offline — thin-client requires the source path to remain reachable.
- Failing to verify `$AGENT_OS_SOURCE` is readable before claiming bootstrap complete.
- Invoking `@deploy-basic -` from the source dir **without** a target path — the shell aborts; the agent must prompt for the target rather than guessing or defaulting to the source's own cwd.
- Using `deploy-basic` to "upgrade" a fat-client repo without first removing the local `.ai.biz/` (creates a mixed state; skills resolve fat-client first).
