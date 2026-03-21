#!/bin/bash
# Weather Skill Example - Fetch weather from wttr.in

set -e

LOCATION="${1:-}"
DAYS="${2:-1}"

if [ -z "$LOCATION" ]; then
    echo "Usage: weather [city]"
    echo "Example: weather Shanghai"
    exit 1
fi

echo "🌤️  Weather for: $LOCATION"
echo ""

# Fetch from wttr.in
curl -s "wttr.in/$LOCATION?format=3" 2>/dev/null || echo "Could not fetch weather"

echo ""
echo "💡 Tip: Use --days N for multi-day forecast (not implemented in this example)"
