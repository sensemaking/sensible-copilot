#!/usr/bin/env bash
set -euo pipefail
if ! grep -E '^name:' copilot-plugin.yml >/dev/null; then echo "Missing name"; exit 1; fi
if ! grep -E '^id:' copilot-plugin.yml >/dev/null; then echo "Missing id"; exit 1; fi
if ! grep -E '^version:' copilot-plugin.yml >/dev/null; then echo "Missing version"; exit 1; fi
echo "Manifest OK"
