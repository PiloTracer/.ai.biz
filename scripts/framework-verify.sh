#!/usr/bin/env bash
# framework-verify.sh — Self-verification for Business OS framework
set -euo pipefail

SELF_TEST="${1:-}"
if [ "$SELF_TEST" = "--self-test" ]; then
  echo "framework-verify self-test: PASS"
  exit 0
fi

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
  # Frontmatter name must match folder name.
  fm_name="$(grep -m1 '^name:' "$d/skill.md" | sed 's/^name:[[:space:]]*//' | tr -d '[:space:]')"
  [[ "$fm_name" == "$id" ]] || die "skills/${id}/skill.md frontmatter name '${fm_name}' does not match folder"
done < <(find "$AI_ROOT/skills" -mindepth 1 -maxdepth 1 -type d ! -name '.*' | sort)
ok "${skill_count} skills registered"

# README skill count must match folder count.
readme_count="$(grep -oE '[0-9]+ skills in total' "$AI_ROOT/README.md" | grep -oE '[0-9]+' | head -1 || true)"
if [[ -n "$readme_count" ]] && [[ "$readme_count" -eq "$skill_count" ]]; then
  ok "README.md skill count (${readme_count}) matches folder count"
else
  die "README.md skill count (${readme_count:-missing}) does not match folder count (${skill_count})"
fi

# .cursorrules skills table must include every skill listed in skills/README.md.
while IFS= read -r skill_id; do
  [[ -z "$skill_id" ]] && continue
  grep -qE "^\\| ${skill_id} " "$AI_ROOT/.cursorrules" || die "skills/README.md lists '${skill_id}' but it is missing from .cursorrules skills table"
done < <(awk '/^## Registered skills$/{flag=1; next} flag && /^## /{flag=0} flag && /^[|]/{print $2}' "$AI_ROOT/skills/README.md" | grep -E '^[a-z0-9_-]+$' | sort -u)
ok ".cursorrules skills table covers skills/README.md entries"

# Every skill.md must be tracked by git (catches new-but-unstaged skills).
while IFS= read -r skill_md; do
  git ls-files --error-unmatch "$skill_md" >/dev/null 2>&1 || die "${skill_md} is not tracked by git — stage before commit"
done < <(find "$AI_ROOT/skills" -mindepth 2 -maxdepth 2 -type f -name 'skill.md' | sort)
ok "all skill.md files are tracked by git"

note "Standards non-empty"
std_count=0
while IFS= read -r f; do
  std_count=$((std_count + 1))
  lines="$(wc -l < "$f")"
  [[ "$lines" -gt 5 ]] || die "standard $(basename "$f") is empty or a stub (${lines} lines)"
done < <(find "$AI_ROOT/standards" -maxdepth 1 -type f -name '*.md' | sort)
ok "${std_count} standards non-empty"

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
