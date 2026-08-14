# Session Lifecycle

Session lifecycle quick reference: start → load context → work → checkpoint → close.

## Commands

```text
@biz-session start                 # open: loads HANDOFF, NEXT, UNKNOWNS (+ CONTENT_STATUS if present), marks HANDOFF Open
@biz-session status                # read-only: session state, last session, next items, open unknowns
@biz-session context               # read-only full context load + dirty-tree snapshot (no writes)
@biz-session close                 # write state to HANDOFF / NEXT / UNKNOWNS (no git)
@biz-session close commit          # + scoped commit of .work.biz/ (incl. new untracked files/dirs)
@biz-session close commit scoped   # + commit of HANDOFF/NEXT/UNKNOWNS only
@biz-session close commit push     # + push the current branch

# mid-session checkpoints (session stays open, no HANDOFF/NEXT writes):
@biz-session commit                # scoped commit of .work.biz/
@biz-session commit push           # + push the current branch
@biz-session add                   # stage .work.biz/ scope only, no commit
```

## Rules

- Parameters are order-independent and combinable. `push` implies `commit`. `scoped` limits a close-time commit to the bookend files.
- As a **verb**, `commit` / `add` never closes the session. As a **modifier of close**, `commit` runs after HANDOFF/NEXT/UNKNOWNS are written.
- Git scope depends on repo role: in a **target project** it is `.work.biz/` only (`git add -A -- .work.biz`, then a path-scoped commit; nothing outside is staged). In the **Business OS source repo** (framework at git root) it is **all modified/added/new files repo-wide** (`git add -A`).
- Default `close` never commits — it drafts the commit message for the user to run.
- Every commit message carries a `BIZ-123:` task ref when one is known (auto-detected from HANDOFF, `.work.biz/active-ref`, branch, or last commit), else `type: description`.
- `commit` / `push` / `add` are rejected with `start`, `status`, and `context` — use the standalone verbs.

**Full protocol:** `skills/biz-session/skill.md`
