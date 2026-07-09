#!/usr/bin/env bash
# bootstrap.sh — Business OS scaffold for any project
#
# Usage:
#   bash .ai.biz/templates/bootstrap.sh
#   REPO_ROOT=/path/to/app bash .ai.biz/templates/bootstrap.sh
#
set -euo pipefail

if [[ -n "${BIZ_SOURCE:-}" ]]; then
  BIZ_ROOT="$(cd "$BIZ_SOURCE" && pwd)"
else
  BIZ_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fi
TPL="${BIZ_ROOT}/templates/work"

if [[ -n "${REPO_ROOT:-}" ]]; then
  REPO_ROOT="$(cd "$REPO_ROOT" && pwd)"
elif [[ -d "${BIZ_ROOT}/.git" ]]; then
  REPO_ROOT="${BIZ_ROOT}"
elif [[ -d "${BIZ_ROOT}/../.git" ]] && [[ -d "${BIZ_ROOT}/templates" ]]; then
  REPO_ROOT="$(cd "${BIZ_ROOT}/.." && pwd)"
else
  REPO_ROOT="${BIZ_ROOT}"
fi

WORK="${REPO_ROOT}/.work.biz"

copy_if_missing() {
  local src="$1" dest="$2"
  if [[ -e "${dest}" ]]; then
    echo "skip (exists): ${dest}"
  else
    mkdir -p "$(dirname "${dest}")"
    cp "${src}" "${dest}"
    echo "created: ${dest}"
  fi
}

echo "Business OS bootstrap"
echo "  BIZ_ROOT=${BIZ_ROOT}"
echo "  REPO_ROOT=${REPO_ROOT}"
echo ""

mkdir -p "${WORK}"

copy_if_missing "${TPL}/README.md.template" "${WORK}/README.md"
copy_if_missing "${TPL}/context/HANDOFF.md.template" "${WORK}/context/HANDOFF.md"
copy_if_missing "${TPL}/plans/NEXT.md.template" "${WORK}/plans/NEXT.md"
copy_if_missing "${TPL}/plans/UNKNOWNS.md.template" "${WORK}/plans/UNKNOWNS.md"
copy_if_missing "${TPL}/pipeline/pipeline_tracker.md.template" "${WORK}/pipeline/pipeline_tracker.md"
copy_if_missing "${TPL}/pipeline/outreach-cadence.md.template" "${WORK}/pipeline/outreach-cadence.md"
copy_if_missing "${TPL}/research/research_index.md.template" "${WORK}/research/research_index.md"
copy_if_missing "${TPL}/strategy/README.md.template" "${WORK}/strategy/README.md"

for dir in context plans pipeline research drafts strategy reference; do
  mkdir -p "${WORK}/${dir}"
done

echo ""
echo "--- .cursorrules ---"
if [[ -n "${BOOTSTRAP_SKIP_CURSERRULES:-}" ]]; then
  echo "skip (.cursorrules owned by caller): ${REPO_ROOT}/.cursorrules"
elif [[ -f "${REPO_ROOT}/.cursorrules" ]]; then
  echo "skip (exists): ${REPO_ROOT}/.cursorrules"
else
  copy_if_missing "${BIZ_ROOT}/templates/cursorrules.template" "${REPO_ROOT}/.cursorrules"
fi

echo ""
echo "Next: @biz-strategy greenfield · fill REPLACE: tokens in .cursorrules"
