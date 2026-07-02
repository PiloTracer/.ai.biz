#!/usr/bin/env bash
# deploy-basic.sh — Thin-client bootstrap of Business OS into a target project.
#
# Copies ONLY the minimal scaffold into the target:
#   - .cursorrules (from templates/cursorrules.template, with AGENT_OS_SOURCE
#     token substituted to the absolute path of THIS source .ai.biz)
#   - .work.biz/ skeleton (HANDOFF, NEXT, UNKNOWNS, pipeline, research)
#
# Framework assets (skills/, standards/, concepts/, docs/, scripts/, templates/)
# are NOT copied — the target's .cursorrules carries an AGENT_OS_SOURCE pointer so
# the agent resolves them from the source .ai.biz at runtime (thin-client mode).
#
# Default = NO-OVERWRITE: existing target files are preserved by construction.
# --update: no-overwrite + re-syncs the source pointer + lists existing-but-
# differing local-surface files (.cursorrules, .work.biz/* template outputs)
# as merge candidates for agent rules-aware merge.
# --force: idempotent overwrite of the local scaffold surface only.
#
# Source resolution: BIZ_ROOT is derived from this script's location, so the
# script can be invoked from a TARGET using an external source .ai.biz:
#   bash /mnt/work/Projects/.ai.biz/scripts/deploy-basic.sh /mnt/work/Projects/tools-project
# Override the source with BIZ_SOURCE=/abs/path/.ai.biz if needed.
#
# Usage:
#   bash scripts/deploy-basic.sh <target-path>              # no-overwrite (skip existing)
#   bash scripts/deploy-basic.sh --status [target-path]   # read-only report
#   bash scripts/deploy-basic.sh <target-path> --update    # no-overwrite + merge candidate list
#   bash scripts/deploy-basic.sh <target-path> --force     # overwrite local scaffold (legacy)
#   BIZ_SOURCE=/path/.ai.biz bash scripts/deploy-basic.sh <target-path>
#
set -euo pipefail

if [[ "${1:-}" == "--status" ]]; then
  shift
  RAW_TARGET="${1:-.}"
  if [[ "$RAW_TARGET" == "." || "$RAW_TARGET" == "$PWD" ]]; then
    DEST_ROOT="$(pwd)"
  else
    DEST_ROOT="$(cd "$RAW_TARGET" && pwd)"
  fi
  CURS_DEST="${DEST_ROOT}/.cursorrules"
  echo "=== deploy-basic status → $DEST_ROOT ==="
  if [[ -f "$CURS_DEST" ]]; then
    echo "  .cursorrules: present"
    src="$(grep -oE 'AGENT_OS_SOURCE=[^ ]*' "$CURS_DEST" 2>/dev/null | head -1 | cut -d= -f2- || true)"
    if [[ -n "$src" && "$src" != "REPLACE_BASICSOURCE" ]]; then
      if [[ -d "$src" ]]; then echo "  AGENT_OS_SOURCE: $src (reachable)"; else echo "  AGENT_OS_SOURCE: $src (UNREACHABLE)"; fi
    elif grep -q 'AGENT_OS_SOURCE=' "$CURS_DEST"; then
      echo "  AGENT_OS_SOURCE: <unset token>"
    else
      echo "  AGENT_OS_SOURCE: missing (fat-client template?)"
    fi
  else
    echo "  .cursorrules: MISSING"
  fi
  [[ -d "${DEST_ROOT}/.work.biz/context" ]] && echo "  .work.biz/: present" || echo "  .work.biz/: missing"
  [[ -d "${DEST_ROOT}/.ai.biz/skills" ]] && echo "  local .ai.biz/skills/: present (WARN — fat-client leak)" || echo "  local .ai.biz/skills/: absent (thin-client ok)"
  exit 0
fi

RAW_TARGET="${1:?Usage: $0 [--status] <target-path> [--force|--update]}"
shift || true
MODE="skip"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --force)  MODE="force" ;;
    --update) MODE="update" ;;
    *) echo "ERROR: unknown flag: $1" >&2; exit 1 ;;
  esac
  shift
done

# Source .ai.biz root: explicit override wins, else derive from script location.
if [[ -n "${BIZ_SOURCE:-}" ]]; then
  BIZ_ROOT="$(cd "$BIZ_SOURCE" && pwd)"
else
  BIZ_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fi

# Target = repo root of the consumer (the dir that will hold .cursorrules + .work.biz/).
if [[ "$RAW_TARGET" == "." || "$RAW_TARGET" == "$PWD" ]]; then
  DEST_ROOT="$(pwd)"
else
  DEST_ROOT="$(cd "$RAW_TARGET" && pwd)"
fi

if [[ ! -d "$DEST_ROOT" ]]; then
  echo "ERROR: target directory does not exist: $DEST_ROOT" >&2
  exit 1
fi

# Validate source has required templates and skills.
TPL_CURS="${BIZ_ROOT}/templates/cursorrules.template"
if [[ ! -f "$TPL_CURS" ]]; then
  echo "ERROR: source .ai.biz missing templates/cursorrules.template at $BIZ_ROOT" >&2
  exit 1
fi
if [[ ! -d "${BIZ_ROOT}/skills" ]]; then
  echo "ERROR: source .ai.biz missing skills/ directory at $BIZ_ROOT" >&2
  exit 1
fi

# Scaffold file set (the thin-client local surface for Business OS).
CURS_DEST="${DEST_ROOT}/.cursorrules"
WORK_FILES=(
  "README.md" "context/HANDOFF.md" "plans/NEXT.md" "plans/UNKNOWNS.md"
  "pipeline/pipeline_tracker.md" "research/research_index.md"
)
WORK_DIRS=(
  "context" "plans" "pipeline" "research" "drafts"
)

echo "=== deploy-basic (Business OS) → $DEST_ROOT (thin-client bootstrap) ==="
echo "  source: $BIZ_ROOT"
echo "  mode:   $MODE (no-overwrite by default)"

if [[ -d "${DEST_ROOT}/.ai.biz/skills" ]]; then
  echo "  WARN: target has local .ai.biz/skills/ directory (fat-client leak)"
  if [[ "$MODE" != "force" ]]; then
    echo "  BLOCKED: use --force to confirm thin-client on a fat-client target,"
    echo "    or remove the local .ai.biz/ directory first."
    exit 1
  fi
  echo "  --force: proceeding (mixed state accepted by operator)"
fi

# Build the substituted .cursorrules content.
subst_cursorules() {
  BIZ_ROOT_ESC="${BIZ_ROOT//\//\\/}"
  perl -pe "s/AGENT_OS_SOURCE=REPLACE_BASICSOURCE/AGENT_OS_SOURCE=${BIZ_ROOT_ESC}/" "$TPL_CURS"
}

write_cursorules() {
  if [[ "$1" == "force" ]] || [[ ! -f "$CURS_DEST" ]]; then
    subst_cursorules > "$CURS_DEST"
    echo "  cursorules: wrote (subst AGENT_OS_SOURCE=$BIZ_ROOT)"
  else
    echo "  cursorules: skip (exists) — keeping existing target .cursorrules"
  fi
}

# Pre-scan: detect whether target already has a thin-client pointer set.
existing_source=""
if [[ -f "$CURS_DEST" ]]; then
  existing_source="$(grep -oE 'AGENT_OS_SOURCE=[^ ]*' "$CURS_DEST" | head -1 | cut -d= -f2- || true)"
fi

# Step 1: .cursorrules
if [[ "$MODE" == "force" ]]; then
  write_cursorules force
else
  if [[ -f "$CURS_DEST" ]]; then
    echo "  cursorules: skip (exists) — keeping existing target .cursorrules"
  else
    write_cursorules skip
  fi
fi

# Re-sync the source pointer when --update AND the existing .cursorrules carries
# REPLACE_BASICSOURCE or a stale path.
if [[ "$MODE" == "update" ]] && [[ "$existing_source" != "$BIZ_ROOT" ]]; then
  if [[ -f "$CURS_DEST" ]] && grep -q 'AGENT_OS_SOURCE=' "$CURS_DEST"; then
    BIZ_ROOT_ESC="${BIZ_ROOT//\//\\/}"
    OLD_ESC="${existing_source//\//\\/}"
    perl -i -pe "s{AGENT_OS_SOURCE=\Q${existing_source}\E}{AGENT_OS_SOURCE=${BIZ_ROOT_ESC}}" "$CURS_DEST" 2>/dev/null || \
      perl -i -pe "s/AGENT_OS_SOURCE=[^\n]*/AGENT_OS_SOURCE=${BIZ_ROOT_ESC}/" "$CURS_DEST"
    echo "  cursorules: re-synced AGENT_OS_SOURCE → $BIZ_ROOT (was: ${existing_source:-<unset>})"
  fi
fi
# If --update AND existing .cursorrules has no AGENT_OS_SOURCE line (fat-client template).
if [[ "$MODE" == "update" ]] && [[ -f "$CURS_DEST" ]] && ! grep -q 'AGENT_OS_SOURCE=' "$CURS_DEST"; then
  echo "  cursorules: MERGE CANDIDATE — existing .cursorrules lacks the Source-resolution section"
  echo "    (agent merges the section from the current template; preserves target REPLACE tokens)"
fi

# Step 2: .work.biz/ skeleton via bootstrap.sh (no-overwrite).
BOOTSTRAP_SKIP_CURSERRULES=1 REPO_ROOT="$DEST_ROOT" BIZ_SOURCE="$BIZ_ROOT" \
  bash "$BIZ_ROOT/templates/bootstrap.sh" \
  > /tmp/deploy-basic-biz-bootstrap.$$.log 2>&1 || { cat /tmp/deploy-basic-biz-bootstrap.$$.log; rm -f /tmp/deploy-basic-biz-bootstrap.$$.log; exit 1; }
grep -E '(created:|skip )' /tmp/deploy-basic-biz-bootstrap.$$.log | sed 's/^/  work: /' || true
rm -f /tmp/deploy-basic-biz-bootstrap.$$.log

# Step 3: --update — list existing-but-differing files as merge candidates.
if [[ "$MODE" == "update" ]]; then
  echo ""
  echo "=== update merge candidates ==="
  # .cursorrules vs the freshly-substituted template
  if [[ -f "$CURS_DEST" ]]; then
    tmp_cur="$(mktemp)"
    subst_cursorules > "$tmp_cur"
    if ! cmp -s "$tmp_cur" "$CURS_DEST"; then
      echo "  merge: .cursorrules  (differs from current template-with-source)"
    fi
    rm -f "$tmp_cur"
  fi
  # .work.biz/ skeleton files vs source templates
  TPL_WORK="${BIZ_ROOT}/templates/work"
  for f in "${WORK_FILES[@]}"; do
    src="${TPL_WORK}/${f}.template"
    dest="${DEST_ROOT}/.work.biz/${f}"
    [[ -f "$src" && -f "$dest" ]] || continue
    if ! cmp -s "$src" "$dest"; then
      echo "  merge: .work.biz/${f}  (target has user content — agent appends new template sections only; preserves user edits)"
    fi
  done
  echo "  (agent performs rules-aware merge — append new sections, preserve target"
  echo "   customizations + REPLACE tokens + AGENT_OS_SOURCE. See skill deploy-basic § update-merge.)"
fi

echo ""
echo "=== Done: thin-client bootstrap (Business OS) → $DEST_ROOT ==="
echo "  .cursorrules: $([ -f "$CURS_DEST" ] && echo present || echo MISSING)"
echo "  AGENT_OS_SOURCE: $(grep -oE 'AGENT_OS_SOURCE=[^ ]*' "$CURS_DEST" 2>/dev/null | head -1 | cut -d= -f2- || echo '<unset — fat-client>')"
echo "  .work.biz/: $([ -d "${DEST_ROOT}/.work.biz" ] && echo present || echo MISSING)"
echo "  skills (local): $([ -d "${DEST_ROOT}/.ai.biz/skills" ] && echo "present — fat-client (unexpected for basic)" || echo 'absent — thin-client (skills load from source)')"
echo ""
echo "Next steps in target project:"
echo "  1. Edit ${DEST_ROOT}/.cursorrules — fill every REPLACE: token EXCEPT AGENT_OS_SOURCE (deploy-basic set it)"
echo "  2. Verify source is reachable:  test -d \"\$(grep -oE 'AGENT_OS_SOURCE=[^ ]*' $CURS_DEST | cut -d= -f2-)\""
echo "  3. Run @session-biz start  (skill loads from \$AGENT_OS_SOURCE/skills/session-biz/skill.md)"
echo "  4. For project-tracking context: @session-biz context"
