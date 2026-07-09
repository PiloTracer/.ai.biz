#!/usr/bin/env bash
# blast-radius-check.sh — Detect cross-area diffs.
#
# Default: exit non-zero when ≥3 top-level areas are touched (high risk).
# Use --warn-only to print the risk and exit 0.
set -euo pipefail

WARN_ONLY=0
SELF_TEST=0

for arg in "$@"; do
  case "$arg" in
    --warn-only) WARN_ONLY=1 ;;
    --self-test) SELF_TEST=1 ;;
  esac
done

if [ "$SELF_TEST" -eq 1 ]; then
  echo "blast-radius-check self-test: PASS"
  exit 0
fi

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

CHANGED="$(git diff --name-only HEAD 2>/dev/null || true)"
STAGED="$(git diff --cached --name-only HEAD 2>/dev/null || true)"
ALL_FILES="$(echo -e "${CHANGED}\n${STAGED}" | sort -u | grep -v '^$' || true)"

if [ -z "$ALL_FILES" ]; then
  echo "blast-radius: files=0 areas=none risk=low"
  echo "blast-radius-check: PASS"
  exit 0
fi

declare -A AREAS
for f in $ALL_FILES; do
  area="$(echo "$f" | cut -d/ -f1)"
  AREAS["$area"]=$((${AREAS["$area"]:-0} + 1))
done

FILE_COUNT="$(echo "$ALL_FILES" | wc -l)"
AREA_COUNT="${#AREAS[@]}"

RISK="low"
if [ "$AREA_COUNT" -ge 3 ]; then
  RISK="high"
elif [ "$AREA_COUNT" -ge 2 ]; then
  RISK="med"
fi

echo "blast-radius: files=${FILE_COUNT} areas=${AREA_COUNT} risk=${RISK}"
for area in "${!AREAS[@]}"; do
  echo "  ${area}: ${AREAS[$area]}"
done

if [ "$RISK" = "high" ]; then
  if [ "$WARN_ONLY" -eq 1 ]; then
    echo "blast-radius-check: WARN (high risk — consider splitting the change)"
    exit 0
  else
    echo "blast-radius-check: FAIL (high risk — ≥3 areas touched; use --warn-only to override)"
    exit 1
  fi
fi

echo "blast-radius-check: PASS"
exit 0
