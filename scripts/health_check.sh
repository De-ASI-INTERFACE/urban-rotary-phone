#!/bin/bash
# De-ASI-INTERFACE — Ecosystem health check
# Iteratively pings all key endpoints

ENDPOINTS=(
  "https://api.mainnet-beta.solana.com"
  "https://price.jup.ag/v4/price?ids=SOL"
  "http://localhost:8000/health"
  "http://localhost:3000"
)

NAMES=(
  "Solana Mainnet RPC"
  "Jupiter Price API"
  "LWC FastAPI (local)"
  "Trade-by-Second Site (local)"
)

echo "De-ASI-INTERFACE Health Check — $(date)"
echo "-------------------------------------------"

for i in "${!ENDPOINTS[@]}"; do
  URL="${ENDPOINTS[$i]}"
  NAME="${NAMES[$i]}"
  STATUS=$(curl -o /dev/null -s -w "%{http_code}" --max-time 5 "$URL" 2>/dev/null)
  if [ "$STATUS" -lt 400 ] 2>/dev/null; then
    echo "✅ $NAME — HTTP $STATUS"
  else
    echo "❌ $NAME — HTTP $STATUS (or unreachable)"
  fi
done

echo "-------------------------------------------"
echo "Done."
