---
name: biz-archive
description: >-
  Archive published content pieces. Moves every piece marked `published`
  in .work.biz/reference/CONTENT_STATUS.md from .work.biz/ideas/<subdir>/<piece>
  to .work.biz/ideas.archive/<subdir>/<piece>, mirroring the subdirectory
  structure; writes a per-piece status.md into the archived directory so the
  publish record (date, platform/URL, pillar, notes) survives with the piece;
  then removes the piece's row from CONTENT_STATUS.md, which tracks the active
  inventory only. Moves use git mv for tracked files (staged, never committed)
  and plain mv for untracked ones. Never commits, pushes, or deletes.
  biz-archive run, biz-archive status.
---

# biz-archive

**Canonical path:** `.ai.biz/skills/biz-archive/skill.md`

Keep `.work.biz/ideas/` a workspace of *live* content and `CONTENT_STATUS.md` an index of the *active* inventory. When the operator asks to archive published content: move every published piece into `.work.biz/ideas.archive/` with the structure mirrored, write a per-piece `status.md` carrying its publish record, and remove the piece's tracker row. `ideas/` then shows only what is still in play, `ideas.archive/` is the permanent record of what shipped, and the tracker stays slim.

**Hard rules:**

- **Never commit, push, or delete.** Tracked pieces move with `git mv` (the rename is staged, never committed); untracked pieces move with plain `mv`. Committing is the owner's call — say so in the report.
- **The publish record survives with the piece.** Before any tracker row is removed, the piece's `status.md` must exist in the archived directory and carry the row's data (status, published date, platform/URL, pillar, note). No `status.md`, no row removal.
- **The tracker slims to the active inventory.** Archived pieces leave `CONTENT_STATUS.md` Items; the publish history lives in the per-piece `status.md` files and `pipeline/<platform>-tracker.md`. Aggregate rows (By platform `Last publish`, By pillar conversations) are lifetime scalars and stay.
- **Only piece directories move.** Loose files, category `README.md`s, research notes, backup dirs (`_revert_*`), and the legacy `ideas/VOICE_STANDARD.md` voice fallback never move (see I2).
- **Idempotent.** Already-archived pieces (in `ideas.archive/` with a `status.md`, row already removed) are detected and skipped; re-running is safe. A piece whose `status.md` is missing gets one written even when the directory itself was already moved.
- The binding semantics live in `CONVENTIONS.md` § Content Status Protocol → Archive rule and `standards/20260621-DIRECTORY_MAP.md` § Archive rule. This skill is the executor.

---

## Parse invocation

| User says | Mode |
|-----------|------|
| `@biz-archive` | `run` (default) — archive all published pieces |
| `@biz-archive run` | Same as above |
| `@biz-archive status` | Read-only dry run: report what *would* move, change nothing |

**Default:** `run`. A free-text request like "archive the published posts" is treated as `run`. Anything unrecognized is reported with a warning and ignored, never guessed.

---

## I1 — Pre-flight (both modes)

1. Read `.work.biz/reference/CONTENT_STATUS.md`.
   - Missing → there is no publish record; nothing can be classified as published. Report and stop. Do **not** self-heal the tracker here — archiving without a tracker would guess, and this skill never guesses.
2. Check `.work.biz/ideas/` exists.
   - Missing → report "no `ideas/` directory — nothing to archive" and stop.
3. Collect every tracker row whose status is `published`. Tracker rows reference pieces by **bare directory name** (e.g. `post_17_local_llm_hype`), sometimes per content-type tables; gather name + content type/subdir hint where the table gives one, plus the full row payload (status, published date, platform/URL, pillar, note) — it feeds the piece's `status.md`.

## I2 — Resolve pieces

For each `published` row, locate the piece directory under `.work.biz/ideas/`:

1. If the row or its table names a subdir (e.g. a "posts" table), try `ideas/<subdir>/<piece>/` first.
2. Otherwise search: `ideas/*/<piece>/` across category subdirs, then bare-root `ideas/<piece>/`.
3. Classify the outcome per piece:
   - **found in `ideas/`** → move candidate.
   - **already in `ideas.archive/`** (and absent from `ideas/`) → skip the move; still ensure `status.md` exists (write it from the row if missing) and the tracker row is removed.
   - **in neither** → skip, report as `published but no directory found` (the piece may never have been saved as files). Still write no `status.md` and keep the tracker row — with no archived directory there is nowhere for the record to live.

**Never-move list** (applies even if something inside matches a piece name):

- Loose files anywhere in `ideas/` (`README.md`, research notes, positioning/strategy docs, images at category root).
- The legacy voice fallback `ideas/VOICE_STANDARD.md`.
- Backup/version dirs such as `_revert_*`.
- Any piece whose tracker row is not `published` (`draft`, `ready`, `blocked`, `hold`) — those stay in `ideas/` and keep their tracker rows.
- Anything not resolvable to a `published` tracker row — report it as an untracked directory, never move it.

## I3 — `run` mode

For each move candidate, in tracker order:

1. `mkdir -p .work.biz/ideas.archive/<subdir>` (mirror the piece's parent subdir; bare-root pieces go to the archive root).
2. Move the piece (skip when it is already in `ideas.archive/`):
   - Tracked by git (`git ls-files --error-unmatch` succeeds on any file inside): `git mv .work.biz/ideas/<subdir>/<piece> .work.biz/ideas.archive/<subdir>/<piece>` — staged rename, **not** committed.
   - Untracked: `mv` the directory.
3. **Write the publish record** — create `.work.biz/ideas.archive/<subdir>/<piece>/status.md` from the tracker row (skip if it already exists and matches the row):

   ```markdown
   # Status — <piece>

   **What:** Publish record for this archived package (moved out of `.work.biz/reference/CONTENT_STATUS.md` <date>).
   **Status:** Published <date> — <platform>.
   **Needs:** none.

   | Field | Value |
   |-------|-------|
   | Platform | <platform / URL> |
   | Pillar | <pillar> |
   | Published | <publish date> |
   | Pre-archive path | `.work.biz/ideas/<subdir>/<piece>/` |
   | Notes | <tracker Note, conversations, anything load-bearing> |

   ## Next action

   Next action: none — archived record.
   ```

4. **Verify, then slim the tracker** — only after the `status.md` exists and carries the row's data: remove the piece's row(s) from `CONTENT_STATUS.md` Items. Leave the lifetime aggregates truthful: keep By platform `Last publish` dates and By pillar conversation counts; adjust per-type/Summary counts so they describe the *active* inventory (or add one header line stating that published records live in the per-piece `status.md` files). Never leave aggregates claiming pieces this file no longer lists without saying where they went.
5. After all moves: update the tracker's header (`Last updated` + one changelog line: `archived N published pieces to ideas.archive/ (YYYY-MM-DD); their records live in per-piece status.md`).

### Run report (mandatory output)

```markdown
## Archive run — <date>

- **Moved (N):** `ideas/posts/post_17_local_llm_hype` → `ideas.archive/posts/post_17_local_llm_hype` (git mv, staged) — one line per piece
- **Already archived (N):** <names — and whether status.md/row-removal catch-up was needed>
- **Published, no directory (N):** <names — publish record stands in the tracker; nothing moved, row kept>
- **Tracker rows removed (N):** rows slimmed after status.md verification
- **Left in ideas/ (not published):** <count by subdir>

**Git:** N renames staged (git mv), M untracked moves (plain mv). Nothing committed — commit is the owner's call (`@biz-session commit` when ready).

**Tracker:** N rows removed; header updated; aggregates still truthful.

**Next step:** <one line>
```

## I4 — `status` mode (read-only)

Run I1 + I2 and report the same buckets as the run report, plus the current counts (`ideas/` piece dirs, `ideas.archive/` piece dirs, published rows in the tracker, archived pieces missing `status.md`, tracker rows still held by archived pieces). Change nothing — no moves, no `status.md` writes, no tracker edits. Close with the Operator handoff contract.

---

## Edge cases

| Situation | Behavior |
|-----------|----------|
| No `CONTENT_STATUS.md` | Stop; report. Never archive without the publish record |
| No `ideas/` dir | Stop; report "nothing to archive" |
| `ideas.archive/` missing | Create it (and needed subdirs) only when there is something to move |
| Piece already archived but `status.md` missing | Write `status.md` from the tracker row, then remove the row (catch-up path — keeps re-runs healing) |
| Piece already archived and row already removed | Full skip; report as already archived |
| Piece in both `ideas/` and `ideas.archive/` | Stop for that piece; report the conflict — never overwrite the archived copy |
| `git mv` fails (e.g. not a git repo) | Fall back to `mv`; note it in the report |
| Published row with no directory | Skip; keep the tracker row. The publish record has nowhere else to live |
| Tracker rows with path prefixes instead of bare names | Honor the recorded path; still mirror under `ideas.archive/` |

---

## Anti-patterns

- Deleting from `ideas/` instead of moving (history loss; also forbidden by the no-delete rule).
- Committing or pushing the renames — staging with `git mv` is as far as this skill goes.
- **Removing a tracker row before its `status.md` is written and verified** — the publish record must exist in the archive before it leaves the index.
- A single centralized `ideas.archive/status.md` — the record is per piece directory, so maintaining it costs nothing per archive run.
- Moving `draft`/`ready` pieces "to clean up" — only `published` rows move.
- Moving loose files, READMEs, `VOICE_STANDARD.md`, or `_revert_*` backups.
- Flipping the tracker Status to `archived` — there is no such state; the row leaves the tracker once the per-piece record exists.
- Archiving without reading the tracker, or guessing a piece's published status from its folder name.
- Rewriting historical mentions of `ideas/` paths in HANDOFF or other logs — history stays as written.

---

## Completion gate (cannot be skipped)

You may only claim the task complete when all are true:
1. `CONTENT_STATUS.md` was read; only `published` rows were treated as candidates.
2. Every moved piece landed at the mirrored `ideas.archive/` path.
3. Every archived piece has a `status.md` carrying its tracker row's data (verified before row removal).
4. Every archived piece's tracker row was removed; the tracker header was updated; aggregates remain truthful.
5. The report lists moved / already-archived / no-directory / rows-removed / left-in-place buckets.
6. Nothing was committed, pushed, or deleted.

- **Operator handoff:** close every operator-facing report per the Operator handoff contract in `skills/SKILL_DEPENDENCIES.md` (Form A single line when nothing is needed; otherwise `**Needs your approval:**` with `path:L<n>` cites, `**Needs your answer:**`, and exactly one `**Next step:**`; omit empty sections).

---

## Time budget

| Mode | Time |
|------|------|
| `run` | < 5 min |
| `status` | < 2 min |

---

## Gates & dependencies

No hard prerequisite gate. Runs any time. Requires `.work.biz/reference/CONTENT_STATUS.md` with at least one `published` row to do useful work.

## Related skills

| Skill | When |
|-------|------|
| `@biz-social log` | Record the publish that later makes a piece archivable |
| `@biz-session commit` | Commit the staged renames when the owner asks |
| `@biz-content publish` / `@biz-youtube publish` | Publish flows that mark pieces `published` |
