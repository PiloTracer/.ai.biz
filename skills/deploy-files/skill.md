---
name: deploy-files
description: >-
  Deploy .ai.biz (Business OS) files into a target project — copies only
  git-tracked / non-ignored files (anything in .gitignore is never copied),
  then strips skill-level omissions (.github/, .gitignore, .gitattributes,
  .cursorrules, deploy scripts). Idempotent re-copy that preserves target-side
  customizations. deploy-files copy - <path>, deploy-files status.
---

# deploy-files

**Shell:** `bash .ai.biz/scripts/deploy-files.sh <target-path>`

Deploys this Business OS framework into a target project. Path auto-resolution: if the path ends in `.ai.biz` it is used as-is; otherwise `.ai.biz` is appended inside the path.

**Canonical path:** `.ai.biz/skills/deploy-files/skill.md` · **Shell:** `.ai.biz/scripts/deploy-files.sh`

**Security invariant:** The script enumerates files via `git ls-files --cached --others --exclude-standard`, so **anything `.gitignore` excludes is never copied** — enforced by construction.

**Contrast with `deploy-repo`:** `deploy-files` copies only the `.ai.biz/` directory (no VCS artifacts). Use `@deploy-repo clone` when you need the full repo including `.git` and `.github/`.

---

## Parse invocation

| User says | Mode |
|-----------|------|
| `@deploy-files` **copy - /path/to/repo** | Copy clean files to `/path/to/repo/.ai.biz` |
| `@deploy-files` **copy - /path/to/repo/.ai.biz** | Same, destination explicit |
| `@deploy-files` **status** | Report whether `.ai.biz/` exists at known deploy locations |

**Default:** `status` if no verb matches.

---

## I0 — Pre-checks

| Condition | Action |
|-----------|--------|
| Source is not a git repo, or `.ai.biz/` is not the git root | **Block**: report; deploy-files relies on `git ls-files` as the authority |
| Target parent dir does not exist | **Block**: report missing path |
| Destination exists and is not a dir | **Block**: report conflict |
| Destination already has `.ai.biz/` | Report existing; re-copy (idempotent overwrite; preserves untracked target files) |

---

## I1 — Copy mode

1. `bash .ai.biz/scripts/deploy-files.sh "<resolved-path>"`
2. **File set:** `git ls-files --cached --others --exclude-standard` from the source repo root — every file **not** excluded by `.gitignore`.
3. **Skill-level omissions:** `.github/`, `.gitignore`, `.gitattributes`, `.cursorrules`, `scripts/deploy-files.sh`, `scripts/deploy-repo.sh`.
4. Re-copies on re-run (idempotent overwrite). No `--delete` — target-side customizations preserved.
5. Outputs next steps for the target project.

---

## Completion

| # | Check | Result |
|---|-------|--------|
| 1 | Source repo is this `.ai.biz` project (git root) | pass |
| 2 | Destination `.ai.biz/` exists after copy | |
| 3 | No `.gitignored` content in destination | |
| 4 | `.github/` excluded from destination | |
| 5 | `.cursorrules` excluded from destination (created by `@biz-bootstrap init`) | |
| 6 | User informed of next steps | |

## Next commands (in target project)

```text
@biz-bootstrap init
@biz-strategy greenfield
```
