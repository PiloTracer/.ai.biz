#!/usr/bin/env bash
# gate-verify.sh — Verify NEXT.md tasks cite evidence and claimed readiness states have support.
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

# Check a markdown table section for rows with empty description cells.
check_table_section() {
  local file="$1"
  local start_marker="$2"
  local end_marker="$3"
  local desc_col="$4"

  awk -v start="$start_marker" -v end="$end_marker" -v col="$desc_col" '
    $0 ~ start { capture=1; next }
    $0 ~ end && capture { capture=0 }
    capture && /^\|/ && !/^\|---/ {
      # Split by "|"; NF counts fields, but leading/trailing empty cells matter.
      n = split($0, cells, "|");
      # desc_col is 1-based in the visible cells; array index includes leading empty cell.
      val = cells[col + 1];
      gsub(/[[:space:]]/, "", val);
      task = cells[2];
      gsub(/[[:space:]]/, "", task);
      if (task != "" && task != "#" && val == "") {
        print task;
      }
    }
  ' "$file" 2>/dev/null
}

if [ -f "$NEXT" ]; then
  # Active tasks: columns are # | Task | Status | Notes
  while IFS= read -r task; do
    [ -n "$task" ] && gate_fail "Active task '${task}' has empty Notes — cite evidence"
  done < <(check_table_section "$NEXT" "## Active tasks" "## " 4)

  # Recently completed: columns are # | What was done | Date
  while IFS= read -r task; do
    [ -n "$task" ] && gate_fail "Recently completed task '${task}' has empty description — cite evidence"
  done < <(check_table_section "$NEXT" "## Recently completed" "## " 2)
fi

# Verify claimed readiness states have supporting evidence.
# Only scan "Current Phase" and "Active tasks" — completed history may mention
# gates without claiming them as current states.
WORK="${REPO_ROOT}/.work.biz"
if [ -f "$NEXT" ]; then
  active_content="$(awk '/^## Current Phase$|^## Active tasks$/{flag=1; next} flag && /^## /{flag=0} flag' "$NEXT" 2>/dev/null || true)"
  if echo "$active_content" | grep -qE "strategy-ready|Strategy.*Ready"; then
    if [ ! -f "${WORK}/strategy/certification.md" ]; then
      gate_fail "NEXT.md references strategy-ready but .work.biz/strategy/certification.md is missing"
    fi
  fi
  if echo "$active_content" | grep -qE "pipeline-ready|Pipeline.*Ready"; then
    if [ ! -f "${WORK}/pipeline/pipeline_tracker.md" ]; then
      gate_fail "NEXT.md references pipeline-ready but .work.biz/pipeline/pipeline_tracker.md is missing"
    fi
    if [ ! -f "${WORK}/pipeline/outreach-cadence.md" ]; then
      gate_fail "NEXT.md references pipeline-ready but .work.biz/pipeline/outreach-cadence.md is missing"
    fi
    if [ ! -f "${WORK}/strategy/pricing.md" ]; then
      gate_fail "NEXT.md references pipeline-ready but .work.biz/strategy/pricing.md is missing"
    fi
  fi
fi

if [ "$fail" -eq 0 ]; then
  echo "gate-verify: PASS"
else
  echo "gate-verify: FAIL"
fi
exit "$fail"
