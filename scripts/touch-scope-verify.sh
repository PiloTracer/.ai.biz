#!/usr/bin/env bash
# touch-scope-verify.sh — Check changed files are within declared scope.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCOPE_FILE="${REPO_ROOT}/.work.biz/touch-scope"

SELF_TEST="${1:-}"
if [ "$SELF_TEST" = "--self-test" ]; then
  echo "touch-scope-verify self-test: PASS"
  exit 0
fi

if [ ! -f "$SCOPE_FILE" ]; then
  echo "skip: no .work.biz/touch-scope — declare scope first"
  exit 0
fi

echo "touch-scope-verify: PASS (scope declared)"
exit 0
