---
name: deploy-files
description: >-
  Deploy .ai.biz (Business OS) files into a target project. Two directions:
  (1) in-place bootstrap — invoked from a TARGET project, copies the source
  .ai.biz in without overwriting existing files, then scaffolds .work.biz/ +
  .cursorrules; (2) outbound copy — invoked from the source .ai.biz repo,
  copies into an explicit <path>. `update` mode additionally performs a
  rules-aware merge of existing-but-differing files. Copies only git-tracked /
  non-ignored files. Use deploy-files (default), deploy-files update,
  deploy-files copy - <path>, deploy-files status.
---

# deploy-files

Two-direction deploy of the `.ai.biz` framework into a target project. **Default = no-overwrite**: existing target files are preserved by construction.

**Shell:** `bash <source>/.ai.biz/scripts/deploy-files.sh <target-path> [--force|--update]`
**Scaffold shell:** `REPO_ROOT=<target> BIZ_SOURCE=<source> bash <source>/.ai.biz/templates/bootstrap.sh`

**Canonical path:** `.ai.biz/skills/deploy-files/skill.md` · **Shell:** `.ai.biz/scripts/deploy-files.sh`

**Security invariant:** The script enumerates files via `git ls-files --cached --others --exclude-standard` from the **source** `.ai.biz` repo root.

**No local `opencode.json`.** When co-installed with Agent OS, register skills via parent `.ai/opencode.json`.

**Contrast with `deploy-repo`:** `deploy-files` copies only the `.ai.biz/` directory (no VCS artifacts).

---

## Parse invocation

| User says | Direction | Mode |
|-----------|-----------|------|
| `@deploy-files` | in-place (cwd is target) | copy no-overwrite + scaffold no-overwrite |
| `@deploy-files update` | in-place | copy no-overwrite + scaffold + **rules-aware merge** |
| `@deploy-files copy - /path/to/repo` | outbound | copy no-overwrite to `/path/to/repo/.ai.biz` |
| `@deploy-files copy - /path/to/repo --force` | outbound | legacy overwrite |
| `@deploy-files status` | report | report whether `.ai.biz/` exists |

**Default:** `status` if no verb matches; bare invoke with no local `.ai.biz/` → in-place bootstrap.

Path auto-resolution: if the path ends in `.ai.biz` it is used as-is; otherwise `.ai.biz` is appended.

---

## I0 — Pre-checks

| Condition | Action |
|-----------|--------|
| Source is not a git repo, or `.ai.biz/` is not the git root | **Block** |
| Target parent dir does not exist | **Block** |
| Destination already has `.ai.biz/` | Proceed with **no-overwrite**; report skipped count |

---

## I1 — Copy mode (no-overwrite by default)

1. `bash <source>/.ai.biz/scripts/deploy-files.sh "<resolved-target>"` — or `--force` / `--update`.
2. **Skill-level omissions:** `.github/`, `.gitignore`, `.gitattributes`, `.cursorrules`, deploy scripts.
3. **No-overwrite default:** `rsync --ignore-existing`. `--update` emits merge candidate list.

---

## I2 — Scaffold (in-place only)

When invoked in-place, after copy the script chains bootstrap into the target:

```bash
REPO_ROOT=<target> BIZ_SOURCE=<source> bash <source>/templates/bootstrap.sh
```

**Outbound `copy - <path>` does NOT scaffold** — run `@biz-bootstrap init` in target.

---

## I3 — update-merge protocol

Agent performs rules-aware merge for each merge candidate (skills, standards, docs, templates, scripts). Preserve target `REPLACE:` tokens and target-only content. Never wholesale-replace.

---

## Completion

| # | Check | Result |
|---|-------|--------|
| 1 | Source repo is git root | pass |
| 2 | Destination `.ai.biz/` exists | |
| 3 | No `.gitignored` content copied | |
| 4 | Scaffold ran (in-place only) | |
| 5 | `update`: merge candidates processed | |

## Next commands

```text
@session-biz start
@biz-strategy greenfield
```
