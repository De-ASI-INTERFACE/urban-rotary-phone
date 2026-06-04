#!/bin/bash
# De-ASI-INTERFACE — Next.js production build and start
# Usage: bash scripts/deploy_nextjs.sh /path/to/nextjs-repo

REPO=${1:-"."}
cd "$REPO" || exit 1

echo "[DEPLOY] Installing dependencies..."
npm ci

echo "[DEPLOY] Building Next.js app..."
npm run build

if [ $? -ne 0 ]; then
  echo "[ERROR] Build failed. Aborting deploy."
  exit 1
fi

echo "[DEPLOY] Starting Next.js server..."
npm run start &
echo "[OK] Next.js running on port 3000 (PID $!)"
