#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"
VERSION=$(grep -E '^version:' copilot-plugin.yml | head -n1 | sed -E "s/version:[[:space:]]*//; s/[\"'\'']//g")
ARTIFACT="plugin-$VERSION.zip"
rm -f "$ARTIFACT"
zip -r "$ARTIFACT" copilot-plugin.yml src README.md LICENSE -x "*.git*" "*/.DS_Store"
echo "$ARTIFACT"
