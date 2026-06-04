#!/bin/bash
# De-ASI-INTERFACE — Python FastAPI service deploy
# Usage: bash scripts/deploy_python.sh /path/to/python-service [module:app]

REPO=${1:-"."}
APP=${2:-"api.server:app"}
cd "$REPO" || exit 1

echo "[DEPLOY] Installing Python dependencies..."
pip install -r requirements.txt

if [ $? -ne 0 ]; then
  echo "[ERROR] Dependency install failed."
  exit 1
fi

echo "[DEPLOY] Starting uvicorn: $APP"
uvicorn "$APP" --host 0.0.0.0 --port 8000 --workers 2 &
echo "[OK] FastAPI running on port 8000 (PID $!)"
