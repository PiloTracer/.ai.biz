# Business OS — Improvement Plan (2026-07-07)

**Reference source:** `.ai` Agent OS v0.5.3 (commits c2a810d..cc25b3b, 2026-07-01 to 2026-07-06)

---

## Applied changes

### 1. Change-safety layer (NEW)

Added from reference's change-safety and gate-verification layer:

| Artifact | Source reference | Status |
|----------|-----------------|--------|
| `scripts/touch-scope-verify.sh` | `scripts/touch-scope-verify.sh` | ✅ Created |
| `scripts/blast-radius-check.sh` | `scripts/blast-radius-check.sh` | ✅ Created |
| `scripts/gate-verify.sh` | `scripts/gate-verify.sh` | ✅ Created |
| `.cursorrules` § Change safety | `.cursorrules` § Change safety | ✅ Updated |
| `templates/work.biz/touch-scope.template` | — | **TODO** |

**Rationale:** Prevents cross-area strategy plan edits and empty-notes tasks from reaching commit. Validated through reference v0.5.3 audit.

### 2. Git hooks + hygiene (NEW)

Added from reference's Co-authored-by enforcement:

| Artifact | Source reference | Status |
|----------|-----------------|--------|
| `hooks/prepare-commit-msg` | `hooks/prepare-commit-msg` | ✅ Created |
| `hooks/commit-msg` | `hooks/commit-msg` | ✅ Created |
| `hooks/pre-commit` | `hooks/pre-commit` | ✅ Created |
| `hooks/post-commit` | `hooks/post-commit` | ✅ Created |
| `scripts/install-git-hooks.sh` | `scripts/install-git-hooks.sh` | ✅ Created |
| `.cursorrules` § No Attribution / Co-authored-by | `.cursorrules` § Git | ✅ Updated |
| `.cursorrules` § Commit Message Format | `.cursorrules` § Commit Message Format | ✅ Added |

**Rationale:** Universal improvement — mirrored from the reference's v0.5.0 audit, which confirmed Co-authored-by enforcement prevents accidental AI attribution.

### 3. Cursorrules (EXTENDED)

- Added Change-safety § with command gate table
- Added No Co-authored-by rule + hook install line
- Added Commit Message Format section (BIZ- prefix)

---

## Deferred items (not applied)

| Item | Reason |
|------|--------|
| `readiness-verify.sh` | Business OS doesn't have master-plan readiness gates — add if strategy milestones are introduced |
| `traceability-verify.sh` | No master plan to trace — add if task→strategy mapping is needed |
| `release.sh` | Current CI runs framework-verify.yml on push; release workflow added when versioned releases begin |
| Session-biz context X1/X2/X3 naming backport | Session-biz already has start/close/context/status — naming is cosmetic, not functional |

---

## Next actions

1. **Create `templates/work.biz/touch-scope.template`** — copy pattern from `.ai/templates/work/touch-scope.template`
2. **Run hooks install** — `bash scripts/install-git-hooks.sh` from repo root
3. **Update `framework-verify.sh`** — add self-test calls for new scripts
4. **Verify** — `bash scripts/framework-verify.sh` passes before next commit

---

## Cross-validation notes

All changes adapted to `.ai.biz`'s domain:
- Work tree paths use `.work.biz/` prefix
- Commit refs use `BIZ-` prefix
- Scripts are standalone (no dependency on `.ai/` scripts)
- Session-biz timeline can be updated with X1/X2/X3 context protocol labels in a future pass
