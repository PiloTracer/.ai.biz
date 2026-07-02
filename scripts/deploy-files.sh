#!/usr/bin/env bash
# deploy-files.sh — Deploy .ai.biz (Business OS) files into a target project
#
# Default = NO-OVERWRITE. Use --force for legacy overwrite, or --update for merge
# candidates when source files differ from target copies.
#
# Usage:
#   bash scripts/deploy-files.sh <target-path>              # no-overwrite
#   bash scripts/deploy-files.sh <target-path> --force      # overwrite existing
#   bash scripts/deploy-files.sh <target-path> --update     # no-overwrite + merge list
#   BIZ_SOURCE=/path/.ai.biz bash scripts/deploy-files.sh <target-path>
#
set -euo pipefail

RAW_TARGET="${1:?Usage: $0 <target-path> [--force|--update]}"
shift || true
MODE="skip"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --force)   MODE="force" ;;
    --update)  MODE="update" ;;
    *) echo "ERROR: unknown flag: $1" >&2; exit 1 ;;
  esac
  shift
done

if [[ -n "${BIZ_SOURCE:-}" ]]; then
  BIZ_ROOT="$(cd "$BIZ_SOURCE" && pwd)"
else
  BIZ_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fi

if [[ "$RAW_TARGET" == *.ai.biz ]]; then
  DEST_DIR="$RAW_TARGET"
else
  DEST_DIR="${RAW_TARGET}/.ai.biz"
fi

PARENT="$(dirname "$DEST_DIR")"
if [[ ! -d "$PARENT" ]]; then
  echo "ERROR: parent directory does not exist: $PARENT" >&2
  exit 1
fi

if [[ -e "$DEST_DIR" ]] && [[ ! -d "$DEST_DIR" ]]; then
  echo "ERROR: $DEST_DIR exists but is not a directory" >&2
  exit 1
fi

if ! (cd "$BIZ_ROOT" && git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
  echo "ERROR: source $BIZ_ROOT is not a git repo." >&2
  exit 1
fi

GIT_TOP="$(cd "$BIZ_ROOT" && git rev-parse --show-toplevel)"
if [[ "$GIT_TOP" != "$BIZ_ROOT" ]]; then
  echo "ERROR: $BIZ_ROOT is not the git repo root (root is $GIT_TOP)." >&2
  exit 1
fi

echo "=== deploy-files → $DEST_DIR ==="
echo "  source: $BIZ_ROOT"
echo "  mode:   $MODE (no-overwrite by default)"

SKILL_EXCLUDE_REGEX='^(\.github/|\.gitignore$|\.gitattributes$|\.cursorrules$|scripts/deploy-files\.sh$|scripts/deploy-basic\.sh$|scripts/deploy-repo\.sh$)'

TMP_LIST="$(mktemp)"
MERGE_CANDS="$(mktemp)"
trap 'rm -f "$TMP_LIST" "$MERGE_CANDS"' EXIT

( cd "$BIZ_ROOT" \
  && git ls-files --cached --others --exclude-standard \
  | grep -vE "$SKILL_EXCLUDE_REGEX" \
) > "$TMP_LIST"

COUNT="$(wc -l < "$TMP_LIST" | tr -d ' ')"
mkdir -p "$DEST_DIR"

SKIPPED=0
if [[ "$MODE" != "force" ]]; then
  while IFS= read -r rel; do
    [[ -z "$rel" ]] && continue
    if [[ -f "$DEST_DIR/$rel" ]]; then
      SKIPPED=$((SKIPPED+1))
      if [[ "$MODE" == "update" ]] && ! cmp -s "$BIZ_ROOT/$rel" "$DEST_DIR/$rel"; then
        echo "$rel" >> "$MERGE_CANDS"
      fi
    fi
  done < "$TMP_LIST"
fi

if [[ "$MODE" == "force" ]]; then
  rsync -a --files-from="$TMP_LIST" "$BIZ_ROOT"/ "$DEST_DIR"/
else
  rsync -a --ignore-existing --files-from="$TMP_LIST" "$BIZ_ROOT"/ "$DEST_DIR"/
fi

COPIED=$((COUNT - SKIPPED))
echo "  copied: $COPIED files (git-ignored content excluded by policy)"
echo "  skipped (exists): $SKIPPED files"

if [[ "$MODE" == "update" ]] && [[ -s "$MERGE_CANDS" ]]; then
  MERGE_N="$(wc -l < "$MERGE_CANDS" | tr -d ' ')"
  echo ""
  echo "=== update merge candidates ($MERGE_N existing-but-differing files) ==="
  while IFS= read -r rel; do
    echo "  merge: $rel"
  done < "$MERGE_CANDS"
fi

if [[ "$RAW_TARGET" == "." || "$RAW_TARGET" == "$PWD" ]]; then
  REPO_ROOT="$(cd "$PARENT" && pwd)"
  REPO_ROOT="$REPO_ROOT" BIZ_SOURCE="$BIZ_ROOT" bash "$BIZ_ROOT/templates/bootstrap.sh" \
    > /tmp/deploy-files-biz-bootstrap.$$.log 2>&1 || { cat /tmp/deploy-files-biz-bootstrap.$$.log; rm -f /tmp/deploy-files-biz-bootstrap.$$.log; exit 1; }
  grep -E '(created:|skip )' /tmp/deploy-files-biz-bootstrap.$$.log | sed 's/^/  scaffold: /' || true
  rm -f /tmp/deploy-files-biz-bootstrap.$$.log
  SCAFFOLD_DONE=1
fi

echo ""
echo "=== Done: files deployed to $DEST_DIR ==="
if [[ -n "${SCAFFOLD_DONE:-}" ]]; then
  echo "  Scaffold created (.work.biz/, .cursorrules)"
else
  echo "Next: @biz-bootstrap init or bash templates/bootstrap.sh"
fi
echo "  Then: @biz-strategy greenfield"
