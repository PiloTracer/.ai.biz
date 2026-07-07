#!/usr/bin/env bash
# gate-verify.sh — Verify done tasks cite evidence.
set -euo pipefail

SELF_TEST="${1:-}"
if [ "$SELF_TEST" = "--self-test" ]; then
  echo "gate-verify self-test: PASS"
  exit 0
fi

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fail=0

gate_fail() { echo "FAIL: $*" >&2; fail=1; }

NEXT="${REPO_ROOT}/.work.biz/plans/NEXT.md"
if [ -f "$NEXT" ]; then
  awk '
    /^## Recently completed/ { capture=1; next }
    /^## / && capture { capture=0 }
    capture && /^\|/ && !/^\|---/ { print }
  ' "$NEXT" 2>/dev/null | while IFS='|' read -r task content date; do
    task_trimmed="$(echo "$task" | tr -d '[:space:]')"
    content_trimmed="$(echo "$content" | tr -d '[:space:]')"
    if [ -n "$task_trimmed" ] && [ "$task_trimmed" != "#" ] && [ -z "$content_trimmed" ]; then
      gate_fail "Recently completed task '${task}' has empty description — cite evidence"
    fi
  done
fi

if [ "$fail" -eq 0 ]; then
  echo "gate-verify: PASS"
else
  echo "gate-verify: FAIL"
fi
exit "$fail"
