---
name: session-biz
description: >-
  Session open, close, context, and status. Loads HANDOFF, NEXT, UNKNOWNS.
  Updates HANDOFF with session artifacts and state. `context` loads all
  mandatory context read-only and is uncommitted-aware (surfaces dirty-tree
  status without writing HANDOFF). Optional git commit.
  session-biz start, session-biz close, session-biz context, session-biz status.
---

# session-biz

**Purpose:** Lightweight bookend for every AI-assisted work session. Start loads context. Close saves state. Context loads read-only + uncommitted-aware. No over-engineering.

---

## I0 — Files

| File | Purpose |
|------|---------|
| `HANDOFF.md` | Current session context, what was done, what's next |
| `NEXT.md` | Ordered list of next tasks / priorities |
| `UNKNOWNS.md` | Open questions that need research or decisions |

**Location:** Project root or `.ai/` if the project uses one. Defined at session level.

---

## I1 — Start mode

```
@session-biz start
```

1. Read `HANDOFF.md` into context.
2. Read `NEXT.md` into context.
3. Read `UNKNOWNS.md` into context.
4. Confirm: *"Session started with [N] next items and [M] unknowns."*

**If HANDOFF.md doesn't exist:** Prompt to run `@biz-bootstrap init` or create minimal HANDOFF manually.

---

## I2 — Close mode

```
@session-biz close
```

1. Summarize what was done this session (bullet points).
2. Update `HANDOFF.md`:
   - Session date/time
   - What was accomplished
   - Key decisions made
   - Updated next steps
   - Updated unknowns
3. Update `NEXT.md` with revised priorities.
4. Update `UNKNOWNS.md` — resolve any that were answered, add new ones.
5. **Optional:** `git add -A && git commit -m "session <date>: <summary>"` (only if user confirms).
6. Confirm: *"Session closed. HANDOFF, NEXT, UNKNOWNS updated."*

---

## I3 — Status mode

```
@session-biz status
```

Reports:

- **Session state:** active (start was called) or closed
- **Last session:** date and summary (from HANDOFF.md)
- **Next items:** count and first 3 from NEXT.md
- **Unanswered:** count from UNKNOWNS.md

---

## I4 — Context mode (read-only, uncommitted-aware)

```
@session-biz context
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

### C2 — Uncommitted-aware snapshot

Run:

```bash
git status -sb
git diff --stat
git diff --cached --stat
git log -1 --oneline
```

Classify the working tree:

- **clean:** state explicitly; report last commit only.
- **dirty:** summarize by top-level area (e.g. `3 files .ai.biz/skills/`, `1 file .work.biz/plans/`); list staged vs unstaged vs untracked counts. Do not paste full diffs — file paths + per-area counts only.

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

### Uncommitted status (read-only)
- Staged: <N files> · Unstaged: <N files> · Untracked: <N files>
- Areas touched: <top-level dirs with counts>
- (Clean tree → omit this section; state "working tree clean".)

### Pick up here
<quote recommended next from NEXT.md, or "no NEXT.md" >

### Open blockers
<from HANDOFF / NEXT, or none>

### No files written
This mode is read-only: HANDOFF, NEXT, and UNKNOWNS are **not** modified.
To open a session, run `@session-biz start`.
```

### Anti-patterns (context)
- Treating `context` as `start` (writing the HANDOFF "Open" line) — `context` writes nothing.
- Pasting raw `git diff` output (use per-area counts).
- Skipping the git snapshot before claiming "context loaded".
- Claiming "context loaded" without reading all of C1 set.

---

## Completion

| # | Check | Result |
|---|-------|--------|
| 1 | HANDOFF.md exists and is current | |
| 2 | NEXT.md has ordered priorities | |
| 3 | UNKNOWNS.md tracks open questions | |
| 4 | Session start was acknowledged | |
| 5 | Session close wrote state + optional commit | |

**Next:** `@biz-review weekly` or `@biz-community engage` — whatever NEXT.md says first.

---

*Modeled after `.ai/skills/session-biz/` concept. Kept intentionally minimal.*
