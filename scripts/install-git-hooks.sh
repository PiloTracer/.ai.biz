#!/usr/bin/env bash
# Install Business OS git hooks.
set -euo pipefail

BIZ_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# This script writes into .git/hooks, so an unrecognized flag must never fall through
# to a real install. Anything not understood is a hard error.
DRY_RUN=0
for arg in "$@"; do
  case "$arg" in
    --self-test|--dry-run) DRY_RUN=1 ;;
    -h|--help)
      echo "usage: install-git-hooks.sh [--self-test|--dry-run]"
      echo "  installs Business OS git hooks into the enclosing repo's .git/hooks"
      echo "  --self-test  report what would be installed, write nothing"
      exit 0
      ;;
    *)
      echo "ERROR: unknown argument: $arg" >&2
      echo "usage: install-git-hooks.sh [--self-test|--dry-run]" >&2
      exit 2
      ;;
  esac
done

if [ -d "${PWD}/.git" ]; then
  HOOK_DEST="${PWD}/.git/hooks"
elif [ -d "${BIZ_ROOT}/../.git" ]; then
  HOOK_DEST="$(cd "${BIZ_ROOT}/.." && pwd)/.git/hooks"
else
  echo "ERROR: no .git directory found" >&2
  exit 1
fi

HOOK_SRC="${BIZ_ROOT}/hooks"
# Back up beside the hooks being replaced, not into the framework repo: when the
# framework is a sibling of the target, a BIZ_ROOT-based path buries the target's
# hooks in an unrelated repo where nobody looks to restore them.
BACKUP_DIR="$(dirname "$HOOK_DEST")/hooks-backup-$(date +%Y%m%d%H%M%S)"
count=0
for hook in prepare-commit-msg commit-msg pre-commit post-commit; do
  src="${HOOK_SRC}/${hook}"
  if [ ! -f "$src" ]; then
    echo "  skip (missing): $src"
    continue
  fi
  if [ "$DRY_RUN" -eq 1 ]; then
    if [ -f "${HOOK_DEST}/${hook}" ]; then
      echo "  would replace (backup first): ${HOOK_DEST}/${hook}"
    else
      echo "  would install: ${HOOK_DEST}/${hook}"
    fi
    count=$((count + 1))
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

if [ "$DRY_RUN" -eq 1 ]; then
  echo "self-test OK: ${count} hooks would be installed into ${HOOK_DEST} (nothing written)"
  exit 0
fi

echo "Business OS git hooks: ${count} installed into ${HOOK_DEST}"
if [ -d "$BACKUP_DIR" ]; then
  echo "  previous hooks backed up to: ${BACKUP_DIR}"
fi
