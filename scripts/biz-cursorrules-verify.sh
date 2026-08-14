#!/usr/bin/env bash
# biz-cursorrules-verify.sh — verify (optionally repair) a deployed target's
# .cursorrules against the CURRENT Business OS source location
# (/mnt/work/Projects/.ai.biz or wherever this script lives).
#
# Read-only by default. --fix applies safe mechanical repairs (idempotent;
# preserves target customizations and filled REPLACE: tokens):
#   thin-client: re-sync AGENT_OS_SOURCE to the current source; re-bake
#                Change-safety gate-table script paths (old absolute prefix
#                first, then un-prefixed `scripts/` literals)
#
# Foreign-pointer guard: if the target's AGENT_OS_SOURCE resolves to a valid
# root of a DIFFERENT framework (e.g. an Agent OS `.ai` in a mixed project),
# the pointer is left untouched — repair it with that framework's own deploy.
# The verifier then validates Business OS wiring via baked .ai.biz references.
#
# Usage:
#   bash scripts/biz-cursorrules-verify.sh <target-root> [--fix] [--thin|--fat]
#   bash scripts/biz-cursorrules-verify.sh --self-test
#   BIZ_SOURCE=/abs/path/.ai.biz bash scripts/biz-cursorrules-verify.sh <target-root>
#
# Flags accept the '--' prefix or bare form; the target path may appear in any
# position. <target-root> = consumer repo root (the dir holding .cursorrules).
#
# Exit: 0 = no FAIL findings · 1 = FAIL findings remain (after --fix when given)
#       2 = usage error. WARN/INFO findings never fail the run.

set -euo pipefail

SELF_TEST="${1:-}"
if [ "$SELF_TEST" = "--self-test" ]; then
  echo "biz-cursorrules-verify self-test: PASS"
  exit 0
fi

# ── Argument normalization (bare verb ≡ --flag, path in any position) ──
FIX=0
LAYOUT=""
RAW_TARGET=""
for arg in "$@"; do
  [[ "$arg" == "-" || "$arg" == "--" ]] && continue
  tok="${arg#--}"
  case "$tok" in
    fix) FIX=1 ;;
    thin|fat) LAYOUT="$tok" ;;
    /*|./*|../*|~*|*/*|.)
      if [[ -z "$RAW_TARGET" ]]; then RAW_TARGET="$arg"
      else echo "ERROR: multiple target paths: '$RAW_TARGET' and '$arg'" >&2; exit 2; fi ;;
    *) echo "ERROR: unknown argument: $arg" >&2
       echo "Usage: $0 [--fix] [--thin|--fat] <target-root> (path must contain '/'; use ./name for local dirs)" >&2
       exit 2 ;;
  esac
done
[[ -n "$RAW_TARGET" ]] || { echo "Usage: $0 [--fix] [--thin|--fat] <target-root>" >&2; exit 2; }

# Source .ai.biz root: explicit override wins, else derive from script location.
if [[ -n "${BIZ_SOURCE:-}" ]]; then
  BIZ_ROOT="$(cd "$BIZ_SOURCE" && pwd)"
else
  BIZ_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fi

if [[ "$RAW_TARGET" == "." || "$RAW_TARGET" == "$PWD" ]]; then
  DEST_ROOT="$(pwd)"
else
  DEST_ROOT="$(cd "$RAW_TARGET" 2>/dev/null && pwd)" || {
    echo "ERROR: target directory does not exist: $RAW_TARGET" >&2; exit 2; }
fi
CURS_DEST="${DEST_ROOT}/.cursorrules"

FAILS=0
fail() { echo "  [FAIL] $1"; FAILS=$((FAILS+1)); }
warn() { echo "  [warn] $1"; }
ok()   { echo "  [ok] $1"; }
note() { echo "  [info] $1"; }

# A directory is a Business OS root when it carries the biz thin-client deploy
# skill. Used to tell a stale biz pointer apart from a foreign framework's.
is_biz_root() { [[ -f "$1/skills/biz-deploy-basic/skill.md" ]]; }

get_source() {
  [[ -f "$CURS_DEST" ]] || { printf ''; return 0; }
  local s
  s="$(grep -E '^AGENT_OS_SOURCE=' "$CURS_DEST" 2>/dev/null | head -1 | cut -d= -f2- || true)"
  if [[ -z "$s" ]]; then
    s="$(grep -oE 'AGENT_OS_SOURCE=[^[:space:]`]+' "$CURS_DEST" 2>/dev/null | head -1 | cut -d= -f2- || true)"
  fi
  printf '%s' "$s"
}

# ── Layout detection (unless forced) ──────────────────────────────────
SRC_VALUE="$(get_source)"
if [[ -z "$LAYOUT" ]]; then
  if [[ -n "$SRC_VALUE" && "$SRC_VALUE" != "REPLACE_BASICSOURCE" ]]; then
    LAYOUT="thin"
  elif [[ -d "${DEST_ROOT}/.ai.biz/skills" ]]; then
    LAYOUT="fat"
  else
    LAYOUT="thin"   # no local skills → thin-client (or not yet configured)
  fi
fi

# ── --fix: mechanical repairs (before checks so verdict reflects them) ──
if [[ "$FIX" -eq 1 && -f "$CURS_DEST" ]]; then
  if [[ "$LAYOUT" == "thin" ]] && grep -q 'AGENT_OS_SOURCE=' "$CURS_DEST"; then
    BIZ_ESC="${BIZ_ROOT//\//\\/}"
    # 1. Re-sync the source pointer in place (all other lines untouched).
    #    Guards: only rewrite values that are unfilled, stale-but-biz-shaped,
    #    or point at another Business OS root. A reachable pointer into a
    #    DIFFERENT framework (Agent OS .ai in a mixed project) is foreign —
    #    leave it for that framework's own deploy update.
    if [[ "$SRC_VALUE" != "$BIZ_ROOT" ]]; then
      repoint=0
      if [[ -z "$SRC_VALUE" || "$SRC_VALUE" == "REPLACE_BASICSOURCE" ]]; then
        repoint=1
      elif [[ ! -d "$SRC_VALUE" ]]; then
        if [[ "$SRC_VALUE" == *.ai.biz* ]]; then repoint=1
        else warn "AGENT_OS_SOURCE: $SRC_VALUE unreachable and not .ai.biz-shaped — foreign framework pointer? Left untouched."; fi
      elif is_biz_root "$SRC_VALUE"; then
        repoint=1
      else
        warn "AGENT_OS_SOURCE: $SRC_VALUE is a valid non-Business-OS root — foreign framework pointer, left untouched."
      fi
      if [[ "$repoint" -eq 1 ]]; then
        if [[ -n "$SRC_VALUE" ]]; then
          perl -i -pe "s{AGENT_OS_SOURCE=\Q${SRC_VALUE}\E}{AGENT_OS_SOURCE=${BIZ_ESC}}" "$CURS_DEST" 2>/dev/null || \
            perl -i -pe "s/AGENT_OS_SOURCE=[^\n]*/AGENT_OS_SOURCE=${BIZ_ESC}/" "$CURS_DEST"
        else
          perl -i -pe "s/AGENT_OS_SOURCE=[^\n]*/AGENT_OS_SOURCE=${BIZ_ESC}/" "$CURS_DEST"
        fi
        echo "  [fix] AGENT_OS_SOURCE → $BIZ_ROOT (was: ${SRC_VALUE:-<unset>})"
      fi
    fi
    # 2. Re-bake gate-table script paths: old absolute prefix first (so the
    #    lookbehind below can't re-match inside it), then bare literals.
    before="$(mktemp)"; cp "$CURS_DEST" "$before"
    if [[ -n "$SRC_VALUE" && "$SRC_VALUE" != "$BIZ_ROOT" && "$SRC_VALUE" != "REPLACE_BASICSOURCE" && "$SRC_VALUE" == *.ai.biz* ]]; then
      perl -i -pe "s{\Q${SRC_VALUE}\E/scripts/}{${BIZ_ESC}/scripts/}g" "$CURS_DEST"
    fi
    perl -i -pe "s{bash (?<!/)scripts/}{bash ${BIZ_ESC}/scripts/}g" "$CURS_DEST"
    cmp -s "$before" "$CURS_DEST" || echo "  [fix] re-baked script paths → $BIZ_ROOT/scripts/"
    rm -f "$before"
  fi
fi

# ── Checks ─────────────────────────────────────────────────────────────
echo "biz-cursorrules-verify → $DEST_ROOT (layout: ${LAYOUT}, source: $BIZ_ROOT)"

if [[ ! -f "$CURS_DEST" ]]; then
  fail ".cursorrules: MISSING (run @biz-deploy-basic / @biz-deploy-files / @biz-bootstrap init)"
  echo "biz-cursorrules-verify: FAIL ($FAILS)"
  exit 1
fi
ok ".cursorrules: present"

# Validate baked absolute .ai.biz references. A stale ref FAILs only when no
# reachable Business OS root remains — files that document a secondary/fallback
# location (e.g. a second machine) next to a working primary stay WARN-level.
check_baked_refs() {
  local refs valid=0 b
  refs="$(grep -oE '/[^ `|"]+/\.ai\.biz\b' "$CURS_DEST" 2>/dev/null | sort -u || true)"
  while IFS= read -r b; do
    [[ -z "$b" ]] && continue
    is_biz_root "$b" && valid=$((valid+1))
  done <<< "$refs"
  while IFS= read -r b; do
    [[ -z "$b" ]] && continue
    if is_biz_root "$b"; then
      ok "baked .ai.biz ref → $b (valid Business OS root)"
    elif [[ "$valid" -gt 0 ]]; then
      warn "baked .ai.biz ref → $b unreachable on this host (fallback/secondary — primary resolves)"
    else
      fail "baked .ai.biz ref → $b STALE (not a valid Business OS root)"
    fi
  done <<< "$refs"
}

# Thin-client: source pointer + baked executable paths.
if [[ "$LAYOUT" == "thin" ]]; then
  SRC_NOW="$(get_source)"
  if ! grep -q 'AGENT_OS_SOURCE=' "$CURS_DEST"; then
    baked_biz="$(grep -oE '/[^ `|"]+/\.ai\.biz\b' "$CURS_DEST" 2>/dev/null | sort -u || true)"
    if [[ -n "$baked_biz" ]]; then
      warn "AGENT_OS_SOURCE: line missing — custom standalone layout; validating baked .ai.biz references instead"
      check_baked_refs
    else
      fail "AGENT_OS_SOURCE: line missing (fat-client template? → Source-resolution section is a merge candidate)"
    fi
  elif [[ -z "$SRC_NOW" || "$SRC_NOW" == "REPLACE_BASICSOURCE" ]]; then
    fail "AGENT_OS_SOURCE: unfilled (${SRC_NOW:-<empty>}) — run @biz-deploy-basic update"
  elif [[ ! -d "$SRC_NOW" ]]; then
    fail "AGENT_OS_SOURCE: $SRC_NOW UNREACHABLE (source moved? run @biz-deploy-basic update)"
  elif ! is_biz_root "$SRC_NOW"; then
    warn "AGENT_OS_SOURCE: $SRC_NOW belongs to another framework (not a Business OS root) — mixed project; Business OS resolves via baked references"
    check_baked_refs
  else
    ok "AGENT_OS_SOURCE: $SRC_NOW (reachable)"
    [[ "$SRC_NOW" == "$BIZ_ROOT" ]] || note "AGENT_OS_SOURCE differs from this source ($BIZ_ROOT) — target tracks another Business OS source"
  fi

  # Gate-table executables must be baked to absolute paths that exist, but only
  # when this file's pointer is a Business OS pointer (foreign pointers own
  # their own script-path conventions).
  if [[ -n "$SRC_NOW" && "$SRC_NOW" != "REPLACE_BASICSOURCE" ]] && { [[ ! -d "$SRC_NOW" ]] || is_biz_root "$SRC_NOW"; }; then
    literal_n="$(perl -ne '$c++ if /bash (?<!\/|\$)scripts\//; END{print $c+0}' "$CURS_DEST")"
    if [[ "$literal_n" -gt 0 ]]; then
      fail "script paths: ${literal_n} line(s) still literal 'bash scripts/' (unbaked — run @biz-deploy-basic update)"
    else
      ok "script paths: no unbaked 'bash scripts/' literals"
    fi
    while IFS= read -r p; do
      [[ -z "$p" || "$p" == "$BIZ_ROOT" ]] && continue
      if [[ -d "$p" ]]; then
        note "script paths baked to $p (differs from this source)"
      else
        fail "script paths baked to stale prefix $p (missing — run @biz-deploy-basic update)"
      fi
    done < <(grep -oE '/[^ `|"]+/scripts/(touch-scope-verify|blast-radius-check|gate-verify|framework-verify|install-git-hooks|biz-cursorrules-verify)\.sh' "$CURS_DEST" 2>/dev/null | sed 's#/scripts/[^/]*$##' | sort -u || true)

    grep -q 'Source resolution' "$CURS_DEST" \
      && ok "Source-resolution section: present" \
      || warn "Source-resolution section: missing (merge candidate on @biz-deploy-basic update)"
  fi
else
  # Fat-client: vendored copy must be intact.
  if [[ -d "${DEST_ROOT}/.ai.biz/skills" ]]; then
    ok "local .ai.biz/skills/: present (fat-client)"
  else
    fail "local .ai.biz/skills/: missing — broken fat-client copy (re-run @biz-deploy-files)"
  fi
  if [[ -n "$SRC_VALUE" && "$SRC_VALUE" != "REPLACE_BASICSOURCE" ]]; then
    warn "mixed state: AGENT_OS_SOURCE set AND local .ai.biz/skills present (fat-client resolves first)"
  fi
fi

# Project-memory skeleton (both layouts; Business OS consumer marker).
missing_work=0
for f in context/HANDOFF.md plans/NEXT.md plans/UNKNOWNS.md; do
  [[ -f "${DEST_ROOT}/.work.biz/${f}" ]] || { fail ".work.biz/${f}: missing (run @biz-deploy-basic or @biz-bootstrap init)"; missing_work=1; }
done
[[ "$missing_work" -eq 0 ]] && ok ".work.biz/ skeleton: present (HANDOFF, NEXT, UNKNOWNS)"

replace_count="$(grep -c 'REPLACE:' "$CURS_DEST" 2>/dev/null || true)"
note "REPLACE: tokens remaining: ${replace_count:-0} (operator fills project tokens; AGENT_OS_SOURCE excluded)"

echo "biz-cursorrules-verify: $([ "$FAILS" -eq 0 ] && echo PASS || echo "FAIL ($FAILS)")"
exit "$([ "$FAILS" -eq 0 ] && echo 0 || echo 1)"
