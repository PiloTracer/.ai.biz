# Session Lifecycle

Session lifecycle quick reference: start → load context → work → close.

## Commands

```text
@biz-session start                 # open: loads HANDOFF, NEXT, UNKNOWNS (+ CONTENT_STATUS if present)
@biz-session status                # read-only: session state, last session, next items, open unknowns
@biz-session context               # read-only full context load + dirty-tree snapshot (no writes)
@biz-session close                 # write state to HANDOFF / NEXT / UNKNOWNS (no git)
@biz-session close commit          # + scoped commit of .work.biz/
@biz-session close commit push     # + push the current branch
```

## Rules

- Parameters are order-independent and combinable. `commit` and `push` imply `close`; `push` implies `commit`.
- Git scope is `.work.biz/` only: `git add -A -- .work.biz`, then a path-scoped commit. Nothing outside `.work.biz/` is staged.
- `commit` / `push` are rejected with `start`, `status`, and `context` — they are close-phase operations.

**Full protocol:** `skills/biz-session/skill.md`
