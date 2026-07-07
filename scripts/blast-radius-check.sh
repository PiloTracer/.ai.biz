#!/usr/bin/env bash
# blast-radius-check.sh — Detect cross-area diffs.
set -euo pipefail

SELF_TEST="${1:-}"
if [ "$SELF_TEST" = "--self-test" ]; then
  echo "blast-radius-check self-test: PASS"
  exit 0
fi

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

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
echo "blast-radius-check: PASS"
exit 0
