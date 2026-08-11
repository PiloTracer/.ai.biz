---
name: biz-session
description: >-
  Session open, close, context, and status. Loads HANDOFF, NEXT, UNKNOWNS,
  and optional CONTENT_STATUS. Updates HANDOFF with session artifacts and
  state. `context` loads all mandatory context read-only and is
  uncommitted-aware (surfaces dirty-tree status without writing HANDOFF).
  ALL writes and git operations are SCOPED to the `.work.biz/` working
  directory in the target repo — never outside it.
  Parameters are order-independent and combinable: close (write state),
  commit (git add -A -- .work.biz, including new untracked files/dirs,
  then path-scoped commit), push (git push of the current branch; implies
  commit). Examples: biz-session close, biz-session close commit,
  biz-session close push, biz-session close commit push, biz-session commit,
  biz-session push, biz-session commit push.
  biz-session start, biz-session close, biz-session context, biz-session status.
  Also accepts session-control as an alias (session-control start, close,
  context, status) — maps to the same operations.
---

# biz-session

**Purpose:** Lightweight bookend for every AI-assisted work session. Start loads context. Close saves state. Context loads read-only + uncommitted-aware. No over-engineering.

---

## I0 — Files & scope

| File | Purpose |
|------|---------|
| `.work.biz/context/HANDOFF.md` | Current session context, what was done, what's next |
| `.work.biz/plans/NEXT.md` | Ordered list of next tasks / priorities |
| `.work.biz/plans/UNKNOWNS.md` | Open questions that need research or decisions |
| `.work.biz/reference/CONTENT_STATUS.md` | **Optional.** Canonical publish/status tracker across all content types. Read if present. |

**Location:** Project root under `.work.biz/`. Defined per Business OS conventions.

### Scope rule (binding)

This skill's **write and git scope is `.work.biz/` only** — the working directory inside the target repo (project root). It is the *only* tree this skill creates, modifies, stages, or commits:

- All file writes land under `.work.biz/` (`HANDOFF.md`, `NEXT.md`, `UNKNOWNS.md`, and session artifacts). Nothing outside `.work.biz/` is written.
- Git staging is **path-scoped**: `git add -A -- .work.biz` (never bare `git add -A`).
- The commit is **path-scoped**: `git commit -m "<msg>" -- .work.biz` (never a bare `git commit` that could sweep in unrelated staged changes).
- `git push` pushes the current branch, which necessarily carries the whole branch history; the session's own changes are scoped to `.work.biz/` by the two rules above.
- Files outside `.work.biz/` are read-only for this skill. If a session produced app-code changes that need committing, tell the user to commit them separately — do not stage them.

---

## I1 — Start mode

```
@biz-session start
```

1. Read `HANDOFF.md` into context.
2. Read `NEXT.md` into context.
3. Read `UNKNOWNS.md` into context.
4. If `.work.biz/reference/CONTENT_STATUS.md` exists, read it into context and emit a **content pipeline brief** (3-5 lines, no more):
   - `ready` pieces waiting to be posted (title + platform), oldest first
   - `draft` pieces waiting on an owner pass
   - Last publish date, and whether any published piece is still missing its pillar
   - One suggested action when the pipeline is actionable (e.g. "post <piece> today", "owner pass on <draft>")
   A tracker that is read but never acted on is indistinguishable from no tracker; the brief is what turns it into action.
5. Confirm: *"Session started with [N] next items and [M] unknowns."*

**If HANDOFF.md doesn't exist:** Prompt to run `@biz-bootstrap init` or create minimal HANDOFF manually.

`commit` / `push` are not valid with `start` — reject with a redirect to `close`.

---

## I2 — Close mode + `commit` / `push` parameters

### I2a — Parameter resolution

Arguments are order-independent and combinable. Mode words: `start` | `close` | `context` | `status`. Flag words: `commit`, `push`.

| Invocation | Mode | What happens |
|------------|------|--------------|
| `@biz-session close` | close | Write session state to `.work.biz/` (below). No git. |
| `@biz-session close commit` | close + commit | Write state, then scoped commit of `.work.biz/` |
| `@biz-session close push` | close + push | Write state, then scoped commit, then push |
| `@biz-session close commit push` | close + commit + push | Write state, scoped commit, push |
| `@biz-session commit` | close + commit | `close` is implied by `commit`; write state, then scoped commit |
| `@biz-session push` | close + commit + push | `close` and `commit` are implied by `push`; write state, scoped commit, push |
| `@biz-session commit push` | close + commit + push | Same as above, any order |
| `@biz-session status` / `context` / `start` + `commit`/`push` | — | **Reject** with a redirect to `close` — commit/push are close-phase operations |

If a mode word is absent but `commit` and/or `push` appear, mode defaults to `close`. Duplicates (`close close commit`) are harmless — dedupe. Anything unrecognized is reported and ignored (with a warning), never guessed.

### I2b — Close steps

1. Summarize what was done this session (bullet points).
2. Update `HANDOFF.md` (only under `.work.biz/`):
   - Session date/time
   - What was accomplished
   - Key decisions made
   - Updated next steps
   - Updated unknowns
3. Update `NEXT.md` with revised priorities.
4. Update `UNKNOWNS.md` — resolve any that were answered, add new ones.
5. Confirm: *"Session closed. HANDOFF, NEXT, UNKNOWNS updated."*

### I2c — Commit steps (only when `commit` requested or implied)

Scope check first: nothing outside `.work.biz/` may be staged. Run from the **target repo root**:

```bash
git status -sb -- .work.biz                 # what changed in scope (incl. untracked)
git add -A -- .work.biz                     # stage ALL .work.biz changes: modified, new, deleted, untracked files AND dirs
git commit -m "session <date>: <summary>" -- .work.biz   # path-scoped commit — unrelated staged changes stay out
```

- `git add -A -- .work.biz` is mandatory: it includes **new untracked files and directories** under `.work.biz/` that should be part of the session record (e.g. a fresh `research/` note or `pipeline/` entry), not just modified tracked files.
- If nothing changed under `.work.biz/`, say so and skip the commit (do not create empty commits).
- If the operator has unrelated changes staged **outside** `.work.biz/`, they remain staged after this commit — report them, do not touch them.
- Report what was committed: commit sha, file count, and any untracked files that were added.

### I2d — Push steps (only when `push` requested or implied)

1. `commit` runs first (explicitly or implied) so the branch carries the session state.
2. `git push` the current branch from the target repo root.
3. Report the pushed branch + remote, or the exact push error if it fails (do not `--force`).

---

## I3 — Status mode

```
@biz-session status
```

Reports:

- **Session state:** active (start was called) or closed
- **Last session:** date and summary (from HANDOFF.md)
- **Next items:** count and first 3 from NEXT.md
- **Unanswered:** count from UNKNOWNS.md

---

## I4 — Context mode (read-only, uncommitted-aware)

```
@biz-session context
```

Read-only full context load. **No** HANDOFF/NEXT/UNKNOWNS writes. Sits between `status` (compact) and `start` (full load + marks session open).

Difference from `start`: writes nothing. Difference from `status`: loads the **full mandatory context set** plus a dirty-tree **diff summary**, not just a one-liner.

Use when: you want full session context for ad-hoc reasoning without opening/closing a session bookend — e.g. mid-session orientation, a second agent joining, debugging "what changed and what's next" without mutating HANDOFF.

### C1 — Mandatory context reads (read in full)

| # | File (repo-root path) | Pass criteria |
|---|----------------------|----------------|
| 1 | `.cursorrules` | identity, core principles, protected files |
| 2 | `.work.biz/context/HANDOFF.md` | Session status, repository state, open owner actions |
| 3 | `.work.biz/plans/NEXT.md` | Recommended next + owner blockers |
| 4 | `.work.biz/plans/UNKNOWNS.md` | Every open unknown + owner |
| 5 | `.work.biz/reference/CONTENT_STATUS.md` (if present) | Canonical publish status; prevents recommending already-published content |

### C2 — Uncommitted-aware snapshot

Run:

```bash
git status -sb
git diff --stat
git diff --cached --stat
git log -1 --oneline
git status -sb -- .work.biz        # scoped view: what the session owns
```

Classify the working tree:

- **clean:** state explicitly; report last commit only.
- **dirty:** summarize by top-level area (e.g. `3 files .ai.biz/skills/`, `1 file .work.biz/plans/`); list staged vs unstaged vs untracked counts. Do not paste full diffs — file paths + per-area counts only.
- Always separate the `.work.biz/` scoped status from the rest of the tree, since `.work.biz/` is what a `@biz-session close commit` would carry.

### C3 — Context report

```markdown
## Session context - <Project Name>

**Date:** <ISO date> · **Branch:** <branch> · **Working tree:** clean | dirty (N files)
**Last commit:** <sha - subject>

### Context loaded
| # | File | Result | Note |
|---|------|--------|------|
| 1 | .cursorrules | pass | |
| 2 | .work.biz/context/HANDOFF.md | pass (or missing) | §Session status: … |
| 3 | .work.biz/plans/NEXT.md | pass (or missing) | |
| 4 | .work.biz/plans/UNKNOWNS.md | pass (or missing) | |
| 5 | .work.biz/reference/CONTENT_STATUS.md | pass (or missing) | |

### Uncommitted status (read-only)
- Staged: <N files> · Unstaged: <N files> · Untracked: <N files>
- Areas touched: <top-level dirs with counts>
- `.work.biz/` scope: <scoped status — what a scoped commit would carry>
- (Clean tree → omit this section; state "working tree clean".)

### Pick up here
<quote recommended next from NEXT.md, or "no NEXT.md" >

### Open blockers
<from HANDOFF / NEXT, or none>

### No files written
This mode is read-only: HANDOFF, NEXT, and UNKNOWNS are **not** modified.
To open a session, run `@biz-session start`.
```

### Anti-patterns (context)
- Treating `context` as `start` (writing the HANDOFF "Open" line) — `context` writes nothing.
- Pasting raw `git diff` output (use per-area counts).
- Skipping the git snapshot before claiming "context loaded".
- Claiming "context loaded" without reading all of C1 set.
- Recommending a publish without checking `CONTENT_STATUS.md` when it exists.

---

## Anti-patterns (scope & parameters)

- Bare `git add -A` or bare `git commit` — stages/commits outside `.work.biz/`; always path-scope with `-- .work.biz`.
- Staging app-code, `.cursorrules`, or any non-`.work.biz` path "to be helpful" — the session scope is `.work.biz/` only.
- Using `git commit --amend`, `git reset`, or `git push --force` to "fix" the session commit — destructive; stop and tell the user.
- Guessing when `push` fails (e.g. divergent remote) — report the exact error and let the user decide.
- Ignoring an unrecognized parameter silently — report it with a warning.
- Claiming "committed" without running the scoped `git add -A -- .work.biz` — untracked files/dirs must be included.

---

## Completion

| # | Check | Result |
|---|-------|--------|
| 1 | HANDOFF.md exists and is current (under `.work.biz/`) | |
| 2 | NEXT.md has ordered priorities | |
| 3 | UNKNOWNS.md tracks open questions | |
| 4 | CONTENT_STATUS.md is loaded if present | |
| 5 | Session start was acknowledged | |
| 6 | Session close wrote state (scoped to `.work.biz/`) | |
| 7 | If `commit`/`push` requested: scoped add (`-A -- .work.biz` incl. untracked) + path-scoped commit (and push) verified | |

**Next:** `@biz-review weekly` or `@biz-community engage` — whatever NEXT.md says first.

---

*Modeled after `.ai/skills/biz-session/` concept. Kept intentionally minimal.*
