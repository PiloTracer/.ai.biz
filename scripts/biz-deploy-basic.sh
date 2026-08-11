#!/usr/bin/env bash
# biz-deploy-basic.sh — Thin-client bootstrap of Business OS into a target project.
#
# Copies ONLY the minimal scaffold into the target:
#   - .cursorrules (from templates/cursorrules.template, with AGENT_OS_SOURCE
#     token substituted to the absolute path of THIS source .ai.biz, and
#     Change-safety gate-table script paths baked to the same absolute root)
#   - .work.biz/ skeleton (HANDOFF, NEXT, UNKNOWNS, pipeline, research)
#
# Framework assets (skills/, standards/, concepts/, docs/, scripts/, templates/)
# are NOT copied — the target's .cursorrules carries an AGENT_OS_SOURCE pointer so
# the agent resolves them from the source .ai.biz at runtime (thin-client mode).
#
# Default = NO-OVERWRITE: existing target files are preserved by construction.
# --update: no-overwrite + re-syncs the source pointer + re-bakes script paths
# (via biz-cursorrules-verify.sh --fix) + lists existing-but-differing
# local-surface files (.cursorrules, .work.biz/* template outputs) as merge
# candidates for agent rules-aware merge.
# --force: idempotent overwrite of the local scaffold surface only.
#
# Source resolution: BIZ_ROOT is derived from this script's location, so the
# script can be invoked from a TARGET using an external source .ai.biz:
#   bash /mnt/work/Projects/.ai.biz/scripts/biz-deploy-basic.sh /mnt/work/Projects/tools-project
# Override the source with BIZ_SOURCE=/abs/path/.ai.biz if needed.
#
# Usage:
#   bash scripts/biz-deploy-basic.sh <target-path>              # no-overwrite (skip existing)
#   bash scripts/biz-deploy-basic.sh [status] [target-path]     # read-only report (+ verify)
#   bash scripts/biz-deploy-basic.sh <target-path> [--update]   # no-overwrite + repair + merge candidates
#   bash scripts/biz-deploy-basic.sh <target-path> [--force]    # overwrite local scaffold (legacy)
#   BIZ_SOURCE=/path/.ai.biz bash scripts/biz-deploy-basic.sh <target-path>
#
# Argument forms are equivalent: verbs accept the '--' prefix or bare form
# (`update` ≡ `--update`, `status` ≡ `--status`), '-' / '--' separators are
# ignored, and the target path may appear in any position:
#   biz-deploy-basic.sh /path update   ≡   biz-deploy-basic.sh /path --update
#
set -euo pipefail

# ── Argument normalization ─────────────────────────────────────────────
# Verbs with or without '--', in any position relative to the target path;
# '-' and '--' (skill parse-table separators) are ignored — a '-' must never
# become the target directory.
MODE=""
RAW_TARGET=""
for arg in "$@"; do
  [[ "$arg" == "-" || "$arg" == "--" ]] && continue
  tok="${arg#--}"
  case "$tok" in
    status|update|force|skip) MODE="$tok" ;;
    /*|./*|../*|~*|*/*|.)
      if [[ -z "$RAW_TARGET" ]]; then RAW_TARGET="$arg"
      else echo "ERROR: multiple target paths: '$RAW_TARGET' and '$arg'" >&2; exit 2; fi ;;
    *) echo "ERROR: unknown argument: $arg" >&2
       echo "Usage: $0 [status] <target-path> [--force|--update] (path must contain '/'; use ./name for local dirs)" >&2
       exit 2 ;;
  esac
done
MODE="${MODE:-skip}"
if [[ -z "$RAW_TARGET" ]]; then
  if [[ "$MODE" == "status" ]]; then
    RAW_TARGET="."
  else
    echo "Usage: $0 [status] <target-path> [--force|--update]" >&2
    exit 2
  fi
fi

# Source .ai.biz root: explicit override wins, else derive from script location.
if [[ -n "${BIZ_SOURCE:-}" ]]; then
  BIZ_ROOT="$(cd "$BIZ_SOURCE" && pwd)"
else
  BIZ_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fi

# ── Status mode (read-only) ───────────────────────────────────────────
if [[ "$MODE" == "status" ]]; then
  if [[ "$RAW_TARGET" == "." || "$RAW_TARGET" == "$PWD" ]]; then
    DEST_ROOT="$(pwd)"
  else
    DEST_ROOT="$(cd "$RAW_TARGET" && pwd)"
  fi
  CURS_DEST="${DEST_ROOT}/.cursorrules"
  status_rc=0
  echo "=== biz-deploy-basic status → $DEST_ROOT ==="
  # .cursorrules checks are delegated to the shared verifier (single source of
  # truth: AGENT_OS_SOURCE, gate-table script-path baking, source-resolution,
  # .work.biz skeleton, REPLACE token count).
  if [[ -f "$CURS_DEST" ]]; then
    BIZ_SOURCE="$BIZ_ROOT" bash "$BIZ_ROOT/scripts/biz-cursorrules-verify.sh" "$DEST_ROOT" || status_rc=$?
  else
    echo "  .cursorrules: MISSING"
    status_rc=1
  fi
  [[ -d "${DEST_ROOT}/.work.biz/context" ]] && echo "  .work.biz/: present" || echo "  .work.biz/: missing"
  [[ -d "${DEST_ROOT}/.ai.biz/skills" ]] && echo "  local .ai.biz/skills/: present (WARN — fat-client leak)" || echo "  local .ai.biz/skills/: absent (thin-client ok)"
  exit "$status_rc"
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
# Must stay in sync with templates/bootstrap.sh and skills/biz-bootstrap/skill.md § I1.
# The `--update` merge scan only considers files listed here, so anything missing is
# silently never offered for update on an existing thin-client install.
WORK_FILES=(
  "README.md" "context/HANDOFF.md" "plans/NEXT.md" "plans/UNKNOWNS.md"
  "pipeline/pipeline_tracker.md" "pipeline/outreach-cadence.md"
  "research/research_index.md" "strategy/README.md" "gates.md"
  "reference/CONTENT_STATUS.md" "reference/BRAND_STATUS.md"
  "reference/VOICE_PROFILE.md" "reference/VOICE_RETRO.md"
  "reference/OPERATOR_PROFILE.md" "reference/PROJECTS.md"
)
WORK_DIRS=(
  "context" "plans" "pipeline" "research" "drafts" "strategy" "reference"
)

echo "=== biz-deploy-basic (Business OS) → $DEST_ROOT (thin-client bootstrap) ==="
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
# Substitutes:
#   1. AGENT_OS_SOURCE=REPLACE_BASICSOURCE → absolute BIZ_ROOT
#   2. `bash scripts/<name>` → `bash <BIZ_ROOT>/scripts/<name>` (Change-safety
#      gate table + git-hooks install line). These commands live inside
#      .cursorrules itself, not inside a skill doc, so the general "any
#      .ai.biz/<x> inside a skill resolves to $AGENT_OS_SOURCE/<x>" rule
#      doesn't unambiguously cover them — bake the resolved absolute path here
#      instead of relying on read-time interpretation.
subst_cursorules() {
  BIZ_ROOT_ESC="${BIZ_ROOT//\//\\/}"
  perl -pe "s/AGENT_OS_SOURCE=REPLACE_BASICSOURCE/AGENT_OS_SOURCE=${BIZ_ROOT_ESC}/" "$TPL_CURS" \
    | perl -pe "s{bash (?<!/)scripts/}{bash ${BIZ_ROOT_ESC}/scripts/}g"
}

write_cursorules() {
  if [[ "$1" == "force" ]] || [[ ! -f "$CURS_DEST" ]]; then
    subst_cursorules > "$CURS_DEST"
    echo "  cursorules: wrote (subst AGENT_OS_SOURCE=$BIZ_ROOT)"
  else
    echo "  cursorules: skip (exists) — keeping existing target .cursorrules"
  fi
}

# Pre-scan: detect whether target already has a thin-client pointer set, so the
# report can flag a stale source path (e.g. source moved) for --update.
existing_source=""
if [[ -f "$CURS_DEST" ]]; then
  existing_source="$(grep -E '^AGENT_OS_SOURCE=' "$CURS_DEST" 2>/dev/null | head -1 | cut -d= -f2- || true)"
  if [[ -z "$existing_source" ]]; then
    existing_source="$(grep -oE 'AGENT_OS_SOURCE=[^[:space:]`]+' "$CURS_DEST" 2>/dev/null | head -1 | cut -d= -f2- || true)"
  fi
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

# --update: re-sync the source pointer and re-bake gate-table script paths.
# Single source of truth: biz-cursorrules-verify.sh --fix — idempotent,
# in-place, preserves all other target edits and tokens, and refuses to
# rewrite a foreign framework's pointer (mixed Agent OS + Business OS repos).
if [[ "$MODE" == "update" ]] && [[ -f "$CURS_DEST" ]] && grep -q 'AGENT_OS_SOURCE=' "$CURS_DEST"; then
  fix_rc=0
  BIZ_SOURCE="$BIZ_ROOT" bash "$BIZ_ROOT/scripts/biz-cursorrules-verify.sh" --fix --thin "$DEST_ROOT" || fix_rc=$?
  if [[ "$fix_rc" -ne 0 ]]; then
    echo "  cursorules: $fix_rc verification finding(s) not auto-repairable (see [FAIL] above)"
  fi
fi
# If --update AND existing .cursorrules came from a fat-client template (no
# AGENT_OS_SOURCE line at all), flag it — the source-resolution section is a
# merge candidate, handled by the agent (see skill § update-merge protocol).
if [[ "$MODE" == "update" ]] && [[ -f "$CURS_DEST" ]] && ! grep -q 'AGENT_OS_SOURCE=' "$CURS_DEST"; then
  echo "  cursorules: MERGE CANDIDATE — existing .cursorrules lacks the Source-resolution section"
  echo "    (agent merges the section from the current template; preserves target REPLACE tokens)"
fi

# Step 2: .work.biz/ skeleton via bootstrap.sh (no-overwrite).
BOOTSTRAP_SKIP_CURSERRULES=1 REPO_ROOT="$DEST_ROOT" BIZ_SOURCE="$BIZ_ROOT" \
  bash "$BIZ_ROOT/templates/bootstrap.sh" \
  > /tmp/biz-deploy-basic-scaffold.$$.log 2>&1 || { cat /tmp/biz-deploy-basic-scaffold.$$.log; rm -f /tmp/biz-deploy-basic-scaffold.$$.log; exit 1; }
grep -E '(created:|skip )' /tmp/biz-deploy-basic-scaffold.$$.log | sed 's/^/  work: /' || true
rm -f /tmp/biz-deploy-basic-scaffold.$$.log

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
  echo "   customizations + REPLACE tokens + AGENT_OS_SOURCE. See skill biz-deploy-basic § update-merge.)"
fi

echo ""
echo "=== Done: thin-client bootstrap (Business OS) → $DEST_ROOT ==="
echo "  .cursorrules: $([ -f "$CURS_DEST" ] && echo present || echo MISSING)"
echo "  AGENT_OS_SOURCE: $(grep -oE 'AGENT_OS_SOURCE=[^[:space:]`]*' "$CURS_DEST" 2>/dev/null | head -1 | cut -d= -f2- || echo '<unset — fat-client>')"
echo "  .work.biz/: $([ -d "${DEST_ROOT}/.work.biz" ] && echo present || echo MISSING)"
echo "  skills (local): $([ -d "${DEST_ROOT}/.ai.biz/skills" ] && echo "present — fat-client (unexpected for basic)" || echo 'absent — thin-client (skills load from source)')"
echo ""
echo "Next steps in target project:"
echo "  1. Edit ${DEST_ROOT}/.cursorrules — fill every REPLACE: token EXCEPT AGENT_OS_SOURCE (biz-deploy-basic set it)"
echo "  2. Verify source is reachable:  test -d \"\$(grep -oE 'AGENT_OS_SOURCE=[^ ]*' $CURS_DEST | cut -d= -f2-)\""
echo "  3. Run @biz-session start  (skill loads from \$AGENT_OS_SOURCE/skills/biz-session/skill.md)"
echo "  4. For project-tracking context: @biz-session context"

# ── Post-deploy verification: every deploy proves the target .cursorrules ──
# update already repaired via --fix above; skip/force verifies read-only
# (repair is update's job — no-overwrite mode must not edit an existing file).
echo ""
echo "=== post-deploy verification ==="
final_rc=0
BIZ_SOURCE="$BIZ_ROOT" bash "$BIZ_ROOT/scripts/biz-cursorrules-verify.sh" "$DEST_ROOT" || final_rc=$?
if [[ "$final_rc" -ne 0 ]]; then
  if [[ "$MODE" == "update" ]]; then
    echo "  update could not auto-repair all findings — review [FAIL] lines above"
    exit "$final_rc"
  fi
  echo "  (findings are pre-existing; run @biz-deploy-basic update to repair)"
fi
