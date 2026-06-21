#!/usr/bin/env bash
# framework-verify.sh — Self-verification for Business OS framework
set -euo pipefail

AI_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$AI_ROOT"

errors=0

echo "=== Business OS Framework Verify ==="

# Check required tools
for cmd in git rsync sed grep find; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "FAIL: missing required tool: $cmd"
    errors=$((errors + 1))
  fi
done

# Check that we're in a git repo
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  echo "FAIL: not a git repository"
  errors=$((errors + 1))
fi

# Check all skills exist and have skill.md
skills_dir="$AI_ROOT/skills"
skill_count=0
for skill_dir in "$skills_dir"/*/; do
  name="$(basename "$skill_dir")"
  if [[ -f "$skill_dir/skill.md" ]]; then
    skill_count=$((skill_count + 1))
  else
    echo "WARN: skill $name missing skill.md"
  fi
done
echo "  Skills: $skill_count"

# Check that all skills are registered in README
readme_count=$(grep -c '^| deploy-\|^| biz-\|^| session-' "$AI_ROOT/skills/README.md" 2>/dev/null || echo 0)
echo "  Skills registered in README: $readme_count"

# Check .work.biz skeleton exists
for f in context/HANDOFF.md plans/NEXT.md plans/UNKNOWNS.md; do
  if [[ ! -f "$AI_ROOT/.work.biz/$f" ]]; then
    echo "WARN: missing .work.biz/$f"
  fi
done

# Check core files exist
for f in README.md START_HERE.md CONVENTIONS.md PROCESS_ROUTER.md LICENSE .gitignore CHANGELOG.md; do
  if [[ -f "$AI_ROOT/$f" ]]; then
    echo "  OK: $f"
  else
    echo "FAIL: missing $f"
    errors=$((errors + 1))
  fi
done

# Check deploy scripts exist and are executable
for f in scripts/deploy-files.sh scripts/deploy-repo.sh; do
  if [[ -x "$AI_ROOT/$f" ]]; then
    echo "  OK: $f (executable)"
  else
    echo "WARN: $f missing or not executable"
  fi
done

echo ""
if [[ "$errors" -eq 0 ]]; then
  echo "=== All checks passed ==="
else
  echo "=== $errors error(s) found ==="
fi
exit "$errors"
