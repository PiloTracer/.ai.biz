#!/usr/bin/env bash
# bootstrap.sh — One-command Business OS setup for any project
#
# Run from the project root (parent of .ai.biz/):
#   bash .ai.biz/templates/bootstrap.sh
#
# Creates:
#   .cursorrules                  from cursorrules.template
#   .work.biz/               skeleton (HANDOFF, NEXT, plans, pipeline)

set -euo pipefail

AI_BUSINESS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_ROOT="$(cd "$AI_BUSINESS_DIR/.." && pwd)"

echo "=== Business OS Bootstrap ==="
echo "  Project root: $PROJECT_ROOT"
echo "  .ai.biz: $AI_BUSINESS_DIR"

# ── Create .cursorrules ─────────────────────────────────────────────
CURSORRULES_TEMPLATE="$AI_BUSINESS_DIR/templates/cursorrules.template"
if [[ -f "$PROJECT_ROOT/.cursorrules" ]]; then
  echo "  SKIP: .cursorrules already exists (remove it first to regenerate)"
else
  if [[ -f "$CURSORRULES_TEMPLATE" ]]; then
    cp "$CURSORRULES_TEMPLATE" "$PROJECT_ROOT/.cursorrules"
    echo "  CREATED: .cursorrules"
  fi
fi

# ── Create .work.biz/ skeleton ─────────────────────────────────
WORK_DIR="$PROJECT_ROOT/.work.biz"

if [[ -d "$WORK_DIR" ]]; then
  echo "  EXISTS: .work.biz/ (not overwriting)"
else
  mkdir -p "$WORK_DIR/context"
  mkdir -p "$WORK_DIR/plans"
  mkdir -p "$WORK_DIR/pipeline"
  mkdir -p "$WORK_DIR/research"
  mkdir -p "$WORK_DIR/drafts"

  # Copy template files
  TEMPLATES_WORK="$AI_BUSINESS_DIR/templates/work"
  if [[ -f "$TEMPLATES_WORK/context/HANDOFF.md.template" ]]; then
    cp "$TEMPLATES_WORK/context/HANDOFF.md.template" "$WORK_DIR/context/HANDOFF.md"
  fi
  if [[ -f "$TEMPLATES_WORK/plans/NEXT.md.template" ]]; then
    cp "$TEMPLATES_WORK/plans/NEXT.md.template" "$WORK_DIR/plans/NEXT.md"
  fi
  if [[ -f "$TEMPLATES_WORK/plans/UNKNOWNS.md.template" ]]; then
    cp "$TEMPLATES_WORK/plans/UNKNOWNS.md.template" "$WORK_DIR/plans/UNKNOWNS.md"
  fi
  if [[ -f "$TEMPLATES_WORK/pipeline/pipeline_tracker.md.template" ]]; then
    cp "$TEMPLATES_WORK/pipeline/pipeline_tracker.md.template" "$WORK_DIR/pipeline/pipeline_tracker.md"
  fi
  if [[ -f "$TEMPLATES_WORK/research/research_index.md.template" ]]; then
    cp "$TEMPLATES_WORK/research/research_index.md.template" "$WORK_DIR/research/research_index.md"
  fi
  if [[ -f "$TEMPLATES_WORK/README.md.template" ]]; then
    cp "$TEMPLATES_WORK/README.md.template" "$WORK_DIR/README.md"
  fi

  echo "  CREATED: .work.biz/ skeleton"
fi

echo ""
echo "=== Bootstrap complete ==="
echo ""
echo "Next steps:"
echo "  1. Edit .cursorrules — replace every REPLACE: token with your info"
echo "  2. Run @biz-strategy greenfield to define your business strategy"
echo "  3. Run @session-biz start to open your first session"
