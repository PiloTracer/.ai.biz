---
name: session-control
description: >-
  Session open and close. Loads HANDOFF, NEXT, UNKNOWNS. Updates HANDOFF
  with session artifacts and state. Optional git commit.
  session-control start, session-control close, session-control status.
---

# session-control

**Purpose:** Lightweight bookend for every AI-assisted work session. Start loads context. Close saves state. No over-engineering.

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
@session-control start
```

1. Read `HANDOFF.md` into context.
2. Read `NEXT.md` into context.
3. Read `UNKNOWNS.md` into context.
4. Confirm: *"Session started with [N] next items and [M] unknowns."*

**If HANDOFF.md doesn't exist:** Prompt to run `@biz-bootstrap init` or create minimal HANDOFF manually.

---

## I2 — Close mode

```
@session-control close
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
@session-control status
```

Reports:

- **Session state:** active (start was called) or closed
- **Last session:** date and summary (from HANDOFF.md)
- **Next items:** count and first 3 from NEXT.md
- **Unanswered:** count from UNKNOWNS.md

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

*Modeled after `.ai/skills/session-control/` concept. Kept intentionally minimal.*
