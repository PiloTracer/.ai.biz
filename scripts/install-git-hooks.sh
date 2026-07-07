#!/usr/bin/env bash
# Install Business OS git hooks.
set -euo pipefail

BIZ_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ -d "${PWD}/.git" ]; then
  HOOK_DEST="${PWD}/.git/hooks"
elif [ -d "${BIZ_ROOT}/../.git" ]; then
  HOOK_DEST="$(cd "${BIZ_ROOT}/.." && pwd)/.git/hooks"
else
  echo "ERROR: no .git directory found" >&2
  exit 1
fi

HOOK_SRC="${BIZ_ROOT}/hooks"
BACKUP_DIR="${BIZ_ROOT}/.git/hooks-backup-$(date +%Y%m%d%H%M%S)"
count=0
for hook in prepare-commit-msg commit-msg pre-commit post-commit; do
  src="${HOOK_SRC}/${hook}"
  if [ ! -f "$src" ]; then
    echo "  skip (missing): $src"
    continue
  fi
  if [ -f "${HOOK_DEST}/${hook}" ]; then
    mkdir -p "$BACKUP_DIR"
    cp "${HOOK_DEST}/${hook}" "${BACKUP_DIR}/${hook}"
    echo "  backup: ${HOOK_DEST}/${hook} → ${BACKUP_DIR}/${hook}"
  fi
  cp "$src" "${HOOK_DEST}/${hook}"
  chmod +x "${HOOK_DEST}/${hook}"
  count=$((count + 1))
  echo "  installed: ${HOOK_DEST}/${hook}"
done

echo "Business OS git hooks: ${count} installed into ${HOOK_DEST}"
if [ -d "$BACKUP_DIR" ]; then
  echo "  previous hooks backed up to: ${BACKUP_DIR}"
fi
