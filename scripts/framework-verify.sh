#!/usr/bin/env bash
# framework-verify.sh — Self-verification for Business OS framework
set -euo pipefail

AI_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$AI_ROOT"

errors=0
note() { echo ""; echo "==> $1"; }
ok() { echo "    OK: $1"; }
die() { echo "    FAIL: $1"; errors=$((errors + 1)); }

echo "=== Business OS Framework Verify ==="

note "Required tools"
for cmd in git rsync bash grep find; do
  if command -v "$cmd" &>/dev/null; then ok "$cmd"; else die "missing $cmd"; fi
done

note "Git repo"
git rev-parse --is-inside-work-tree &>/dev/null && ok "inside git work tree" || die "not a git repository"

note "Core files"
for f in README.md START_HERE.md LICENSE templates/bootstrap.sh \
  scripts/deploy-basic.sh scripts/deploy-files.sh scripts/deploy-repo.sh; do
  [[ -f "$AI_ROOT/$f" ]] && ok "$f" || die "missing $f"
done

note "Skills registered"
skill_count=0
while IFS= read -r d; do
  id="$(basename "$d")"
  skill_count=$((skill_count + 1))
  [[ -f "$d/skill.md" ]] || die "skills/${id}/skill.md missing"
  grep -qE "^\| ${id} " "$AI_ROOT/skills/README.md" || die "skills/${id} not in skills/README.md"
done < <(find "$AI_ROOT/skills" -mindepth 1 -maxdepth 1 -type d ! -name '.*' | sort)
ok "${skill_count} skills registered"

note "deploy-files in-place scaffold"
DF_SMOKE="$(mktemp -d)"
pushd "$DF_SMOKE" >/dev/null
bash "$AI_ROOT/scripts/deploy-files.sh" . >/dev/null
[[ -f .cursorrules ]] || die "deploy-files in-place missing .cursorrules"
[[ -f .work.biz/context/HANDOFF.md ]] || die "deploy-files in-place missing .work.biz/context/HANDOFF.md"
[[ -d .ai.biz/skills ]] || die "deploy-files in-place missing .ai.biz/skills"
popd >/dev/null
ok "deploy-files in-place creates .ai.biz/ + .work.biz/ + .cursorrules"

note "deploy-repo --status"
bash "$AI_ROOT/scripts/deploy-repo.sh" --status >/dev/null
bash "$AI_ROOT/scripts/deploy-repo.sh" --status "$DF_SMOKE" >/dev/null
ok "deploy-repo --status reports source + target"
rm -rf "$DF_SMOKE"

note "deploy-basic thin-client scaffold"
DB_SMOKE="$(mktemp -d)"
bash "$AI_ROOT/scripts/deploy-basic.sh" "$DB_SMOKE" >/dev/null
if [[ -f "${DB_SMOKE}/.cursorrules" ]] && grep -q 'AGENT_OS_SOURCE=' "${DB_SMOKE}/.cursorrules"; then
  ok "deploy-basic creates thin-client .cursorrules + .work.biz/"
else
  die "deploy-basic thin-client scaffold failed"
fi
rm -rf "$DB_SMOKE"

echo ""
if [[ "$errors" -eq 0 ]]; then
  echo "framework-verify: all checks passed"
else
  echo "framework-verify: $errors error(s)"
fi
exit "$errors"
