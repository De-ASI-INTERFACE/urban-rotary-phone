#!/bin/bash
# De-ASI-INTERFACE — Install git hooks into a target repo
# Usage: bash scripts/install_hooks.sh /path/to/repo

REPO_PATH=${1:-"."}
HOOKS_DIR="$(dirname "$0")/../hooks"
TARGET_HOOKS="$REPO_PATH/.git/hooks"

if [ ! -d "$REPO_PATH/.git" ]; then
  echo "ERROR: $REPO_PATH is not a git repository."
  exit 1
fi

for HOOK in pre-commit pre-push commit-msg; do
  SRC="$HOOKS_DIR/$HOOK"
  DEST="$TARGET_HOOKS/$HOOK"
  if [ -f "$SRC" ]; then
    cp "$SRC" "$DEST"
    chmod +x "$DEST"
    echo "[INSTALLED] $HOOK -> $DEST"
  fi
done

echo ""
echo "All hooks installed in $REPO_PATH"
